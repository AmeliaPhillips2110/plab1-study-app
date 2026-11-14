import { Link, useNavigate } from 'react-router-dom'
import { Button } from '@/components/ui/Button'
import {
  buildSessionDebrief,
  stashRedoQuestionIds,
  type SessionDebriefModel,
} from '@/modules/shared/quiz-engine/sessionDebrief'
import type { QuestionWithOptions } from '@/types/database'
import type { LocalAttempt } from '@/types/quiz'

type SoftAttempt = {
  questionId: string
  result: string
  mistakeTags?: string[] | null
}

type Props = {
  attempts: SoftAttempt[] | LocalAttempt[]
  questions: QuestionWithOptions[]
  topicNameById: Record<string, string>
  percent: number
  passMark?: number
  /** Optional title above takeaways (defaults to Debrief). */
  title?: string
  /** Extra secondary links under the primary CTA. */
  secondaryLinks?: { to: string; label: string }[]
  /** When set, redo remounts in-place instead of navigating. */
  onRedoWrongs?: (questionIds: string[]) => void
}

export function SessionDebrief({
  attempts,
  questions,
  topicNameById,
  percent,
  passMark = 65,
  title = 'Debrief',
  secondaryLinks,
  onRedoWrongs,
}: Props) {
  const navigate = useNavigate()
  const model: SessionDebriefModel = buildSessionDebrief({
    attempts,
    questions,
    topicNameById,
    percent,
    passMark,
  })
  const canRedo = model.wrongQuestionIds.length > 0

  function handleRedo() {
    if (!canRedo) return
    if (onRedoWrongs) {
      onRedoWrongs(model.wrongQuestionIds)
      return
    }
    stashRedoQuestionIds(model.wrongQuestionIds)
    navigate('/study/redo-wrongs')
  }

  return (
    <section className="flex flex-col gap-3" aria-label="Session debrief">
      <h3 className="font-display text-lg font-semibold text-accent">{title}</h3>
      <ol className="flex flex-col gap-1.5 text-sm">
        {model.takeaways.map((t, i) => (
          <li key={t.key} className="flex gap-2 leading-snug">
            <span className="tabular-nums text-muted">{i + 1}.</span>
            <span>{t.text}</span>
          </li>
        ))}
      </ol>
      <div className="flex flex-wrap items-center gap-2 pt-1">
        {canRedo ? (
          <Button type="button" onClick={handleRedo}>
            Redo only wrongs
          </Button>
        ) : (
          <p className="text-sm text-muted">Nothing to redo — clean set.</p>
        )}
        {(secondaryLinks ?? []).map((l) => (
          <Link
            key={l.to}
            to={l.to}
            className="inline-flex items-center rounded-md border border-border bg-surface px-3 py-2 text-sm font-medium hover:bg-accent-subtle"
          >
            {l.label}
          </Link>
        ))}
      </div>
    </section>
  )
}

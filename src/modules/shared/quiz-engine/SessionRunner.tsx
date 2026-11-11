import { useEffect, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { Button } from '@/components/ui/Button'
import { QuestionView } from '@/modules/shared/quiz-engine/QuestionView'
import {
  createStudySession,
  finishStudySession,
  saveAttempt,
  updateSpacedRepetition,
} from '@/modules/shared/quiz-engine/persist'
import { selectQuestionsForSession } from '@/modules/shared/quiz-engine/selectQuestions'
import { summariseAttempts } from '@/modules/shared/quiz-engine/scoring'
import { saveMistakeTags } from '@/features/mistakes'
import type { QuestionWithOptions } from '@/types/database'
import type { LocalAttempt, SessionSetupConfig } from '@/types/quiz'
import { FORMAT_LABELS, SESSION_TYPE_LABELS } from '@/types/quiz'

type Props = {
  userId: string
  config: SessionSetupConfig
  onExit?: () => void
}

type Phase = 'loading' | 'running' | 'summary' | 'error'

export function SessionRunner({ userId, config, onExit }: Props) {
  const [phase, setPhase] = useState<Phase>('loading')
  const [error, setError] = useState<string | null>(null)
  const [questions, setQuestions] = useState<QuestionWithOptions[]>([])
  const [sessionId, setSessionId] = useState<string | null>(null)
  const [index, setIndex] = useState(0)
  const [attempts, setAttempts] = useState<LocalAttempt[]>([])
  const [saving, setSaving] = useState(false)
  const [finalPercent, setFinalPercent] = useState<number | null>(null)
  const startedAt = useRef<number>(Date.now())
  const bootstrapped = useRef(false)

  useEffect(() => {
    if (bootstrapped.current) return
    bootstrapped.current = true

    void (async () => {
      const selected = await selectQuestionsForSession(config, userId)
      if (selected.error || selected.questions.length === 0) {
        setError(selected.error ?? 'No questions available for this session.')
        setPhase('error')
        return
      }

      const created = await createStudySession({
        userId,
        config,
        questionCount: selected.questions.length,
      })
      if (created.error || !created.sessionId) {
        setError(created.error ?? 'Could not start session.')
        setPhase('error')
        return
      }

      setQuestions(selected.questions)
      setSessionId(created.sessionId)
      startedAt.current = Date.now()
      setPhase('running')
    })()
  }, [config, userId])

  async function handleSubmit(args: {
    result: LocalAttempt['result']
    selectedOptionId: string | null
    payload: LocalAttempt['responsePayload']
    timeSpentMs?: number | null
  }) {
    if (!sessionId) return
    const q = questions[index]
    if (!q) return
    setSaving(true)
    const timeSpentMs = args.timeSpentMs ?? Date.now() - startedAt.current
    const attempt: LocalAttempt = {
      questionId: q.id,
      selectedOptionId: args.selectedOptionId,
      result: args.result,
      responsePayload: args.payload,
      timeSpentMs,
    }

    const save = await saveAttempt({
      sessionId,
      examId: config.examId,
      userId,
      questionId: q.id,
      selectedOptionId: args.selectedOptionId,
      result: args.result,
      responsePayload: args.payload,
      timeSpentMs,
    })
    if (save.error || !save.attemptId) {
      setError(save.error ?? 'Could not save attempt.')
      setSaving(false)
      return
    }

    if (
      (args.result === 'incorrect' || args.result === 'partial') &&
      args.payload.mistakeTags &&
      args.payload.mistakeTags.length > 0
    ) {
      const tagErr = await saveMistakeTags({
        attemptId: save.attemptId,
        tags: args.payload.mistakeTags.map((tag) => ({
          tag,
          note: args.payload.mistakeNote ?? null,
          source: 'manual',
        })),
      })
      if (tagErr.error) {
        setError(tagErr.error)
        setSaving(false)
        return
      }
    }

    await updateSpacedRepetition({
      userId,
      examId: config.examId,
      questionId: q.id,
      grade: args.payload.grade,
      result: args.result,
    })

    const nextAttempts = [...attempts, attempt]
    setAttempts(nextAttempts)
    setSaving(false)

    if (index + 1 >= questions.length) {
      const finished = await finishStudySession({ sessionId, attempts: nextAttempts })
      setFinalPercent(finished.percent)
      setPhase('summary')
      return
    }

    setIndex((i) => i + 1)
    startedAt.current = Date.now()
  }

  if (phase === 'loading') {
    return <p className="text-sm text-muted">Preparing your session…</p>
  }

  if (phase === 'error') {
    return (
      <div className="flex flex-col gap-3">
        <p className="text-sm text-incorrect">{error}</p>
        <div className="flex gap-2">
          <Link className="text-sm text-accent hover:underline" to="/study">
            Back to study setup
          </Link>
          {onExit ? (
            <Button variant="ghost" onClick={onExit}>
              Close
            </Button>
          ) : null}
        </div>
      </div>
    )
  }

  if (phase === 'summary') {
    const stats = summariseAttempts(attempts)
    return (
      <div className="flex max-w-xl flex-col gap-4 rounded-md border border-border bg-surface p-4">
        <h2 className="text-xl font-semibold">Session complete</h2>
        <p className="text-sm text-muted">
          {SESSION_TYPE_LABELS[config.sessionType]} · {FORMAT_LABELS[config.presentationFormat]}
        </p>
        <dl className="grid grid-cols-2 gap-3 text-sm sm:grid-cols-4">
          <Stat label="Score" value={`${finalPercent ?? stats.percent}%`} />
          <Stat label="Correct" value={String(stats.correct)} />
          <Stat label="Incorrect" value={String(stats.incorrect)} />
          <Stat label="Skipped" value={String(stats.skipped)} />
        </dl>
        <div className="flex flex-wrap gap-2">
          <Link
            to="/study"
            className="inline-flex items-center rounded-md bg-accent px-3 py-2 text-sm font-medium text-white hover:bg-accent-hover"
          >
            New session
          </Link>
          <Link
            to="/attempts"
            className="inline-flex items-center rounded-md border border-border bg-surface px-3 py-2 text-sm font-medium hover:bg-accent-subtle"
          >
            Attempt log
          </Link>
          <Link
            to="/"
            className="inline-flex items-center rounded-md border border-border bg-surface px-3 py-2 text-sm font-medium hover:bg-accent-subtle"
          >
            Study home
          </Link>
        </div>
      </div>
    )
  }

  const current = questions[index]
  if (!current) return null

  return (
    <div className="flex flex-col gap-4">
      <div className="flex flex-wrap items-center justify-between gap-2 text-sm text-muted">
        <span>
          {SESSION_TYPE_LABELS[config.sessionType]} · {FORMAT_LABELS[config.presentationFormat]}
        </span>
        <Link to="/study" className="text-accent hover:underline">
          Exit
        </Link>
      </div>
      {saving ? <p className="text-xs text-muted">Saving attempt…</p> : null}
      {error ? <p className="text-sm text-incorrect">{error}</p> : null}
      <QuestionView
        key={current.id}
        question={current}
        format={config.presentationFormat}
        rapidFireSeconds={config.rapidFireSeconds ?? 15}
        index={index}
        total={questions.length}
        onSubmit={(args) =>
          void handleSubmit({
            result: args.result,
            selectedOptionId: args.selectedOptionId,
            payload: args.payload,
            timeSpentMs: args.timeSpentMs,
          })
        }
      />
    </div>
  )
}

function Stat({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded border border-border px-3 py-2">
      <dt className="text-xs text-muted">{label}</dt>
      <dd className="text-lg font-semibold">{value}</dd>
    </div>
  )
}

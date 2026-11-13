import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { Badge } from '@/components/ui/Badge'
import { Button } from '@/components/ui/Button'
import { MistakeTagPicker, loadMistakeTagsForAttempts, saveMistakeTags } from '@/features/mistakes'
import { suggestMistakeTags, type MistakeTagCode } from '@/features/mistakes/tags'
import { FatigueChart } from '@/modules/shared/quiz-engine/mock/FatigueChart'
import { PaceWidget } from '@/modules/shared/quiz-engine/mock/PaceWidget'
import { formatDuration } from '@/modules/shared/quiz-engine/pace'
import type { QuestionWithOptions } from '@/types/database'
import type { MockProgressState, TimedMode } from '@/types/quiz'

type Props = {
  mode: TimedMode
  questions: QuestionWithOptions[]
  progress: MockProgressState
  percent: number
  correct: number
  answered: number
  passed: boolean
  passMark: number
  elapsedSec: number
  attemptIdByQuestionId: Record<string, string>
}

const FILTERS = [
  { id: 'all', label: 'All' },
  { id: 'correct', label: 'Correct' },
  { id: 'incorrect', label: 'Incorrect' },
  { id: 'flagged', label: 'Flagged' },
  { id: 'skipped', label: 'New' },
] as const

export function MockReview({
  mode,
  questions,
  progress,
  percent,
  correct,
  answered,
  passed,
  passMark,
  elapsedSec,
  attemptIdByQuestionId,
}: Props) {
  const [filter, setFilter] = useState<(typeof FILTERS)[number]['id']>('all')
  const [tagMap, setTagMap] = useState<Record<string, string[]>>({})
  const [noteMap, setNoteMap] = useState<Record<string, string>>({})
  const [openExplain, setOpenExplain] = useState<Record<string, boolean>>({})

  const incorrect = Math.max(0, answered - correct)
  const unanswered = Math.max(0, questions.length - answered)

  useEffect(() => {
    const ids = Object.values(attemptIdByQuestionId)
    void loadMistakeTagsForAttempts(ids).then((map) => {
      const nextTags: Record<string, string[]> = {}
      const nextNotes: Record<string, string> = {}
      for (const [attemptId, rows] of Object.entries(map)) {
        nextTags[attemptId] = rows.map((r) => r.tag)
        const withNote = rows.find((r) => r.note)
        if (withNote?.note) nextNotes[attemptId] = withNote.note
      }
      setTagMap(nextTags)
      setNoteMap(nextNotes)
    })
  }, [attemptIdByQuestionId])

  const items = useMemo(() => {
    return questions
      .map((q, index) => {
        const selected = progress.answers[q.id] ?? null
        const correctOpt = q.question_options.find((o) => o.is_correct)
        const result = !selected
          ? 'skipped'
          : selected === correctOpt?.id
            ? 'correct'
            : 'incorrect'
        const isFlagged = progress.flagged.includes(q.id)
        const attemptId = attemptIdByQuestionId[q.id] ?? null
        return { q, index, selected, correctOpt, result, isFlagged, attemptId }
      })
      .filter((item) => {
        if (filter === 'all') return true
        if (filter === 'correct') return item.result === 'correct'
        if (filter === 'incorrect') return item.result === 'incorrect'
        if (filter === 'flagged') return item.isFlagged
        return item.result === 'skipped'
      })
  }, [questions, progress, filter, attemptIdByQuestionId])

  const unansweredIndices = useMemo(
    () =>
      questions
        .map((q, i) => ({ q, i }))
        .filter(({ q }) => !progress.answers[q.id])
        .map(({ i }) => i),
    [questions, progress.answers],
  )

  const totalForBar = Math.max(questions.length, 1)
  const correctPct = (correct / totalForBar) * 100
  const incorrectPct = (incorrect / totalForBar) * 100
  const newPct = (unanswered / totalForBar) * 100

  return (
    <div className="flex w-full flex-col gap-6">
      <section className="rounded-md border border-border bg-surface p-4">
        <h2 className="font-display text-xl font-semibold">
          {mode === 'full_mock' ? 'Mock Complete' : 'Unlimited Complete'}
        </h2>
        <div className="mt-3 flex flex-wrap gap-2">
          <Badge tone={passed ? 'correct' : 'incorrect'}>
            {passed ? 'At/Above Pass Mark' : 'Below Pass Mark'} ({passMark}%)
          </Badge>
          <Badge tone="accent">{percent}%</Badge>
          <Badge>Time Used {formatDuration(elapsedSec)}</Badge>
        </div>

        <FatigueChart
          totalQuestions={questions.length}
          elapsedSec={elapsedSec}
          paceSamples={progress.paceSamples}
          unansweredIndices={unansweredIndices}
        />

        <div className="mt-4">
          <div className="mb-1 flex flex-wrap justify-between gap-2 text-sm">
            <span className="font-medium">Results</span>
            <span className="tabular-nums text-muted">{percent}%</span>
          </div>
          <div className="flex h-3 overflow-hidden rounded-full border border-border">
            <div className="h-full bg-correct" style={{ width: `${correctPct}%` }} title="Correct" />
            <div
              className="h-full bg-incorrect"
              style={{ width: `${incorrectPct}%` }}
              title="Incorrect"
            />
            <div className="h-full bg-neutral-300" style={{ width: `${newPct}%` }} title="New" />
          </div>
          <dl className="mt-3 grid grid-cols-2 gap-2 text-sm sm:grid-cols-4">
            <div className="rounded border border-border px-3 py-2">
              <dt className="text-xs text-muted">Answered</dt>
              <dd className="text-lg font-semibold">{answered}</dd>
            </div>
            <div className="rounded border border-correct/40 bg-correct/10 px-3 py-2">
              <dt className="text-xs text-muted">Correct</dt>
              <dd className="text-lg font-semibold text-correct">{correct}</dd>
            </div>
            <div className="rounded border border-incorrect/40 bg-incorrect/10 px-3 py-2">
              <dt className="text-xs text-muted">Incorrect</dt>
              <dd className="text-lg font-semibold text-incorrect">{incorrect}</dd>
            </div>
            <div className="rounded border border-border px-3 py-2">
              <dt className="text-xs text-muted">New</dt>
              <dd className="text-lg font-semibold">{unanswered}</dd>
            </div>
          </dl>
        </div>
      </section>

      <section>
        <h3 className="mb-2 font-display text-lg font-semibold">Pace Report</h3>
        <PaceWidget
          elapsedSec={elapsedSec}
          timeLimitSec={progress.timeLimitSec}
          answeredCount={answered}
          totalQuestions={questions.length}
        />
      </section>

      <section className="flex flex-col gap-3">
        <div className="flex flex-wrap items-center justify-between gap-2">
          <h3 className="font-display text-lg font-semibold">Review</h3>
          <div className="flex flex-wrap gap-2">
            {FILTERS.map((f) => (
              <Button
                key={f.id}
                variant={filter === f.id ? 'primary' : 'secondary'}
                onClick={() => setFilter(f.id)}
              >
                {f.label}
              </Button>
            ))}
          </div>
        </div>

        {items.length === 0 ? (
          <p className="text-sm text-muted">Nothing in this filter.</p>
        ) : (
          <ul className="flex flex-col gap-4">
            {items.map(({ q, index, selected, correctOpt, result, isFlagged, attemptId }) => {
              const selectedOpt = q.question_options.find((o) => o.id === selected)
              const suggested =
                result === 'incorrect'
                  ? suggestMistakeTags({ result: 'incorrect' })
                  : ([] as MistakeTagCode[])
              const explainOpen = Boolean(openExplain[q.id])
              return (
                <li key={q.id} className="rounded-md border border-border bg-surface p-4">
                  <div className="mb-2 flex flex-wrap gap-2">
                    <Badge>Q{index + 1}</Badge>
                    <Badge
                      tone={
                        result === 'correct'
                          ? 'correct'
                          : result === 'incorrect'
                            ? 'incorrect'
                            : 'neutral'
                      }
                    >
                      {result === 'skipped' ? 'New' : result === 'correct' ? 'Correct' : 'Incorrect'}
                    </Badge>
                    {isFlagged ? <Badge tone="incorrect">Flagged</Badge> : null}
                  </div>
                  <p className="mb-3 whitespace-pre-wrap text-sm">{q.stem}</p>
                  <ul className="mb-3 flex flex-col gap-1 text-sm">
                    {q.question_options.map((o) => {
                      const isSel = o.id === selected
                      const isCor = o.is_correct
                      return (
                        <li
                          key={o.id}
                          className={
                            isCor
                              ? 'rounded border border-correct/40 bg-correct/10 px-2 py-1'
                              : isSel
                                ? 'rounded border border-incorrect/40 bg-incorrect/10 px-2 py-1'
                                : 'rounded border border-border px-2 py-1'
                          }
                        >
                          <span className="font-semibold">{o.label}.</span> {o.body}
                          {isCor ? ' ✓' : ''}
                          {isSel && !isCor ? ' (Your Answer)' : ''}
                          {isSel && isCor ? ' (Your Answer)' : ''}
                        </li>
                      )
                    })}
                  </ul>
                  {selectedOpt || correctOpt ? (
                    <p className="mb-2 text-xs text-muted">
                      You Chose {selectedOpt ? selectedOpt.label : 'Nothing'} · Best Answer{' '}
                      {correctOpt?.label ?? '—'}
                    </p>
                  ) : null}
                  {q.explanation ? (
                    <div className="mb-3 text-sm">
                      <button
                        type="button"
                        className="rounded border border-dashed border-accent/50 px-2 py-1 font-medium text-accent hover:bg-accent-subtle"
                        onClick={() =>
                          setOpenExplain((prev) => ({ ...prev, [q.id]: !prev[q.id] }))
                        }
                      >
                        {explainOpen ? 'Hide Explanation' : 'Show Explanation'}
                      </button>
                      {explainOpen ? (
                        <p className="mt-2 whitespace-pre-wrap text-muted">{q.explanation}</p>
                      ) : null}
                    </div>
                  ) : null}
                  {result === 'incorrect' && attemptId ? (
                    <MistakeTagPicker
                      suggested={suggested}
                      initialSelected={tagMap[attemptId] ?? []}
                      initialNote={noteMap[attemptId] ?? ''}
                      onSave={async (tags, note) => {
                        await saveMistakeTags({
                          attemptId,
                          tags: tags.map((tag) => ({ tag, note: note || null, source: 'manual' })),
                        })
                        setTagMap((prev) => ({ ...prev, [attemptId]: tags }))
                        setNoteMap((prev) => ({ ...prev, [attemptId]: note }))
                      }}
                    />
                  ) : null}
                </li>
              )
            })}
          </ul>
        )}
      </section>

      <div className="flex flex-wrap gap-2">
        <Link
          to="/tests"
          className="inline-flex items-center rounded-md bg-accent px-3 py-2 text-sm font-medium text-white hover:bg-accent-hover"
        >
          Tests Hub
        </Link>
        <Link
          to="/study"
          className="inline-flex items-center rounded-md border border-border bg-surface px-3 py-2 text-sm font-medium hover:bg-accent-subtle"
        >
          Study Hub
        </Link>
        <Link
          to="/attempts"
          className="inline-flex items-center rounded-md border border-border bg-surface px-3 py-2 text-sm font-medium hover:bg-accent-subtle"
        >
          Attempt Log
        </Link>
        <Link
          to="/"
          className="inline-flex items-center rounded-md border border-border bg-surface px-3 py-2 text-sm font-medium hover:bg-accent-subtle"
        >
          Home
        </Link>
        <Link
          to="/kpis"
          className="inline-flex items-center rounded-md border border-border bg-surface px-3 py-2 text-sm font-medium hover:bg-accent-subtle"
        >
          KPIs
        </Link>
        <Link
          to="/glossary"
          className="inline-flex items-center rounded-md border border-border bg-surface px-3 py-2 text-sm font-medium hover:bg-accent-subtle"
        >
          Glossary
        </Link>
      </div>
    </div>
  )
}

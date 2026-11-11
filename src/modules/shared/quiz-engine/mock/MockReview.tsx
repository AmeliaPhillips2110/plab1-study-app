import { Badge } from '@/components/ui/Badge'
import { Button } from '@/components/ui/Button'
import { PaceWidget } from '@/modules/shared/quiz-engine/mock/PaceWidget'
import { computePace, formatDuration } from '@/modules/shared/quiz-engine/pace'
import type { QuestionWithOptions } from '@/types/database'
import type { MockProgressState, TimedMode } from '@/types/quiz'
import { Link } from 'react-router-dom'
import { useMemo, useState } from 'react'

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
}

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
}: Props) {
  const [filter, setFilter] = useState<'all' | 'incorrect' | 'flagged' | 'skipped'>('all')
  const pace = computePace({
    elapsedSec,
    timeLimitSec: progress.timeLimitSec,
    answeredCount: answered,
    totalQuestions: questions.length,
  })

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
        return { q, index, selected, correctOpt, result, isFlagged }
      })
      .filter((item) => {
        if (filter === 'all') return true
        if (filter === 'incorrect') return item.result === 'incorrect'
        if (filter === 'flagged') return item.isFlagged
        return item.result === 'skipped'
      })
  }, [questions, progress, filter])

  return (
    <div className="flex flex-col gap-6">
      <section className="rounded-md border border-border bg-surface p-4">
        <h2 className="text-xl font-semibold">
          {mode === 'full_mock' ? 'Mock complete' : 'As-many-as-you-can complete'}
        </h2>
        <div className="mt-3 flex flex-wrap gap-2">
          <Badge tone={passed ? 'correct' : 'incorrect'}>
            {passed ? 'At/above pass mark' : 'Below pass mark'} ({passMark}%)
          </Badge>
          <Badge tone="accent">{percent}%</Badge>
          <Badge>
            {correct}/{answered || questions.length} correct of answered
          </Badge>
          <Badge>Time used {formatDuration(elapsedSec)}</Badge>
        </div>
      </section>

      <section>
        <h3 className="mb-2 text-lg font-semibold">Pace report</h3>
        <PaceWidget
          elapsedSec={elapsedSec}
          timeLimitSec={progress.timeLimitSec}
          answeredCount={answered}
          totalQuestions={questions.length}
        />
        <p className="mt-2 text-sm text-muted">
          Ideal pace was about {formatDuration(Math.round(pace.idealSecPerQ))} per question. You
          finished {pace.status === 'ahead' ? 'ahead of' : pace.status === 'behind' ? 'behind' : 'on'}{' '}
          that curve
          {pace.projectedFinishSec != null
            ? ` (projected finish ~${formatDuration(Math.round(pace.projectedFinishSec))} at your average).`
            : '.'}
        </p>
      </section>

      <section className="flex flex-col gap-3">
        <div className="flex flex-wrap items-center justify-between gap-2">
          <h3 className="text-lg font-semibold">Review</h3>
          <div className="flex flex-wrap gap-2">
            {(['all', 'incorrect', 'flagged', 'skipped'] as const).map((f) => (
              <Button
                key={f}
                variant={filter === f ? 'primary' : 'secondary'}
                onClick={() => setFilter(f)}
              >
                {f}
              </Button>
            ))}
          </div>
        </div>

        {items.length === 0 ? (
          <p className="text-sm text-muted">Nothing in this filter.</p>
        ) : (
          <ul className="flex flex-col gap-4">
            {items.map(({ q, index, selected, correctOpt, result, isFlagged }) => {
              const selectedOpt = q.question_options.find((o) => o.id === selected)
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
                      {result}
                    </Badge>
                    {isFlagged ? <Badge tone="accent">Flagged</Badge> : null}
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
                          {isSel && !isCor ? ' (your answer)' : ''}
                          {isSel && isCor ? ' (your answer)' : ''}
                        </li>
                      )
                    })}
                  </ul>
                  {selectedOpt || correctOpt ? (
                    <p className="mb-2 text-xs text-muted">
                      You chose {selectedOpt ? selectedOpt.label : 'nothing'} · Best answer{' '}
                      {correctOpt?.label ?? '—'}
                    </p>
                  ) : null}
                  {q.explanation ? (
                    <div className="rounded border border-border bg-bg p-3 text-sm">
                      <p className="mb-1 font-medium">Explanation</p>
                      <p className="whitespace-pre-wrap text-muted">{q.explanation}</p>
                    </div>
                  ) : null}
                </li>
              )
            })}
          </ul>
        )}
      </section>

      <div className="flex flex-wrap gap-2">
        <Link
          to="/mock"
          className="inline-flex items-center rounded-md bg-accent px-3 py-2 text-sm font-medium text-white hover:bg-accent-hover"
        >
          Another timed test
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

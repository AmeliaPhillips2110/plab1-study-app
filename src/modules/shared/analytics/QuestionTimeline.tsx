import { useEffect, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { Badge } from '@/components/ui/Badge'
import { MISTAKE_TAG_LABELS } from '@/features/mistakes'
import { cn } from '@/lib/cn'
import { formatDateTime } from '@/lib/dates'
import {
  fetchQuestionTimeline,
  type AttemptLogRow,
} from '@/modules/shared/analytics/attemptQueries'
import { SESSION_TYPE_LABELS } from '@/types/quiz'

type Props = {
  userId: string
  examId: string
  questionId: string
}

function titleTone(result: string): string {
  if (result === 'correct') return 'text-correct'
  if (result === 'incorrect' || result === 'partial') return 'text-incorrect'
  return 'text-neutral-400'
}

export function QuestionTimeline({ userId, examId, questionId }: Props) {
  const [searchParams] = useSearchParams()
  const highlightId = searchParams.get('highlight')
  const [rows, setRows] = useState<AttemptLogRow[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    void (async () => {
      setLoading(true)
      const { rows: data, error: err } = await fetchQuestionTimeline({
        userId,
        examId,
        questionId,
      })
      setRows(data)
      setError(err)
      setLoading(false)
    })()
  }, [userId, examId, questionId])

  useEffect(() => {
    if (!highlightId || loading) return
    const el = document.getElementById(`attempt-${highlightId}`)
    el?.scrollIntoView({ behavior: 'smooth', block: 'center' })
  }, [highlightId, loading, rows])

  const stem = rows[0]?.questions?.stem

  return (
    <div className="flex flex-col gap-4">
      <div>
        <Link to="/attempts?scope=questions" className="text-sm text-accent hover:underline">
          ← Attempt Log
        </Link>
        <h2 className="mt-2 font-display text-lg font-semibold">Question Timeline</h2>
        {stem ? (
          <p className={cn('mt-2 whitespace-pre-wrap text-sm font-medium', titleTone(rows[rows.length - 1]?.result ?? 'skipped'))}>
            {stem}
          </p>
        ) : null}
      </div>

      {loading ? <p className="text-sm text-muted">Loading Timeline…</p> : null}
      {error ? <p className="text-sm text-incorrect">{error}</p> : null}
      {!loading && rows.length === 0 ? (
        <p className="text-sm text-muted">No Attempts For This Question Yet.</p>
      ) : null}

      <ol className="relative flex flex-col gap-4 border-l border-border pl-4">
        {rows.map((r, i) => {
          const highlighted = highlightId === r.id
          return (
            <li key={r.id} id={`attempt-${r.id}`} className="relative">
              <span
                className={cn(
                  'absolute -left-[1.35rem] top-1.5 h-2.5 w-2.5 rounded-full',
                  highlighted
                    ? 'ring-2 ring-accent ring-offset-2'
                    : '',
                  r.result === 'correct'
                    ? 'bg-correct'
                    : r.result === 'incorrect'
                      ? 'bg-incorrect'
                      : 'bg-neutral-400',
                )}
              />
              <div
                className={cn(
                  'rounded-md border bg-surface p-3',
                  highlighted ? 'border-accent ring-2 ring-accent/40' : 'border-border',
                )}
              >
                <div className="mb-1 flex flex-wrap gap-2">
                  <Badge tone="accent">#{i + 1}</Badge>
                  {highlighted ? <Badge tone="accent">This Attempt</Badge> : null}
                  <Badge
                    tone={
                      r.result === 'correct'
                        ? 'correct'
                        : r.result === 'incorrect'
                          ? 'incorrect'
                          : 'neutral'
                    }
                  >
                    {r.result === 'skipped'
                      ? 'Skipped'
                      : r.result === 'correct'
                        ? 'Correct'
                        : 'Incorrect'}
                  </Badge>
                  {r.study_sessions?.session_type ? (
                    <Badge>
                      {SESSION_TYPE_LABELS[r.study_sessions.session_type] ??
                        r.study_sessions.session_type}
                    </Badge>
                  ) : null}
                </div>
                <p className="text-xs text-muted">{formatDateTime(r.answered_at)}</p>
                {r.mistake_tags.length > 0 ? (
                  <p className="mt-2 text-sm">
                    Tags:{' '}
                    {r.mistake_tags
                      .map(
                        (t) =>
                          MISTAKE_TAG_LABELS[t.tag as keyof typeof MISTAKE_TAG_LABELS] ?? t.tag,
                      )
                      .join(', ')}
                  </p>
                ) : (
                  <p className="mt-2 text-xs text-muted">No Mistake Tags On This Attempt.</p>
                )}
              </div>
            </li>
          )
        })}
      </ol>
    </div>
  )
}

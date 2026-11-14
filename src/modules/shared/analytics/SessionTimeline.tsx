import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { Badge } from '@/components/ui/Badge'
import { MISTAKE_TAG_LABELS } from '@/features/mistakes'
import { cn } from '@/lib/cn'
import { formatDateTime } from '@/lib/dates'
import {
  fetchSessionTimeline,
  type AttemptLogRow,
} from '@/modules/shared/analytics/attemptQueries'
import { SESSION_TYPE_LABELS } from '@/types/quiz'

type Props = {
  userId: string
  examId: string
  sessionId: string
}

function titleTone(result: string): string {
  if (result === 'correct') return 'text-correct'
  if (result === 'incorrect' || result === 'partial') return 'text-incorrect'
  if (result === 'skipped') return 'text-[#854d0e]'
  return 'text-muted'
}

export function SessionTimeline({ userId, examId, sessionId }: Props) {
  const [rows, setRows] = useState<AttemptLogRow[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    void (async () => {
      setLoading(true)
      const { rows: data, error: err } = await fetchSessionTimeline({
        userId,
        examId,
        sessionId,
      })
      setRows(data)
      setError(err)
      setLoading(false)
    })()
  }, [userId, examId, sessionId])

  const sessionType = rows[0]?.study_sessions?.session_type
  const score = rows[0]?.study_sessions?.score_percent

  return (
    <div className="flex flex-col gap-4">
      <div>
        <Link to="/attempts?scope=all" className="text-sm text-accent hover:underline">
          ← Attempt Log
        </Link>
        <h2 className="mt-2 font-display text-lg font-semibold">Session Timeline</h2>
        {sessionType ? (
          <p className="mt-1 text-sm text-muted">
            {SESSION_TYPE_LABELS[sessionType] ?? sessionType}
            {score != null ? ` · ${Number(score)}%` : ''} · {rows.length} Questions
          </p>
        ) : null}
      </div>

      {loading ? <p className="text-sm text-muted">Loading Timeline…</p> : null}
      {error ? <p className="text-sm text-incorrect">{error}</p> : null}
      {!loading && rows.length === 0 ? (
        <p className="text-sm text-muted">No Attempts In This Session.</p>
      ) : null}

      <ol className="relative flex flex-col gap-4 border-l border-border pl-4">
        {rows.map((r, i) => (
          <li key={r.id} className="relative">
            <span
              className={cn(
                'absolute -left-[1.35rem] top-1.5 h-2.5 w-2.5 rounded-full',
                r.result === 'correct'
                  ? 'bg-correct'
                  : r.result === 'incorrect'
                    ? 'bg-incorrect'
                    : r.result === 'skipped'
                      ? 'bg-[#eab308]'
                      : 'bg-neutral-400',
              )}
            />
            <div className="rounded-md border border-border bg-surface p-3">
              <div className="mb-1 flex flex-wrap gap-2">
                <Badge tone="accent">Q{i + 1}</Badge>
                <Badge
                  tone={
                    r.result === 'correct'
                      ? 'correct'
                      : r.result === 'incorrect'
                        ? 'incorrect'
                        : r.result === 'skipped'
                          ? 'skipped'
                          : 'neutral'
                  }
                >
                  {r.result === 'skipped'
                    ? 'Skipped'
                    : r.result === 'correct'
                      ? 'Correct'
                      : 'Incorrect'}
                </Badge>
              </div>
              <p className={cn('font-medium', titleTone(r.result))}>
                {r.questions?.stem?.slice(0, 160) ?? 'Untitled Question'}
                {(r.questions?.stem?.length ?? 0) > 160 ? '…' : ''}
              </p>
              <p className="mt-1 text-xs text-muted">{formatDateTime(r.answered_at)}</p>
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
              ) : null}
              <Link
                className="mt-2 inline-block text-xs text-accent hover:underline"
                to={`/attempts/question/${r.question_id}?highlight=${r.id}`}
              >
                Question Timeline
              </Link>
            </div>
          </li>
        ))}
      </ol>
    </div>
  )
}

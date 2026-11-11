import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { Badge } from '@/components/ui/Badge'
import { MISTAKE_TAG_LABELS } from '@/features/mistakes'
import {
  fetchQuestionTimeline,
  type AttemptLogRow,
} from '@/modules/shared/analytics/attemptQueries'
import { SESSION_TYPE_LABELS } from '@/types/quiz'
import { formatDateTime } from '@/lib/dates'

type Props = {
  userId: string
  examId: string
  questionId: string
}

export function QuestionTimeline({ userId, examId, questionId }: Props) {
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

  const stem = rows[0]?.questions?.stem

  return (
    <div className="flex flex-col gap-4">
      <div>
        <Link to="/attempts" className="text-sm text-accent hover:underline">
          ← Attempt log
        </Link>
        <h2 className="mt-2 text-lg font-semibold">Per-question timeline</h2>
        {stem ? <p className="mt-2 whitespace-pre-wrap text-sm text-muted">{stem}</p> : null}
      </div>

      {loading ? <p className="text-sm text-muted">Loading timeline…</p> : null}
      {error ? <p className="text-sm text-incorrect">{error}</p> : null}
      {!loading && rows.length === 0 ? (
        <p className="text-sm text-muted">No attempts for this question yet.</p>
      ) : null}

      <ol className="relative flex flex-col gap-4 border-l border-border pl-4">
        {rows.map((r, i) => (
          <li key={r.id} className="relative">
            <span className="absolute -left-[1.35rem] top-1.5 h-2.5 w-2.5 rounded-full bg-accent" />
            <div className="rounded-md border border-border bg-surface p-3">
              <div className="mb-1 flex flex-wrap gap-2">
                <Badge tone="accent">#{i + 1}</Badge>
                <Badge
                  tone={
                    r.result === 'correct'
                      ? 'correct'
                      : r.result === 'incorrect'
                        ? 'incorrect'
                        : 'neutral'
                  }
                >
                  {r.result}
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
                <p className="mt-2 text-xs text-muted">No mistake tags on this attempt.</p>
              )}
            </div>
          </li>
        ))}
      </ol>
    </div>
  )
}

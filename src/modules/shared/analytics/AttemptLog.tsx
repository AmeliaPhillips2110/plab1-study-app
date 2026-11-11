import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { Badge } from '@/components/ui/Badge'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { Select } from '@/components/ui/Select'
import { MISTAKE_TAG_DEFS, MISTAKE_TAG_LABELS } from '@/features/mistakes'
import { downloadCsv, toCsv } from '@/modules/shared/analytics/csv'
import {
  fetchAttemptLog,
  fetchSessionsForExport,
  filterAndSortAttempts,
  type AttemptFilters,
  type AttemptLogRow,
  type AttemptSort,
} from '@/modules/shared/analytics/attemptQueries'
import { SESSION_TYPE_LABELS } from '@/types/quiz'
import { formatDateTime } from '@/lib/dates'

type Props = {
  userId: string
  examId: string
}

export function AttemptLog({ userId, examId }: Props) {
  const [rows, setRows] = useState<AttemptLogRow[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [filters, setFilters] = useState<AttemptFilters>({
    result: 'all',
    sessionType: 'all',
    mistakeTag: 'all',
    query: '',
  })
  const [sort, setSort] = useState<AttemptSort>('answered_at_desc')

  useEffect(() => {
    void (async () => {
      setLoading(true)
      const { rows: data, error: err } = await fetchAttemptLog({ userId, examId })
      setRows(data)
      setError(err)
      setLoading(false)
    })()
  }, [userId, examId])

  const visible = useMemo(
    () => filterAndSortAttempts(rows, filters, sort),
    [rows, filters, sort],
  )

  async function exportAttemptsCsv() {
    const csv = toCsv(
      visible.map((r) => ({
        answered_at: r.answered_at,
        result: r.result,
        session_type: r.study_sessions?.session_type ?? '',
        presentation_format: r.study_sessions?.presentation_format ?? '',
        topic: r.topics?.name ?? '',
        stem: r.questions?.stem ?? '',
        time_spent_ms: r.time_spent_ms ?? '',
        mistake_tags: r.mistake_tags.map((t) => t.tag).join('|'),
        mistake_notes: r.mistake_tags.map((t) => t.note ?? '').join('|'),
        question_id: r.question_id,
        attempt_id: r.id,
        session_id: r.session_id ?? '',
      })),
    )
    downloadCsv(`plaboratory-attempts-${new Date().toISOString().slice(0, 10)}.csv`, csv)
  }

  async function exportSessionsCsv() {
    const { sessions, error: err } = await fetchSessionsForExport({ userId, examId })
    if (err) {
      setError(err)
      return
    }
    const csv = toCsv(
      sessions.map((s) => ({
        started_at: s.started_at,
        ended_at: s.ended_at ?? '',
        session_type: s.session_type,
        presentation_format: s.presentation_format,
        question_count: s.question_count ?? '',
        score_percent: s.score_percent ?? '',
        time_limit_sec: s.time_limit_sec ?? '',
        session_id: s.id,
      })),
    )
    downloadCsv(`plaboratory-sessions-${new Date().toISOString().slice(0, 10)}.csv`, csv)
  }

  return (
    <div className="flex flex-col gap-4">
      <div className="flex flex-wrap items-end justify-between gap-3">
        <p className="text-sm text-muted">
          {visible.length} of {rows.length} attempts
        </p>
        <div className="flex flex-wrap gap-2">
          <Button variant="secondary" onClick={() => void exportAttemptsCsv()}>
            Export attempts CSV
          </Button>
          <Button variant="secondary" onClick={() => void exportSessionsCsv()}>
            Export sessions CSV
          </Button>
        </div>
      </div>

      <div className="grid gap-3 rounded-md border border-border bg-surface p-4 sm:grid-cols-2 lg:grid-cols-4">
        <Select
          label="Result"
          name="result"
          value={filters.result}
          onChange={(e) =>
            setFilters((f) => ({ ...f, result: e.target.value as AttemptFilters['result'] }))
          }
          options={[
            { value: 'all', label: 'All results' },
            { value: 'correct', label: 'Correct' },
            { value: 'incorrect', label: 'Incorrect' },
            { value: 'skipped', label: 'Skipped' },
            { value: 'partial', label: 'Partial' },
          ]}
        />
        <Select
          label="Session type"
          name="sessionType"
          value={filters.sessionType}
          onChange={(e) => setFilters((f) => ({ ...f, sessionType: e.target.value }))}
          options={[
            { value: 'all', label: 'All sessions' },
            ...Object.entries(SESSION_TYPE_LABELS).map(([value, label]) => ({ value, label })),
          ]}
        />
        <Select
          label="Mistake tag"
          name="mistakeTag"
          value={filters.mistakeTag}
          onChange={(e) => setFilters((f) => ({ ...f, mistakeTag: e.target.value }))}
          options={[
            { value: 'all', label: 'All tags' },
            ...MISTAKE_TAG_DEFS.map((d) => ({ value: d.tag, label: d.label })),
          ]}
        />
        <Select
          label="Sort"
          name="sort"
          value={sort}
          onChange={(e) => setSort(e.target.value as AttemptSort)}
          options={[
            { value: 'answered_at_desc', label: 'Newest first' },
            { value: 'answered_at_asc', label: 'Oldest first' },
            { value: 'result', label: 'Result' },
            { value: 'time_spent', label: 'Time spent' },
          ]}
        />
        <div className="sm:col-span-2 lg:col-span-4">
          <Input
            label="Search stem / topic"
            name="query"
            value={filters.query}
            onChange={(e) => setFilters((f) => ({ ...f, query: e.target.value }))}
            placeholder="e.g. STEMI, ethics…"
          />
        </div>
      </div>

      {loading ? <p className="text-sm text-muted">Loading attempts…</p> : null}
      {error ? <p className="text-sm text-incorrect">{error}</p> : null}

      {!loading && visible.length === 0 ? (
        <p className="text-sm text-muted">No attempts match these filters yet.</p>
      ) : null}

      <ul className="flex flex-col gap-2">
        {visible.map((r) => (
          <li
            key={r.id}
            className="flex flex-col gap-2 rounded-md border border-border bg-surface p-4 sm:flex-row sm:items-start sm:justify-between"
          >
            <div className="min-w-0 flex-1">
              <div className="mb-1 flex flex-wrap gap-2">
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
                {r.topics?.name ? <Badge tone="accent">{r.topics.name}</Badge> : null}
                {r.mistake_tags.map((t) => (
                  <Badge key={t.id}>
                    {MISTAKE_TAG_LABELS[t.tag as keyof typeof MISTAKE_TAG_LABELS] ?? t.tag}
                  </Badge>
                ))}
              </div>
              <p className="line-clamp-2 text-sm">{r.questions?.stem ?? 'Question unavailable'}</p>
              <p className="mt-1 text-xs text-muted">
                {formatDateTime(r.answered_at)}
                {r.time_spent_ms != null ? ` · ${Math.round(r.time_spent_ms / 1000)}s` : ''}
              </p>
            </div>
            <Link
              className="shrink-0 text-sm text-accent hover:underline"
              to={`/attempts/question/${r.question_id}`}
            >
              Timeline
            </Link>
          </li>
        ))}
      </ul>
    </div>
  )
}

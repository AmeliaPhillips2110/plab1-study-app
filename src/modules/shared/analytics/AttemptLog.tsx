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

type Props = {
  userId: string
  examId: string
}

function stemTitle(stem: string | null | undefined): string {
  if (!stem?.trim()) return 'Untitled Question'
  const first = stem.trim().split(/[.?\n]/)[0]?.trim() ?? stem.trim()
  return first.length > 72 ? `${first.slice(0, 72)}…` : first
}

function formatDate(iso: string): string {
  const d = new Date(iso)
  if (Number.isNaN(d.getTime())) return '—'
  return d.toLocaleDateString(undefined, {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
  })
}

function formatTime(iso: string): string {
  const d = new Date(iso)
  if (Number.isNaN(d.getTime())) return '—'
  return d.toLocaleTimeString(undefined, {
    hour: '2-digit',
    minute: '2-digit',
  })
}

function scoreLabel(row: AttemptLogRow): string {
  if (row.study_sessions?.score_percent != null) {
    return `${Number(row.study_sessions.score_percent)}%`
  }
  if (row.result === 'correct') return 'Correct'
  if (row.result === 'incorrect') return 'Incorrect'
  if (row.result === 'partial') return 'Partial'
  return 'Skipped'
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
  const [sort, setSort] = useState<AttemptSort>('most_recent')

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
        session_score_percent: r.study_sessions?.score_percent ?? '',
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
          {visible.length} of {rows.length} Attempts
        </p>
        <div className="flex flex-wrap gap-2">
          <Button variant="secondary" onClick={() => void exportAttemptsCsv()}>
            Export Attempts CSV
          </Button>
          <Button variant="secondary" onClick={() => void exportSessionsCsv()}>
            Export Sessions CSV
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
            { value: 'all', label: 'All Results' },
            { value: 'correct', label: 'Correct' },
            { value: 'incorrect', label: 'Incorrect' },
            { value: 'skipped', label: 'Skipped' },
            { value: 'partial', label: 'Partial' },
          ]}
        />
        <Select
          label="Session Type"
          name="sessionType"
          value={filters.sessionType}
          onChange={(e) => setFilters((f) => ({ ...f, sessionType: e.target.value }))}
          options={[
            { value: 'all', label: 'All Sessions' },
            ...Object.entries(SESSION_TYPE_LABELS).map(([value, label]) => ({ value, label })),
          ]}
        />
        <Select
          label="Mistake Tag"
          name="mistakeTag"
          value={filters.mistakeTag}
          onChange={(e) => setFilters((f) => ({ ...f, mistakeTag: e.target.value }))}
          options={[
            { value: 'all', label: 'All Tags' },
            ...MISTAKE_TAG_DEFS.map((d) => ({ value: d.tag, label: d.label })),
          ]}
        />
        <Select
          label="Sort"
          name="sort"
          value={sort}
          onChange={(e) => setSort(e.target.value as AttemptSort)}
          options={[
            { value: 'worst_scores', label: 'Worst Scores' },
            { value: 'best_scores', label: 'Best Scores' },
            { value: 'most_recent', label: 'Most Recent' },
            { value: 'all_attempts', label: 'All Attempts' },
          ]}
        />
        <div className="sm:col-span-2 lg:col-span-4">
          <Input
            label="Search Stem / Topic"
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

      <ul className="flex flex-col gap-3">
        {visible.map((r) => {
          const sessionLabel = r.study_sessions?.session_type
            ? SESSION_TYPE_LABELS[r.study_sessions.session_type] ?? r.study_sessions.session_type
            : 'Standalone'
          const seconds =
            r.time_spent_ms != null ? `${Math.round(r.time_spent_ms / 1000)}s` : '—'
          return (
            <li
              key={r.id}
              className="flex flex-col gap-3 rounded-md border border-border bg-surface p-4 sm:flex-row sm:items-start sm:justify-between"
            >
              <div className="min-w-0 flex-1">
                <p className="font-display text-base font-semibold text-fg">
                  {stemTitle(r.questions?.stem)}
                </p>
                <dl className="mt-3 grid gap-2 text-sm sm:grid-cols-2 lg:grid-cols-4">
                  <div>
                    <dt className="text-xs uppercase tracking-wide text-muted">Date</dt>
                    <dd className="font-medium">{formatDate(r.answered_at)}</dd>
                  </div>
                  <div>
                    <dt className="text-xs uppercase tracking-wide text-muted">Time</dt>
                    <dd className="font-medium">{formatTime(r.answered_at)}</dd>
                  </div>
                  <div>
                    <dt className="text-xs uppercase tracking-wide text-muted">Score</dt>
                    <dd className="font-medium">{scoreLabel(r)}</dd>
                  </div>
                  <div>
                    <dt className="text-xs uppercase tracking-wide text-muted">Duration</dt>
                    <dd className="font-medium">{seconds}</dd>
                  </div>
                  <div>
                    <dt className="text-xs uppercase tracking-wide text-muted">Result</dt>
                    <dd>
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
                    </dd>
                  </div>
                  <div>
                    <dt className="text-xs uppercase tracking-wide text-muted">Session</dt>
                    <dd className="font-medium">{sessionLabel}</dd>
                  </div>
                  <div>
                    <dt className="text-xs uppercase tracking-wide text-muted">Topic</dt>
                    <dd className="font-medium">{r.topics?.name ?? '—'}</dd>
                  </div>
                  <div>
                    <dt className="text-xs uppercase tracking-wide text-muted">Tags</dt>
                    <dd className="font-medium">
                      {r.mistake_tags.length === 0
                        ? '—'
                        : r.mistake_tags
                            .map(
                              (t) =>
                                MISTAKE_TAG_LABELS[t.tag as keyof typeof MISTAKE_TAG_LABELS] ??
                                t.tag,
                            )
                            .join(', ')}
                    </dd>
                  </div>
                </dl>
              </div>
              <Link
                className="shrink-0 text-sm text-accent hover:underline"
                to={`/attempts/question/${r.question_id}`}
              >
                Timeline
              </Link>
            </li>
          )
        })}
      </ul>
    </div>
  )
}

import { useEffect, useMemo, useState } from 'react'
import { Link, useNavigate, useSearchParams } from 'react-router-dom'
import { Badge } from '@/components/ui/Badge'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { Select } from '@/components/ui/Select'
import { MISTAKE_TAG_DEFS, MISTAKE_TAG_LABELS } from '@/features/mistakes'
import { cn } from '@/lib/cn'
import { downloadCsv, toCsv } from '@/modules/shared/analytics/csv'
import {
  fetchAttemptLog,
  fetchSessionsForExport,
  filterAndSortAttempts,
  isMockSessionType,
  isStudySessionType,
  type AttemptFilters,
  type AttemptLogRow,
  type AttemptSort,
} from '@/modules/shared/analytics/attemptQueries'
import { SESSION_TYPE_LABELS } from '@/types/quiz'

type Props = {
  userId: string
  examId: string
}

export type AttemptsScope = 'questions' | 'study' | 'mocks' | 'all'

const SCOPE_OPTIONS: Array<{ value: AttemptsScope; label: string }> = [
  { value: 'questions', label: 'Questions' },
  { value: 'study', label: 'Study Session' },
  { value: 'mocks', label: 'Mocks' },
  { value: 'all', label: 'All' },
]

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

function titleTone(result: string): string {
  if (result === 'correct') return 'text-correct'
  if (result === 'incorrect' || result === 'partial') return 'text-incorrect'
  return 'text-neutral-400'
}

function parseScope(raw: string | null): AttemptsScope {
  if (raw === 'study' || raw === 'mocks' || raw === 'all' || raw === 'questions') return raw
  return 'questions'
}

type SessionGroup = {
  sessionId: string
  sessionType: string
  sessionLabel: string
  scorePercent: number | null
  startedAt: string
  rows: AttemptLogRow[]
}

function groupBySession(rows: AttemptLogRow[]): SessionGroup[] {
  const map = new Map<string, SessionGroup>()
  for (const r of rows) {
    const sid = r.session_id ?? `solo-${r.id}`
    const existing = map.get(sid)
    if (existing) {
      existing.rows.push(r)
      continue
    }
    const st = r.study_sessions?.session_type ?? 'standalone'
    map.set(sid, {
      sessionId: sid,
      sessionType: st,
      sessionLabel: SESSION_TYPE_LABELS[st as keyof typeof SESSION_TYPE_LABELS] ?? st,
      scorePercent:
        r.study_sessions?.score_percent != null ? Number(r.study_sessions.score_percent) : null,
      startedAt: r.answered_at,
      rows: [r],
    })
  }
  return [...map.values()].sort(
    (a, b) => new Date(b.startedAt).getTime() - new Date(a.startedAt).getTime(),
  )
}

export function AttemptLog({ userId, examId }: Props) {
  const [searchParams, setSearchParams] = useSearchParams()
  const navigate = useNavigate()
  const scope = parseScope(searchParams.get('scope'))

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

  const scopedRows = useMemo(() => {
    if (scope === 'all' || scope === 'questions') return rows
    if (scope === 'mocks') {
      return rows.filter((r) => isMockSessionType(r.study_sessions?.session_type))
    }
    return rows.filter((r) => isStudySessionType(r.study_sessions?.session_type))
  }, [rows, scope])

  const visible = useMemo(
    () => filterAndSortAttempts(scopedRows, filters, sort),
    [scopedRows, filters, sort],
  )

  const sessionGroups = useMemo(() => {
    if (scope !== 'study' && scope !== 'mocks') return []
    return groupBySession(visible)
  }, [visible, scope])

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

  function setScope(next: AttemptsScope) {
    const params = new URLSearchParams(searchParams)
    params.set('scope', next)
    setSearchParams(params, { replace: true })
  }

  return (
    <div className="flex flex-col gap-4">
      <div className="flex flex-wrap items-end justify-between gap-3">
        <div className="w-full max-w-xs">
          <Select
            label="View"
            name="attempts-scope"
            value={scope}
            onChange={(e) => setScope(e.target.value as AttemptsScope)}
            options={SCOPE_OPTIONS}
          />
        </div>
        <div className="flex flex-wrap gap-2">
          <Button variant="secondary" onClick={() => void exportAttemptsCsv()}>
            Export Attempts CSV
          </Button>
          <Button variant="secondary" onClick={() => void exportSessionsCsv()}>
            Export Sessions CSV
          </Button>
        </div>
      </div>

      <p className="text-sm text-muted">
        {scope === 'study' || scope === 'mocks'
          ? `${sessionGroups.length} Sessions · ${visible.length} Attempts`
          : `${visible.length} of ${scopedRows.length} Attempts`}
      </p>

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
        <div className="sm:col-span-2 lg:col-span-1">
          <Input
            label="Search Stem / Topic"
            name="query"
            value={filters.query}
            onChange={(e) => setFilters((f) => ({ ...f, query: e.target.value }))}
            placeholder="e.g. STEMI, ethics…"
          />
        </div>
      </div>

      {loading ? <p className="text-sm text-muted">Loading Attempts…</p> : null}
      {error ? <p className="text-sm text-incorrect">{error}</p> : null}

      {!loading && visible.length === 0 ? (
        <p className="text-sm text-muted">No Attempts Match These Filters Yet.</p>
      ) : null}

      {scope === 'study' || scope === 'mocks' ? (
        <ul className="flex flex-col gap-4">
          {sessionGroups.map((g) => {
            const multi = g.rows.length > 1 && !g.sessionId.startsWith('solo-')
            return (
              <li key={g.sessionId} className="rounded-md border border-border bg-surface p-4">
                <div className="mb-3 flex flex-wrap items-start justify-between gap-2">
                  <div>
                    <p className="font-display text-base font-semibold">{g.sessionLabel}</p>
                    <p className="text-xs text-muted">
                      {formatDate(g.startedAt)} · {g.rows.length} Questions
                      {g.scorePercent != null ? ` · ${g.scorePercent}%` : ''}
                    </p>
                  </div>
                  {multi ? (
                    <button
                      type="button"
                      className="text-sm text-accent hover:underline"
                      onClick={() => navigate(`/attempts/session/${g.sessionId}`)}
                    >
                      Timeline
                    </button>
                  ) : null}
                </div>
                <ul className="flex flex-col gap-2">
                  {g.rows.map((r, i) => (
                    <li key={r.id} className="rounded border border-border/70 px-3 py-2">
                      <div className="flex flex-wrap items-start justify-between gap-2">
                        <p className={cn('font-medium', titleTone(r.result))}>
                          Q{i + 1}. {stemTitle(r.questions?.stem)}
                        </p>
                        <Link
                          className="shrink-0 text-xs text-accent hover:underline"
                          to={`/attempts/question/${r.question_id}?highlight=${r.id}`}
                        >
                          Position
                        </Link>
                      </div>
                      <div className="mt-1 flex flex-wrap gap-2 text-xs text-muted">
                        <Badge
                          tone={
                            r.result === 'correct'
                              ? 'correct'
                              : r.result === 'incorrect'
                                ? 'incorrect'
                                : 'neutral'
                          }
                        >
                          {r.result === 'skipped' ? 'Skipped' : r.result === 'correct' ? 'Correct' : 'Incorrect'}
                        </Badge>
                        <span>{formatTime(r.answered_at)}</span>
                        <span>{r.topics?.name ?? '—'}</span>
                      </div>
                    </li>
                  ))}
                </ul>
              </li>
            )
          })}
        </ul>
      ) : (
        <ul className="flex flex-col gap-3">
          {visible.map((r) => {
            const sessionLabel = r.study_sessions?.session_type
              ? SESSION_TYPE_LABELS[r.study_sessions.session_type] ?? r.study_sessions.session_type
              : 'Standalone'
            const seconds =
              r.time_spent_ms != null ? `${Math.round(r.time_spent_ms / 1000)}s` : '—'
            const multiSession =
              Boolean(r.session_id) &&
              scopedRows.filter((x) => x.session_id === r.session_id).length > 1
            return (
              <li
                key={r.id}
                className="flex flex-col gap-3 rounded-md border border-border bg-surface p-4 sm:flex-row sm:items-start sm:justify-between"
              >
                <div className="min-w-0 flex-1">
                  <p className={cn('font-display text-base font-semibold', titleTone(r.result))}>
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
                <div className="flex shrink-0 flex-col gap-2 text-sm">
                  {multiSession && r.session_id ? (
                    <Link
                      className="text-accent hover:underline"
                      to={`/attempts/session/${r.session_id}`}
                    >
                      Session Timeline
                    </Link>
                  ) : null}
                  <Link
                    className="text-accent hover:underline"
                    to={`/attempts/question/${r.question_id}?highlight=${r.id}`}
                  >
                    Position On Timeline
                  </Link>
                </div>
              </li>
            )
          })}
        </ul>
      )}
    </div>
  )
}

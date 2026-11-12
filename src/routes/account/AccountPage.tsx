import { useEffect, useMemo, useState } from 'react'
import { Navigate } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { Badge } from '@/components/ui/Badge'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { fetchKpiBundle } from '@/modules/shared/analytics/kpiData'
import { computeHeadlineKpis } from '@/modules/shared/analytics/kpiMetrics'

function formatHours(ms: number): string {
  const hours = ms / 3_600_000
  if (hours < 0.1) return `${Math.round(ms / 60_000)} min`
  return `${Math.round(hours * 10) / 10} h`
}

export function AccountPage() {
  const { user, profile, preferences } = useAuth()
  const { exam, settings, loading: examLoading, error: examError } = useExam()
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [bundle, setBundle] = useState<Awaited<ReturnType<typeof fetchKpiBundle>> | null>(null)

  useEffect(() => {
    if (!user || !exam) {
      setLoading(false)
      return
    }
    void (async () => {
      setLoading(true)
      const data = await fetchKpiBundle({ userId: user.id, examId: exam.id })
      setBundle(data)
      setError(data.error)
      setLoading(false)
    })()
  }, [user, exam])

  const stats = useMemo(() => {
    if (!bundle) return null
    const headlines = computeHeadlineKpis({
      attempts: bundle.attempts,
      sessions: bundle.sessions,
      bankActive: bundle.bankActive,
    })
    const timeMs = bundle.attempts.reduce((sum, a) => sum + (a.time_spent_ms ?? 0), 0)
    const incorrect = headlines.gradedCount - headlines.correctCount
    return { headlines, timeMs, incorrect }
  }, [bundle])

  if (!user) return <Navigate to="/login" replace />

  const passMark = Number(settings?.pass_mark_percent ?? 65)
  const display =
    profile?.display_name || user.email?.split('@')[0] || 'Student'

  return (
    <AppShell title="Account">
      <div className="mx-auto flex max-w-3xl flex-col gap-6">
        <section className="rounded-md border border-border bg-surface p-4 text-center">
          <h2 className="font-display text-lg font-semibold">{display}</h2>
          <p className="mt-1 text-sm text-muted">
            {profile?.role ?? 'student'}
            {exam ? ` · ${exam.name}` : ''}
          </p>
          <p className="mt-2 text-xs text-muted">
            Theme: {preferences?.theme ?? 'dark'}
            {' · '}
            Comparison: {preferences?.comparison_opt_out ? 'opted out' : 'opted in'}
          </p>
        </section>

        {examLoading || loading ? <p className="text-center text-sm text-muted">Loading stats…</p> : null}
        {examError || error ? (
          <p className="text-center text-sm text-incorrect">{examError || error}</p>
        ) : null}

        {stats ? (
          <section className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
            <Stat
              label="Hours spent"
              value={formatHours(stats.timeMs)}
              hint="From timed attempts"
            />
            <Stat
              label="Accuracy"
              value={`${stats.headlines.accuracyPercent}%`}
              hint={`${stats.headlines.correctCount}/${stats.headlines.gradedCount} graded`}
              tone={
                stats.headlines.gradedCount === 0
                  ? undefined
                  : stats.headlines.accuracyPercent >= passMark
                    ? 'good'
                    : 'warn'
              }
            />
            <Stat
              label="Attempts"
              value={String(stats.headlines.attemptCount)}
              hint={`${stats.incorrect} incorrect · ${stats.headlines.finishedSessionCount} finished sessions`}
            />
            <Stat
              label="Coverage"
              value={`${stats.headlines.coveragePercent}%`}
              hint={`${stats.headlines.uniqueAttempted}/${stats.headlines.bankActive} active questions`}
            />
            <Stat
              label="Pace"
              value={`${stats.headlines.qpm}`}
              hint="Questions per minute (avg)"
            />
            <Stat
              label="Active days (30d)"
              value={String(stats.headlines.activeDays30)}
              hint={
                stats.headlines.latestMockPercent != null
                  ? `Latest mock ${stats.headlines.latestMockPercent}%`
                  : 'No timed mock score yet'
              }
            />
          </section>
        ) : !loading && exam ? (
          <p className="text-center text-sm text-muted">No attempt data yet — start a quiz to fill this in.</p>
        ) : null}

        {stats?.headlines.latestMockPercent != null ? (
          <p className="text-center text-sm text-muted">
            Latest timed test:{' '}
            <Badge
              tone={
                stats.headlines.latestMockPercent >= passMark ? 'correct' : 'incorrect'
              }
            >
              {stats.headlines.latestMockPercent}%
            </Badge>{' '}
            (pass mark {passMark}%)
          </p>
        ) : null}
      </div>
    </AppShell>
  )
}

function Stat({
  label,
  value,
  hint,
  tone,
}: {
  label: string
  value: string
  hint: string
  tone?: 'good' | 'warn'
}) {
  return (
    <div className="rounded-md border border-border bg-surface px-4 py-3 text-center">
      <p className="text-xs font-medium uppercase tracking-wide text-muted">{label}</p>
      <p
        className={
          tone === 'good'
            ? 'mt-1 font-display text-2xl font-bold text-correct'
            : tone === 'warn'
              ? 'mt-1 font-display text-2xl font-bold text-incorrect'
              : 'mt-1 font-display text-2xl font-bold text-fg'
        }
      >
        {value}
      </p>
      <p className="mt-1 text-xs text-muted">{hint}</p>
    </div>
  )
}

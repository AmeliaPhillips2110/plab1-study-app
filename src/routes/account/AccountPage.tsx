import { useEffect, useMemo, useState, type FormEvent } from 'react'
import { Navigate } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { SetupMissingNotice } from '@/components/layout/SetupMissingNotice'
import { Badge } from '@/components/ui/Badge'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { saveAvatarUrl } from '@/features/preferences/avatar'
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
  const { user, profile, preferences, refreshProfile } = useAuth()
  const { exam, settings, loading: examLoading, error: examError, schemaMissing } = useExam()
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [bundle, setBundle] = useState<Awaited<ReturnType<typeof fetchKpiBundle>> | null>(null)
  const [avatarUrl, setAvatarUrl] = useState(
    typeof preferences?.extra?.avatar_url === 'string' ? preferences.extra.avatar_url : '',
  )
  const [avatarMsg, setAvatarMsg] = useState<string | null>(null)
  const [avatarBusy, setAvatarBusy] = useState(false)

  useEffect(() => {
    setAvatarUrl(
      typeof preferences?.extra?.avatar_url === 'string' ? preferences.extra.avatar_url : '',
    )
  }, [preferences?.extra?.avatar_url])

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
  const display = profile?.display_name || user.email?.split('@')[0] || 'Student'
  const roleLabel = profile?.role === 'admin' ? 'Administrator' : 'Student'

  async function onSaveAvatar(e: FormEvent) {
    e.preventDefault()
    setAvatarBusy(true)
    setAvatarMsg(null)
    const { error: err } = await saveAvatarUrl(user!.id, avatarUrl, preferences?.extra ?? {})
    setAvatarBusy(false)
    if (err) setAvatarMsg(err)
    else {
      setAvatarMsg('Saved profile image URL.')
      await refreshProfile()
    }
  }

  return (
    <AppShell title="Account">
      <div className="mx-auto flex max-w-3xl flex-col gap-6">
        {schemaMissing ? <SetupMissingNotice /> : null}

        <section className="rounded-md border border-border bg-surface p-4 text-center">
          <div className="mb-3 flex justify-center">
            {avatarUrl ? (
              <img
                src={avatarUrl}
                alt=""
                className="h-20 w-20 rounded-full object-cover ring-2 ring-accent/40"
              />
            ) : (
              <span className="inline-flex h-20 w-20 items-center justify-center rounded-full bg-accent-subtle font-display text-2xl font-semibold text-accent">
                {display.slice(0, 1).toUpperCase()}
              </span>
            )}
          </div>
          <h2 className="font-display text-lg font-semibold">{display}</h2>
          <p className="mt-1 text-sm text-muted">
            {roleLabel}
            {exam ? ` · ${exam.name}` : ''}
          </p>
          <p className="mt-3 text-xs text-muted">Theme: {preferences?.theme ?? 'dark'}</p>
          <p className="text-xs text-muted">
            Comparison: {preferences?.comparison_opt_out ? 'opted out' : 'opted in'}
          </p>
        </section>

        <form
          onSubmit={(e) => void onSaveAvatar(e)}
          className="rounded-md border border-border bg-surface p-4"
        >
          <h2 className="mb-2 text-center font-display text-sm font-semibold">Profile image</h2>
          <p className="mb-3 text-center text-xs text-muted">
            Paste an image URL (HTTPS). Upload-to-Storage can be added later; URL works on GitHub
            Pages without extra buckets.
          </p>
          <div className="flex flex-col items-stretch gap-2 sm:flex-row sm:items-end">
            <Input
              label="Avatar URL"
              name="avatar-url"
              type="url"
              placeholder="https://…"
              value={avatarUrl}
              onChange={(e) => setAvatarUrl(e.target.value)}
              className="flex-1"
            />
            <Button type="submit" variant="secondary" disabled={avatarBusy}>
              Save
            </Button>
          </div>
          {avatarMsg ? <p className="mt-2 text-center text-xs text-muted">{avatarMsg}</p> : null}
        </form>

        {examLoading || loading ? (
          <p className="text-center text-sm text-muted">Loading stats…</p>
        ) : null}
        {!schemaMissing && (examError || error) ? (
          <p className="text-center text-sm text-incorrect">{examError || error}</p>
        ) : null}

        {stats ? (
          <section className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
            <Stat label="Hours spent" value={formatHours(stats.timeMs)} hint="From timed attempts" />
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
          <p className="text-center text-sm text-muted">
            No attempt data yet — start a quiz to fill this in.
          </p>
        ) : null}

        {stats?.headlines.latestMockPercent != null ? (
          <p className="text-center text-sm text-muted">
            Latest timed test:{' '}
            <Badge
              tone={stats.headlines.latestMockPercent >= passMark ? 'correct' : 'incorrect'}
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

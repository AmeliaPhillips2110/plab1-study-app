import { Navigate } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { KpiDashboard } from '@/modules/shared/analytics/KpiDashboard'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'

export function DashboardPage() {
  const { user, isAdmin } = useAuth()
  const { loading, exam, settings, error, schemaMissing } = useExam()
  if (!user) return <Navigate to="/login" replace />

  return (
    <AppShell title="KPI Dashboard">
      <p className="mb-4 text-center text-sm text-muted">
        Headline metrics, score trend with pass-mark line, specialty accuracy, heatmaps, mistake
        mix, pace, coverage, and Focus next weakness drills.
      </p>
      {loading ? <p className="mb-4 text-center text-sm text-muted">Loading exam…</p> : null}
      {!schemaMissing && error ? (
        <p className="mb-4 text-center text-sm text-incorrect">{error}</p>
      ) : null}
      <KpiDashboard
        userId={user.id}
        examId={exam?.id ?? null}
        passMarkPercent={Number(settings?.pass_mark_percent ?? 65)}
        isAdmin={isAdmin}
        forceEmpty={!exam}
      />
    </AppShell>
  )
}

import { AppShell } from '@/components/layout/AppShell'
import { GroupComparison } from '@/modules/shared/analytics/GroupComparison'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'

export function AdminComparisonPage() {
  const { user } = useAuth()
  const { loading, exam, error } = useExam()

  return (
    <AppShell title="Group Comparison">
      <p className="mb-4 max-w-2xl text-sm text-muted">
        Admin view of opted-in students only. Users with comparison opt-out are counted but excluded
        from averages and the peer list.
      </p>
      {loading ? <p className="text-sm text-muted">Loading…</p> : null}
      {error ? <p className="mb-4 text-sm text-incorrect">{error}</p> : null}
      {exam && user ? (
        <GroupComparison examId={exam.id} currentUserId={user.id} />
      ) : null}
    </AppShell>
  )
}

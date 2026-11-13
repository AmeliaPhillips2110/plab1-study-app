import { Navigate, useParams } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { SessionTimeline } from '@/modules/shared/analytics/SessionTimeline'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'

export function SessionTimelinePage() {
  const { sessionId } = useParams()
  const { user } = useAuth()
  const { loading, exam, error } = useExam()
  if (!user) return <Navigate to="/login" replace />
  if (!sessionId) return <Navigate to="/attempts" replace />

  return (
    <AppShell title="Session Timeline">
      {loading ? <p className="text-sm text-muted">Loading…</p> : null}
      {error ? <p className="mb-4 text-sm text-incorrect">{error}</p> : null}
      {exam ? (
        <SessionTimeline userId={user.id} examId={exam.id} sessionId={sessionId} />
      ) : null}
    </AppShell>
  )
}

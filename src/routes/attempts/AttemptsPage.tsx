import { Navigate } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { AttemptLog } from '@/modules/shared/analytics/AttemptLog'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'

export function AttemptsPage() {
  const { user } = useAuth()
  const { loading, exam, error } = useExam()
  if (!user) return <Navigate to="/login" replace />

  return (
    <AppShell title="Attempt Log">
      <p className="mb-4 max-w-2xl text-sm text-muted">
        Filter and sort every saved attempt, open a per-question timeline, and export CSV for
        attempts or sessions. Mistake tags come from tutor feedback and post-mock review.
      </p>
      {loading ? <p className="text-sm text-muted">Loading exam…</p> : null}
      {error ? <p className="mb-4 text-sm text-incorrect">{error}</p> : null}
      {exam ? <AttemptLog userId={user.id} examId={exam.id} /> : null}
    </AppShell>
  )
}

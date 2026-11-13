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
      {loading ? <p className="text-sm text-muted">Loading Exam…</p> : null}
      {error ? <p className="mb-4 text-sm text-incorrect">{error}</p> : null}
      {exam ? <AttemptLog userId={user.id} examId={exam.id} /> : null}
    </AppShell>
  )
}

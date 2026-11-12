import { Navigate, useParams } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { QuestionTimeline } from '@/modules/shared/analytics/QuestionTimeline'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'

export function QuestionTimelinePage() {
  const { questionId } = useParams()
  const { user } = useAuth()
  const { loading, exam, error } = useExam()
  if (!user) return <Navigate to="/login" replace />
  if (!questionId) return <Navigate to="/attempts" replace />

  return (
    <AppShell title="Question Timeline">
      {loading ? <p className="text-sm text-muted">Loading…</p> : null}
      {error ? <p className="mb-4 text-sm text-incorrect">{error}</p> : null}
      {exam ? (
        <QuestionTimeline userId={user.id} examId={exam.id} questionId={questionId} />
      ) : null}
    </AppShell>
  )
}

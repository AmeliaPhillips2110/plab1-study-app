import { AppShell } from '@/components/layout/AppShell'
import { QuestionList } from '@/modules/shared/admin/QuestionList'
import { useExam } from '@/hooks/useExam'

export function AdminQuestionsPage() {
  const { loading, exam, topics, error } = useExam()

  return (
    <AppShell title="Question bank">
      {loading ? <p className="text-sm text-muted">Loading…</p> : null}
      {error ? <p className="mb-4 text-sm text-incorrect">{error}</p> : null}
      {exam ? <QuestionList examId={exam.id} topics={topics} /> : null}
    </AppShell>
  )
}

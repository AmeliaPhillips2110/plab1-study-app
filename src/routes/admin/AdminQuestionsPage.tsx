import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { QuestionList } from '@/modules/shared/admin/QuestionList'
import { useExam } from '@/hooks/useExam'

export function AdminQuestionsPage() {
  const { loading, exam, topics, error } = useExam()

  return (
    <AppShell title="Question Bank">
      <p className="mb-4 text-sm">
        <Link to="/admin/import" className="text-accent hover:underline">
          Import Excel question bank →
        </Link>
      </p>
      {loading ? <p className="text-sm text-muted">Loading…</p> : null}
      {error ? <p className="mb-4 text-sm text-incorrect">{error}</p> : null}
      {exam ? <QuestionList examId={exam.id} topics={topics} /> : null}
    </AppShell>
  )
}

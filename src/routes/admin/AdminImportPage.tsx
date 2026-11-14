import { AppShell } from '@/components/layout/AppShell'
import { QuestionBankImport } from '@/features/question-import'
import { useExam } from '@/hooks/useExam'

export function AdminImportPage() {
  const { loading, exam, topics, error, refresh } = useExam()

  return (
    <AppShell title="Import question bank">
      {loading ? <p className="text-sm text-muted">Loading…</p> : null}
      {error ? <p className="mb-4 text-sm text-incorrect">{error}</p> : null}
      {exam ? (
        <QuestionBankImport examId={exam.id} topics={topics} onImported={() => void refresh()} />
      ) : !loading ? (
        <p className="text-sm text-muted">No active exam found.</p>
      ) : null}
    </AppShell>
  )
}

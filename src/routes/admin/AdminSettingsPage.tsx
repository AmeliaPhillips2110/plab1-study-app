import { AppShell } from '@/components/layout/AppShell'
import { SettingsForm } from '@/modules/shared/admin/SettingsForm'
import { useExam } from '@/hooks/useExam'

export function AdminSettingsPage() {
  const { loading, exam, settings, error, refresh } = useExam()

  return (
    <AppShell title="Exam settings">
      <p className="mb-4 max-w-xl text-sm text-muted">
        Pass mark defaults to 65% and can be changed here. Mock length fields are stored now for
        Stage c.
      </p>
      {loading ? <p className="text-sm text-muted">Loading…</p> : null}
      {error ? <p className="mb-4 text-sm text-incorrect">{error}</p> : null}
      {exam ? (
        <SettingsForm examId={exam.id} settings={settings} onSaved={() => void refresh()} />
      ) : null}
    </AppShell>
  )
}

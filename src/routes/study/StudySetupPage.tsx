import { useState } from 'react'
import { Navigate } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { SessionRunner } from '@/modules/shared/quiz-engine/SessionRunner'
import { SessionSetup } from '@/modules/shared/quiz-engine/SessionSetup'
import type { SessionSetupConfig } from '@/types/quiz'

export function StudySetupPage() {
  const { user } = useAuth()
  const { loading, exam, topics, error } = useExam()
  const [run, setRun] = useState<{ id: string; config: SessionSetupConfig } | null>(null)

  if (!user) return <Navigate to="/login" replace />

  if (run && exam) {
    return (
      <AppShell title="Quiz session">
        <SessionRunner
          key={run.id}
          userId={user.id}
          config={run.config}
          onExit={() => setRun(null)}
        />
      </AppShell>
    )
  }

  return (
    <AppShell title="Start a study session">
      <div className="mb-4 max-w-xl text-sm text-muted">
        Choose how questions are selected and how they are shown. Feedback appears after each item
        (tutor mode).
      </div>
      {loading ? <p className="text-sm text-muted">Loading exam…</p> : null}
      {error ? <p className="mb-4 text-sm text-incorrect">{error}</p> : null}
      {exam ? (
        <SessionSetup
          examId={exam.id}
          topics={topics}
          onStart={(config) =>
            setRun({ id: crypto.randomUUID(), config })
          }
        />
      ) : !loading ? (
        <p className="text-sm text-muted">Exam not loaded. Finish SETUP.md first.</p>
      ) : null}
    </AppShell>
  )
}

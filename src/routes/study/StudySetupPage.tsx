import { useMemo, useState } from 'react'
import { Navigate, useSearchParams } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { SetupMissingNotice } from '@/components/layout/SetupMissingNotice'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { SessionRunner } from '@/modules/shared/quiz-engine/SessionRunner'
import {
  SessionSetup,
  type SessionSetupInitial,
} from '@/modules/shared/quiz-engine/SessionSetup'
import type { SessionSetupConfig } from '@/types/quiz'
import type { SessionType, WeaknessVariant } from '@/types/database'

export function StudySetupPage() {
  const { user } = useAuth()
  const { loading, exam, topics, error, schemaMissing } = useExam()
  const [params] = useSearchParams()
  const [run, setRun] = useState<{ id: string; config: SessionSetupConfig } | null>(null)

  const initial = useMemo<SessionSetupInitial>(() => {
    const sessionType = params.get('sessionType') as SessionType | null
    const variant = params.get('variant') as WeaknessVariant | null
    const topicId = params.get('topicId')
    const autostart = params.get('autostart') === '1'
    return {
      sessionType: sessionType || undefined,
      weaknessVariant: variant || undefined,
      topicId: topicId || undefined,
      autostart,
    }
  }, [params])

  if (!user) return <Navigate to="/login" replace />

  if (run && exam) {
    return (
      <AppShell title="Quiz Session">
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
    <AppShell title="Quiz Setup">
      {schemaMissing ? <SetupMissingNotice /> : null}
      <div className="mb-4 max-w-xl text-center text-sm text-muted md:text-left">
        Choose how questions are selected and how they are shown. Feedback appears after each item
        (tutor mode). Links from the KPI dashboard can pre-fill and auto-start a weakness drill.
      </div>
      {loading ? <p className="text-sm text-muted">Loading exam…</p> : null}
      {!schemaMissing && error ? <p className="mb-4 text-sm text-incorrect">{error}</p> : null}
      {exam ? (
        <SessionSetup
          examId={exam.id}
          topics={topics}
          initial={initial}
          onStart={(config) => setRun({ id: crypto.randomUUID(), config })}
        />
      ) : !loading && !schemaMissing ? (
        <p className="text-sm text-muted">Exam not loaded. Run supabase/APPLY_ALL.sql first.</p>
      ) : null}
    </AppShell>
  )
}

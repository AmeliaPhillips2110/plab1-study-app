import { useMemo, useState } from 'react'
import { Navigate, useParams, useSearchParams } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { studyModeBySlug } from '@/modules/plab1/modeRoutes'
import { SessionRunner } from '@/modules/shared/quiz-engine/SessionRunner'
import {
  SessionSetup,
  type SessionSetupInitial,
} from '@/modules/shared/quiz-engine/SessionSetup'
import type { SessionSetupConfig } from '@/types/quiz'

export function StudyModePage() {
  const { modeSlug = '' } = useParams()
  const [params] = useSearchParams()
  const mode = studyModeBySlug(modeSlug)
  const { user } = useAuth()
  const { loading, exam, topics, error, schemaMissing } = useExam()
  const [run, setRun] = useState<{ id: string; config: SessionSetupConfig } | null>(null)

  const initial = useMemo<SessionSetupInitial>(() => {
    if (!mode) return {}
    const topicId = params.get('topicId')
    const autostartParam = params.get('autostart') === '1'
    return {
      sessionType: mode.sessionType,
      presentationFormat: mode.presentationFormat,
      weaknessVariant: mode.weaknessVariant,
      unseenOnly: mode.unseenOnly,
      openEnded: mode.openEnded,
      questionLimit: mode.questionLimit,
      topicId: topicId || undefined,
      autostart: mode.autostart || autostartParam,
    }
  }, [mode, params])

  if (!user) return <Navigate to="/login" replace />
  if (!mode) return <Navigate to="/study/practice-questions" replace />

  if (run && exam) {
    return (
      <AppShell title={mode.title}>
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
    <AppShell title={mode.title}>
      {loading ? <p className="text-sm text-muted">Loading exam…</p> : null}
      {!schemaMissing && error ? <p className="mb-4 text-sm text-incorrect">{error}</p> : null}
      {exam ? (
        <SessionSetup
          examId={exam.id}
          topics={topics}
          initial={initial}
          onStart={(config) => {
            const next: SessionSetupConfig = {
              ...config,
              unseenOnly: config.unseenOnly || Boolean(mode.unseenOnly),
              openEnded: Boolean(mode.openEnded) || config.openEnded,
              presentationFormat:
                mode.presentationFormat ?? config.presentationFormat,
              sessionType: mode.sessionType || config.sessionType,
              weaknessVariant: mode.weaknessVariant ?? config.weaknessVariant,
            }
            setRun({ id: crypto.randomUUID(), config: next })
          }}
        />
      ) : !loading ? (
        <p className="text-sm text-muted">No exam loaded yet.</p>
      ) : null}
    </AppShell>
  )
}

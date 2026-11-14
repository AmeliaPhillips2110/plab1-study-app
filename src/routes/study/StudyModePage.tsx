import { useEffect, useMemo, useState } from 'react'
import { Navigate, useParams } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { EmptyBankHint } from '@/components/EmptyBankHint'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { studyModeBySlug } from '@/modules/plab1/modeRoutes'
import { SessionRunner } from '@/modules/shared/quiz-engine/SessionRunner'
import { takeRedoQuestionIds } from '@/modules/shared/quiz-engine/sessionDebrief'
import type { SessionSetupConfig } from '@/types/quiz'
import { TopicsPracticePage } from '@/routes/study/TopicsPracticePage'

export function StudyModePage() {
  const { modeSlug = '' } = useParams()

  if (modeSlug === 'topics') {
    return <TopicsPracticePage />
  }

  return <AutostartStudyMode modeSlug={modeSlug} />
}

function AutostartStudyMode({ modeSlug }: { modeSlug: string }) {
  const mode = studyModeBySlug(modeSlug)
  const { user } = useAuth()
  const { loading, exam, error, schemaMissing } = useExam()
  const [runId, setRunId] = useState(() => crypto.randomUUID())
  const [redoIds] = useState(() =>
    modeSlug === 'redo-wrongs' ? takeRedoQuestionIds() : ([] as string[]),
  )

  const config = useMemo<SessionSetupConfig | null>(() => {
    if (!mode || !exam || mode.hubOnly) return null
    if (modeSlug === 'redo-wrongs' && redoIds.length === 0) return null
    return {
      examId: exam.id,
      sessionType: mode.sessionType,
      presentationFormat: mode.presentationFormat ?? 'sba',
      weaknessVariant: mode.weaknessVariant ?? null,
      unseenOnly: Boolean(mode.unseenOnly),
      openEnded: Boolean(mode.openEnded),
      flaggedOnly: Boolean(mode.flaggedOnly),
      dailyQueue: Boolean(mode.dailyQueue),
      dueTodayQueue: Boolean(mode.dueTodayQueue),
      questionIds: modeSlug === 'redo-wrongs' ? redoIds : undefined,
      questionLimit:
        modeSlug === 'redo-wrongs'
          ? redoIds.length
          : (mode.questionLimit ?? (mode.openEnded ? 10_000 : 20)),
      longStemOnly: Boolean(mode.longStemOnly),
      topicId: null,
    }
  }, [mode, exam, modeSlug, redoIds])

  useEffect(() => {
    setRunId(crypto.randomUUID())
  }, [modeSlug])

  if (!user) return <Navigate to="/login" replace />
  if (!mode || mode.hubOnly) return <Navigate to="/study" replace />

  if (loading) {
    return (
      <AppShell title={mode.title}>
        <p className="text-sm text-muted">Loading exam…</p>
      </AppShell>
    )
  }

  if (modeSlug === 'redo-wrongs' && redoIds.length === 0) {
    return (
      <AppShell title={mode.title}>
        <p className="text-sm text-muted">
          Nothing queued to redo. Finish a quiz or test first, then use{' '}
          <span className="font-medium text-fg">Redo only wrongs</span> on the debrief.
        </p>
      </AppShell>
    )
  }

  if (!exam || !config) {
    return (
      <AppShell title={mode.title}>
        {!schemaMissing && error ? <p className="mb-4 text-sm text-incorrect">{error}</p> : null}
        <EmptyBankHint examMissing={!loading && (!exam || schemaMissing)} />
        <p className="mt-2 text-sm text-muted">No exam loaded yet.</p>
      </AppShell>
    )
  }

  return (
    <AppShell title={mode.title}>
      <SessionRunner
        key={runId}
        userId={user.id}
        config={config}
        onExit={() => setRunId(crypto.randomUUID())}
      />
    </AppShell>
  )
}

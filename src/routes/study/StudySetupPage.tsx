import { useMemo, useState } from 'react'
import { Navigate, useSearchParams } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { SessionRunner } from '@/modules/shared/quiz-engine/SessionRunner'
import {
  SessionSetup,
  type SessionSetupInitial,
} from '@/modules/shared/quiz-engine/SessionSetup'
import type { SessionSetupConfig } from '@/types/quiz'
import type { PresentationFormat, SessionType, WeaknessVariant } from '@/types/database'

export function StudySetupPage() {
  const { user } = useAuth()
  const { loading, exam, topics, error, schemaMissing } = useExam()
  const [params] = useSearchParams()
  const [run, setRun] = useState<{ id: string; config: SessionSetupConfig } | null>(null)

  const openMode = params.get('mode') === 'open'
  const unseenOnly = params.get('unseenOnly') === '1'
  const formatParam = params.get('format') as PresentationFormat | null

  const initial = useMemo<SessionSetupInitial>(() => {
    if (openMode) {
      return {
        sessionType: 'random',
        presentationFormat: 'sba',
        questionLimit: 40,
        autostart: true,
      }
    }
    const sessionType = params.get('sessionType') as SessionType | null
    const variant = params.get('variant') as WeaknessVariant | null
    const topicId = params.get('topicId')
    const autostart = params.get('autostart') === '1' || Boolean(sessionType)
    return {
      sessionType: sessionType || undefined,
      presentationFormat: formatParam || undefined,
      weaknessVariant: variant || undefined,
      topicId: topicId || undefined,
      unseenOnly: unseenOnly || undefined,
      autostart,
    }
  }, [params, openMode, formatParam, unseenOnly])

  if (!user) return <Navigate to="/login" replace />

  if (run && exam) {
    return (
      <AppShell title={run.config.openEnded ? 'Open Quiz' : 'Study Session'}>
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
    <AppShell title="Study Setup">
      <div className="mb-4 max-w-xl text-center text-sm text-muted md:text-left">
        Choose how questions are selected and how they are shown. Feedback appears after each item
        (tutor mode). Use the Study menu for quick starts (open quiz, flashcards, weak topics).
      </div>
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
              unseenOnly: config.unseenOnly || unseenOnly,
              openEnded: openMode || config.openEnded,
              presentationFormat:
                openMode || formatParam === 'rapid_fire'
                  ? openMode
                    ? 'sba'
                    : formatParam || config.presentationFormat
                  : config.presentationFormat,
            }
            if (openMode) {
              next.sessionType = 'random'
              next.openEnded = true
              next.presentationFormat = 'sba'
              next.questionLimit = Math.max(config.questionLimit ?? 40, 20)
            }
            if (formatParam === 'rapid_fire' && !openMode) {
              next.presentationFormat = 'rapid_fire'
            }
            if (unseenOnly) next.unseenOnly = true
            setRun({ id: crypto.randomUUID(), config: next })
          }}
        />
      ) : !loading ? (
        <p className="text-sm text-muted">Exam not available yet.</p>
      ) : null}
    </AppShell>
  )
}

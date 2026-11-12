import { useEffect, useMemo, useState } from 'react'
import { Navigate, useParams } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { EmptyBankHint } from '@/components/EmptyBankHint'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { Badge } from '@/components/ui/Badge'
import { Select } from '@/components/ui/Select'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { testModeBySlug } from '@/modules/plab1/modeRoutes'
import { MockRunner } from '@/modules/shared/quiz-engine/mock/MockRunner'
import {
  countActiveSba,
  createMockSession,
  defaultMockLimits,
  findOpenTimedSessions,
  loadQuestionsByIds,
  loadSbaBank,
  loadSbaByTopic,
  progressFromSession,
} from '@/modules/shared/quiz-engine/mock/mockPersist'
import { selectQuestionsForSession } from '@/modules/shared/quiz-engine/selectQuestions'
import type { QuestionWithOptions, StudySession } from '@/types/database'
import type { MockProgressState, TimedMode } from '@/types/quiz'

const WEAKNESS_THEME = '__weakness__'

type ActiveRun = {
  sessionId: string
  mode: TimedMode
  questions: QuestionWithOptions[]
  progress: MockProgressState
}

export function TestModePage() {
  const { modeSlug = '' } = useParams()
  const mode = testModeBySlug(modeSlug)
  const { user } = useAuth()
  const { loading, exam, settings, topics, error, schemaMissing } = useExam()
  const defaults = defaultMockLimits(settings)
  const [bankCount, setBankCount] = useState<number | null>(null)
  const [themeKey, setThemeKey] = useState('')
  const [questionCount, setQuestionCount] = useState(String(defaults.questions))
  const [minutes, setMinutes] = useState(String(defaults.minutes))
  const [openSessions, setOpenSessions] = useState<StudySession[]>([])
  const [busy, setBusy] = useState(false)
  const [localError, setLocalError] = useState<string | null>(null)
  const [run, setRun] = useState<ActiveRun | null>(null)

  const themeOptions = useMemo(
    () => [
      ...topics.map((t) => ({ value: t.id, label: t.name })),
      { value: WEAKNESS_THEME, label: 'Weakness' },
    ],
    [topics],
  )

  useEffect(() => {
    if (settings) {
      setQuestionCount(String(settings.default_mock_question_count ?? 180))
      setMinutes(String(settings.default_mock_minutes ?? 180))
    }
  }, [settings])

  useEffect(() => {
    // Prefer first topic when available; otherwise default to Weakness so the select always works.
    if (!themeKey) {
      setThemeKey(topics[0]?.id ?? WEAKNESS_THEME)
      return
    }
    if (themeKey !== WEAKNESS_THEME && !topics.some((t) => t.id === themeKey)) {
      setThemeKey(topics[0]?.id ?? WEAKNESS_THEME)
    }
  }, [topics, themeKey])

  useEffect(() => {
    if (!exam || !user) return
    void (async () => {
      setBankCount(await countActiveSba(exam.id))
      setOpenSessions(await findOpenTimedSessions({ userId: user.id, examId: exam.id }))
    })()
  }, [exam, user])

  if (!user) return <Navigate to="/login" replace />
  if (!mode) return <Navigate to="/tests/full-test" replace />

  const isUnlimited = mode.uiMode === 'as_many_as_you_can'
  const isThemed = mode.uiMode === 'themed'
  const timedMode: TimedMode = isUnlimited ? 'as_many_as_you_can' : 'full_mock'
  const bankEmpty = Boolean(exam) && bankCount === 0
  const examMissing = !loading && (!exam || schemaMissing)

  async function startNew() {
    if (!exam || !user) return
    setBusy(true)
    setLocalError(null)
    const available = bankCount ?? 0
    if (available <= 0) {
      setLocalError('No questions available yet.')
      setBusy(false)
      return
    }

    const target = Math.min(180, Math.max(1, Number(questionCount) || defaults.questions))
    let questions: QuestionWithOptions[] = []

    if (isThemed && themeKey === WEAKNESS_THEME) {
      const weak = await selectQuestionsForSession(
        {
          examId: exam.id,
          sessionType: 'weakness',
          presentationFormat: 'sba',
          weaknessVariant: 'recent_mistakes',
          questionLimit: Math.min(50, target),
        },
        user.id,
      )
      if (weak.error || weak.questions.length === 0) {
        setLocalError(weak.error ?? 'No weakness questions identified yet — try a topic theme or Full Test.')
        setBusy(false)
        return
      }
      questions = weak.questions
    } else if (isThemed && themeKey) {
      const loaded = await loadSbaByTopic(exam.id, themeKey, target)
      if (loaded.error) {
        setLocalError(loaded.error)
        setBusy(false)
        return
      }
      if (loaded.questions.length === 0) {
        setLocalError('No questions in that theme yet — try another topic or Weakness.')
        setBusy(false)
        return
      }
      questions = loaded.questions
    } else if (isUnlimited) {
      const take = Math.max(1, available || 180)
      const loaded = await loadSbaBank(exam.id, take)
      if (loaded.error || loaded.questions.length === 0) {
        setLocalError(loaded.error ?? 'Could not load questions.')
        setBusy(false)
        return
      }
      questions = loaded.questions
    } else {
      const take = Math.min(target, available || target)
      const loaded = await loadSbaBank(exam.id, take)
      if (loaded.error || loaded.questions.length === 0) {
        setLocalError(loaded.error ?? 'Could not load questions.')
        setBusy(false)
        return
      }
      questions = loaded.questions
    }

    const mins = isUnlimited
      ? 0
      : Math.min(180, Math.max(1, Number(minutes) || defaults.minutes))

    const created = await createMockSession({
      userId: user.id,
      config: {
        examId: exam.id,
        mode: timedMode,
        targetQuestionCount: questions.length,
        timeLimitSec: mins * 60,
        useAvailableBank: true,
      },
      questions,
    })
    if (created.error || !created.sessionId || !created.progress) {
      setLocalError(created.error ?? 'Failed to start.')
      setBusy(false)
      return
    }
    setRun({
      sessionId: created.sessionId,
      mode: timedMode,
      questions,
      progress: created.progress,
    })
    setBusy(false)
  }

  async function resume(session: StudySession) {
    if (!user || !exam) return
    setBusy(true)
    setLocalError(null)
    const progress = progressFromSession(session)
    if (!progress) {
      setLocalError('Could not restore saved progress for that session.')
      setBusy(false)
      return
    }
    const questions = await loadQuestionsByIds(progress.questionIds)
    if (questions.length === 0) {
      setLocalError('Saved questions are missing from the bank.')
      setBusy(false)
      return
    }
    setRun({
      sessionId: session.id,
      mode: progress.mode,
      questions,
      progress,
    })
    setBusy(false)
  }

  if (run && exam && user) {
    return (
      <AppShell title={mode.title}>
        <MockRunner
          key={run.sessionId}
          sessionId={run.sessionId}
          examId={exam.id}
          userId={user.id}
          mode={run.mode}
          questions={run.questions}
          initialProgress={run.progress}
          passMarkPercent={Number(settings?.pass_mark_percent ?? 65)}
        />
      </AppShell>
    )
  }

  return (
    <AppShell title={mode.title}>
      <div className="flex max-w-2xl flex-col gap-6">
        {loading ? <p className="text-sm text-muted">Loading exam settings…</p> : null}
        {!schemaMissing && error ? <p className="text-sm text-incorrect">{error}</p> : null}
        {localError ? <p className="text-sm text-incorrect">{localError}</p> : null}

        <EmptyBankHint examMissing={examMissing} bankEmpty={bankEmpty} className="rounded-md border border-border bg-surface px-4 py-3 text-sm text-muted" />

        {!isUnlimited ? (
          <section className="rounded-md border border-border bg-surface p-4 text-sm">
            <h2 className="mb-2 font-display font-semibold text-accent">Exam Settings</h2>
            <div className="flex flex-wrap gap-2">
              <Badge tone="accent">{defaults.questions} Questions</Badge>
              <Badge tone="accent">{defaults.minutes} Minutes</Badge>
              <Badge tone="accent">Pass {settings?.pass_mark_percent ?? 65}%</Badge>
            </div>
          </section>
        ) : (
          <section className="rounded-md border border-border bg-surface p-4 text-sm">
            <h2 className="mb-1 font-display font-semibold text-accent">Unlimited</h2>
            <p className="text-muted">
              No question or time targets — work through the bank and press Finish when done.
            </p>
          </section>
        )}

        {openSessions.length > 0 && !isThemed ? (
          <section className="rounded-md border border-accent/40 bg-accent-subtle p-4">
            <h2 className="mb-2 font-display font-semibold">Resume Unfinished</h2>
            <ul className="flex flex-col gap-2">
              {openSessions.map((s) => {
                const p = progressFromSession(s)
                return (
                  <li
                    key={s.id}
                    className="flex flex-wrap items-center justify-between gap-2 rounded border border-border bg-surface px-3 py-2 text-sm"
                  >
                    <span>
                      {s.session_type === 'full_mock' ? 'Full Test' : 'Unlimited'} · started{' '}
                      {new Date(s.started_at).toLocaleString()}
                      {p ? ` · ${Object.keys(p.answers).length}/${p.questionIds.length} answered` : ''}
                    </span>
                    <Button disabled={busy} onClick={() => void resume(s)}>
                      Resume
                    </Button>
                  </li>
                )
              })}
            </ul>
          </section>
        ) : null}

        <section className="flex flex-col gap-4 rounded-md border border-border bg-surface p-4">
          {isThemed ? (
            <Select
              label="Theme"
              name="theme-topic"
              value={themeKey || WEAKNESS_THEME}
              onChange={(e) => setThemeKey(e.target.value)}
              options={themeOptions}
            />
          ) : null}

          {!isUnlimited ? (
            <div className="grid gap-3 sm:grid-cols-2">
              <Input
                label="Question Target (Max 180)"
                name="qcount"
                type="number"
                min={1}
                max={180}
                value={questionCount}
                onChange={(e) => setQuestionCount(e.target.value)}
                className="border-accent/50 focus:border-accent focus:outline-none focus:ring-1 focus:ring-accent"
              />
              <Input
                label="Time Limit (Minutes, Max 180)"
                name="minutes"
                type="number"
                min={1}
                max={180}
                value={minutes}
                onChange={(e) => setMinutes(e.target.value)}
                className="border-accent/50 focus:border-accent focus:outline-none focus:ring-1 focus:ring-accent"
              />
            </div>
          ) : null}

          <Button disabled={busy || !exam || bankEmpty} onClick={() => void startNew()}>
            {busy ? 'Starting…' : 'Start Test'}
          </Button>
        </section>
      </div>
    </AppShell>
  )
}

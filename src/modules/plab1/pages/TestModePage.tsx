import { useEffect, useState } from 'react'
import { Navigate, useParams } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
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
  progressFromSession,
} from '@/modules/shared/quiz-engine/mock/mockPersist'
import type { QuestionWithOptions, StudySession } from '@/types/database'
import type { MockProgressState, TimedMode } from '@/types/quiz'

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
  const [topicId, setTopicId] = useState('')
  const [questionCount, setQuestionCount] = useState(String(defaults.questions))
  const [minutes, setMinutes] = useState(String(defaults.minutes))
  const [openSessions, setOpenSessions] = useState<StudySession[]>([])
  const [busy, setBusy] = useState(false)
  const [localError, setLocalError] = useState<string | null>(null)
  const [run, setRun] = useState<ActiveRun | null>(null)

  useEffect(() => {
    if (settings) {
      setQuestionCount(String(settings.default_mock_question_count ?? 180))
      setMinutes(String(settings.default_mock_minutes ?? 180))
    }
  }, [settings])

  useEffect(() => {
    if (topics[0] && !topicId) setTopicId(topics[0].id)
  }, [topics, topicId])

  useEffect(() => {
    if (!exam || !user) return
    void (async () => {
      setBankCount(await countActiveSba(exam.id))
      setOpenSessions(await findOpenTimedSessions({ userId: user.id, examId: exam.id }))
    })()
  }, [exam, user])

  if (!user) return <Navigate to="/login" replace />
  if (!mode) return <Navigate to="/tests/full-test" replace />

  const timedMode: TimedMode =
    mode.uiMode === 'as_many_as_you_can' ? 'as_many_as_you_can' : 'full_mock'
  const isThemed = mode.uiMode === 'themed'

  async function startNew() {
    if (!exam || !user) return
    setBusy(true)
    setLocalError(null)
    const target = Math.min(180, Math.max(1, Number(questionCount) || defaults.questions))
    const mins = Math.min(180, Math.max(1, Number(minutes) || defaults.minutes))
    const available = bankCount ?? 0
    if (available <= 0) {
      setLocalError('No questions available yet.')
      setBusy(false)
      return
    }
    const take = Math.min(target, available)
    const loaded = await loadSbaBank(exam.id, take)
    if (loaded.error || loaded.questions.length === 0) {
      setLocalError(loaded.error ?? 'Could not load questions.')
      setBusy(false)
      return
    }
    let questions = loaded.questions
    if (isThemed && topicId) {
      const themed = questions.filter((q) => q.topic_id === topicId)
      if (themed.length === 0) {
        setLocalError('No questions in that topic yet — try another theme.')
        setBusy(false)
        return
      }
      questions = themed
    }
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

  const available = bankCount ?? 0
  const requested = Number(questionCount) || defaults.questions
  const willUse = Math.min(requested, available || requested)

  return (
    <AppShell title={mode.title}>
      <div className="flex max-w-2xl flex-col gap-6">
        {loading ? <p className="text-sm text-muted">Loading exam settings…</p> : null}
        {!schemaMissing && error ? <p className="text-sm text-incorrect">{error}</p> : null}
        {localError ? <p className="text-sm text-incorrect">{localError}</p> : null}

        <section className="rounded-md border border-border bg-surface p-4 text-sm">
          <h2 className="mb-2 font-display font-semibold text-accent">Exam Settings</h2>
          <div className="flex flex-wrap gap-2">
            <Badge tone="accent">{defaults.questions} Questions</Badge>
            <Badge tone="accent">{defaults.minutes} Minutes</Badge>
            <Badge tone="accent">Pass {settings?.pass_mark_percent ?? 65}%</Badge>
          </div>
          {available > 0 && available < requested ? (
            <p className="mt-2 text-muted">
              This run will use <strong className="text-fg">{willUse}</strong> questions.
            </p>
          ) : null}
        </section>

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
            topics.length > 0 ? (
              <Select
                label="Theme (Topic)"
                name="theme-topic"
                value={topicId}
                onChange={(e) => setTopicId(e.target.value)}
                options={topics.map((t) => ({ value: t.id, label: t.name }))}
              />
            ) : (
              <p className="text-sm text-muted">No topics available yet.</p>
            )
          ) : null}

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

          <Button disabled={busy || !exam} onClick={() => void startNew()}>
            {busy ? 'Starting…' : 'Start Test'}
          </Button>
        </section>
      </div>
    </AppShell>
  )
}

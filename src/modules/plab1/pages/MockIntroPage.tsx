import { useEffect, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { Badge } from '@/components/ui/Badge'
import { Select } from '@/components/ui/Select'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { MockRunner } from '@/modules/shared/quiz-engine/mock/MockRunner'
import {
  countActiveSba,
  createMockSession,
  defaultMockLimits,
  finalizeMockSession,
  findOpenTimedSessions,
  loadQuestionsByIds,
  loadSbaBank,
  progressFromSession,
} from '@/modules/shared/quiz-engine/mock/mockPersist'
import { formatDuration } from '@/modules/shared/quiz-engine/pace'
import type { QuestionWithOptions, StudySession } from '@/types/database'
import type { MockProgressState, TimedMode } from '@/types/quiz'

type ActiveRun = {
  sessionId: string
  mode: TimedMode
  questions: QuestionWithOptions[]
  progress: MockProgressState
}

type UiMode = TimedMode | 'themed'

export function MockIntroPage() {
  const { user } = useAuth()
  const { loading, exam, settings, topics, error, schemaMissing } = useExam()
  const [params] = useSearchParams()
  const defaults = defaultMockLimits(settings)
  const [bankCount, setBankCount] = useState<number | null>(null)
  const [uiMode, setUiMode] = useState<UiMode>('full_mock')
  const [topicId, setTopicId] = useState('')
  const [questionCount, setQuestionCount] = useState(String(defaults.questions))
  const [minutes, setMinutes] = useState(String(defaults.minutes))
  const [openSessions, setOpenSessions] = useState<StudySession[]>([])
  const [busy, setBusy] = useState(false)
  const [localError, setLocalError] = useState<string | null>(null)
  const [run, setRun] = useState<ActiveRun | null>(null)

  useEffect(() => {
    const m = params.get('mode')
    if (m === 'full_mock' || m === 'as_many_as_you_can' || m === 'themed') setUiMode(m)
  }, [params])

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

  const timedMode: TimedMode =
    uiMode === 'as_many_as_you_can' ? 'as_many_as_you_can' : 'full_mock'

  async function startNew() {
    if (!exam || !user) return
    setBusy(true)
    setLocalError(null)
    const target = Math.min(180, Math.max(1, Number(questionCount) || defaults.questions))
    const mins = Math.min(180, Math.max(1, Number(minutes) || defaults.minutes))
    const available = bankCount ?? 0
    if (available <= 0) {
      setLocalError('No active SBA questions in the bank yet.')
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
    if (uiMode === 'themed' && topicId) {
      const themed = questions.filter((q) => q.topic_id === topicId)
      if (themed.length === 0) {
        setLocalError('No questions in that topic yet — try another theme or Full Test.')
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

  async function terminate(session: StudySession) {
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
    const finished = await finalizeMockSession({
      sessionId: session.id,
      examId: exam.id,
      userId: user.id,
      questions,
      progress,
      passMarkPercent: Number(settings?.pass_mark_percent ?? 65),
    })
    if (finished.error) {
      setLocalError(finished.error)
      setBusy(false)
      return
    }
    setOpenSessions((prev) => prev.filter((s) => s.id !== session.id))
    setBusy(false)
  }

  if (run && exam && user) {
    return (
      <AppShell title={run.mode === 'full_mock' ? 'Full Test' : 'Unlimited'}>
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
    <AppShell title="Tests">
      <div className="flex max-w-2xl flex-col gap-6">
        <p className="text-sm text-muted">
          Full Test: timed exam conditions. Unlimited: same timer/cap, stop whenever you want.
          Themed Test: focus on one topic. Pace is summarised in the end report.
        </p>

        {loading ? <p className="text-sm text-muted">Loading exam settings…</p> : null}
        {!schemaMissing && error ? <p className="text-sm text-incorrect">{error}</p> : null}
        {localError ? <p className="text-sm text-incorrect">{localError}</p> : null}
        {!exam && !loading ? <p className="text-sm text-muted">Exam not available yet.</p> : null}

        <section className="rounded-md border border-border bg-surface p-4 text-sm">
          <h2 className="mb-2 font-display font-semibold">Defaults from exam settings</h2>
          <div className="flex flex-wrap gap-2">
            <Badge tone="accent">{defaults.questions} questions</Badge>
            <Badge>{defaults.minutes} minutes</Badge>
            <Badge>Pass {settings?.pass_mark_percent ?? 65}%</Badge>
            <Badge tone={available > 0 ? 'correct' : 'incorrect'}>
              Bank: {bankCount == null ? '…' : available} active SBA
            </Badge>
          </div>
          {available > 0 && available < requested ? (
            <p className="mt-2 text-muted">
              The bank has fewer items than the target, so this run will use{' '}
              <strong className="text-fg">{willUse}</strong> questions.
            </p>
          ) : null}
        </section>

        {openSessions.length > 0 ? (
          <section className="rounded-md border border-accent/40 bg-accent-subtle p-4">
            <h2 className="mb-2 font-display font-semibold">Resume unfinished</h2>
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
                    <div className="flex flex-wrap gap-2">
                      <Button disabled={busy} onClick={() => void resume(s)}>
                        Resume
                      </Button>
                      <Button
                        variant="danger"
                        disabled={busy}
                        onClick={() => void terminate(s)}
                      >
                        Terminate
                      </Button>
                    </div>
                  </li>
                )
              })}
            </ul>
          </section>
        ) : null}

        <section className="flex flex-col gap-4 rounded-md border border-border bg-surface p-4">
          <div className="flex flex-wrap gap-2">
            <Button
              type="button"
              variant={uiMode === 'full_mock' ? 'primary' : 'secondary'}
              onClick={() => setUiMode('full_mock')}
            >
              Full Test
            </Button>
            <Button
              type="button"
              variant={uiMode === 'as_many_as_you_can' ? 'primary' : 'secondary'}
              onClick={() => setUiMode('as_many_as_you_can')}
            >
              Unlimited
            </Button>
            <Button
              type="button"
              variant={uiMode === 'themed' ? 'primary' : 'secondary'}
              onClick={() => setUiMode('themed')}
            >
              Themed Test
            </Button>
          </div>

          {uiMode === 'themed' ? (
            topics.length > 0 ? (
              <Select
                label="Theme (topic)"
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
              label="Question target (max 180)"
              name="qcount"
              type="number"
              min={1}
              max={180}
              value={questionCount}
              onChange={(e) => setQuestionCount(e.target.value)}
            />
            <Input
              label="Time limit (minutes, max 180)"
              name="minutes"
              type="number"
              min={1}
              max={180}
              value={minutes}
              onChange={(e) => setMinutes(e.target.value)}
            />
          </div>

          <p className="text-xs text-muted">
            Estimated pace target ~{formatDuration((Number(minutes) || defaults.minutes) * 60)} for{' '}
            {willUse} questions.
          </p>

          <Button disabled={busy || !exam} onClick={() => void startNew()}>
            {busy ? 'Starting…' : 'Start test'}
          </Button>
        </section>

        <p className="text-sm">
          Prefer tutor feedback after each item?{' '}
          <Link className="text-accent hover:underline" to="/study">
            Open Practice hub →
          </Link>
        </p>
      </div>
    </AppShell>
  )
}

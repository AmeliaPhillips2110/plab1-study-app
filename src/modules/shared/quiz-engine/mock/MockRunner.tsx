import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Button } from '@/components/ui/Button'
import { fetchGlossaryTerms } from '@/features/glossary/glossaryApi'
import { StemWithGlossary } from '@/features/glossary/StemWithGlossary'
import { SbaOptions } from '@/modules/shared/quiz-engine/SbaOptions'
import { MockReview } from '@/modules/shared/quiz-engine/mock/MockReview'
import { PaceWidget } from '@/modules/shared/quiz-engine/mock/PaceWidget'
import { QuestionNavigator } from '@/modules/shared/quiz-engine/mock/QuestionNavigator'
import {
  autosaveMockProgress,
  finalizeMockSession,
} from '@/modules/shared/quiz-engine/mock/mockPersist'
import { formatDuration, maybeRecordPaceSample } from '@/modules/shared/quiz-engine/pace'
import type { GlossaryTerm, QuestionWithOptions } from '@/types/database'
import type { MockProgressState, TimedMode } from '@/types/quiz'

type Props = {
  sessionId: string
  examId: string
  userId: string
  mode: TimedMode
  questions: QuestionWithOptions[]
  initialProgress: MockProgressState
  passMarkPercent: number
}

type Phase = 'running' | 'submitting' | 'review'

export function MockRunner({
  sessionId,
  examId,
  userId,
  mode,
  questions,
  initialProgress,
  passMarkPercent,
}: Props) {
  const [progress, setProgress] = useState<MockProgressState>(initialProgress)
  const [phase, setPhase] = useState<Phase>('running')
  const [now, setNow] = useState(() => Date.now())
  const [error, setError] = useState<string | null>(null)
  const [saveHint, setSaveHint] = useState<string | null>(null)
  const [glossaryTerms, setGlossaryTerms] = useState<GlossaryTerm[]>([])
  const [resultMeta, setResultMeta] = useState<{
    percent: number
    correct: number
    answered: number
    passed: boolean
    attemptIdByQuestionId: Record<string, string>
  } | null>(null)
  const progressRef = useRef(progress)
  progressRef.current = progress

  useEffect(() => {
    void (async () => {
      const { terms } = await fetchGlossaryTerms(examId)
      setGlossaryTerms(terms)
    })()
  }, [examId])

  const startedMs = useMemo(() => new Date(progress.startedAt).getTime(), [progress.startedAt])
  const deadlineMs = useMemo(() => new Date(progress.deadlineAt).getTime(), [progress.deadlineAt])
  const elapsedSec = Math.max(0, Math.floor((now - startedMs) / 1000))
  const remainingSec = Math.max(0, Math.floor((deadlineMs - now) / 1000))
  const answeredCount = Object.keys(progress.answers).length

  const current = questions[progress.currentIndex] ?? null
  const flaggedSet = useMemo(() => new Set(progress.flagged), [progress.flagged])

  const persist = useCallback(
    async (next: MockProgressState, quiet = false) => {
      setProgress(next)
      const { error: saveErr } = await autosaveMockProgress({ sessionId, progress: next })
      if (saveErr) {
        setError(`Auto-save failed: ${saveErr} (kept a local backup)`)
      } else if (!quiet) {
        setSaveHint(`Saved ${new Date(next.autosavedAt).toLocaleTimeString()}`)
      }
    },
    [sessionId],
  )

  // Tick countdown + periodic pace samples / autosave
  useEffect(() => {
    if (phase !== 'running') return
    const tick = window.setInterval(() => setNow(Date.now()), 1000)
    return () => window.clearInterval(tick)
  }, [phase])

  useEffect(() => {
    if (phase !== 'running') return
    if (remainingSec <= 0) {
      void submitTest('time')
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps -- submit on deadline only
  }, [remainingSec, phase])

  useEffect(() => {
    if (phase !== 'running') return
    const id = window.setInterval(() => {
      const currentProgress = progressRef.current
      const elapsed = Math.max(0, Math.floor((Date.now() - new Date(currentProgress.startedAt).getTime()) / 1000))
      const answered = Object.keys(currentProgress.answers).length
      const withPace = {
        ...currentProgress,
        paceSamples: maybeRecordPaceSample(currentProgress.paceSamples, elapsed, answered, 30),
      }
      void persist(withPace, true)
    }, 20000)
    return () => window.clearInterval(id)
  }, [phase, persist])

  // Warn on refresh/close while running
  useEffect(() => {
    if (phase !== 'running') return
    const onBeforeUnload = (e: BeforeUnloadEvent) => {
      e.preventDefault()
      e.returnValue = ''
    }
    window.addEventListener('beforeunload', onBeforeUnload)
    return () => window.removeEventListener('beforeunload', onBeforeUnload)
  }, [phase])

  async function submitTest(_reason: 'manual' | 'time' | 'cap') {
    if (phase !== 'running') return
    setPhase('submitting')
    setError(null)
    const latest = progressRef.current
    const elapsed = Math.max(0, Math.floor((Date.now() - new Date(latest.startedAt).getTime()) / 1000))
    const answered = Object.keys(latest.answers).length
    const finalProgress = {
      ...latest,
      paceSamples: maybeRecordPaceSample(latest.paceSamples, elapsed, answered, 0),
    }
    const finished = await finalizeMockSession({
      sessionId,
      examId,
      userId,
      questions,
      progress: finalProgress,
      passMarkPercent,
    })
    if (finished.error) {
      setError(finished.error)
      setPhase('running')
      return
    }
    setProgress(finalProgress)
    setResultMeta({
      percent: finished.percent,
      correct: finished.correct,
      answered: finished.answered,
      passed: finished.passed,
      attemptIdByQuestionId: finished.attemptIdByQuestionId,
    })
    setPhase('review')
  }

  async function selectOption(optionId: string) {
    if (!current || phase !== 'running') return
    const answers = { ...progress.answers, [current.id]: optionId }
    // AMAYC soft cap: stop when hitting target answered count if configured as "as many"
    const next: MockProgressState = {
      ...progress,
      answers,
      paceSamples: maybeRecordPaceSample(
        progress.paceSamples,
        elapsedSec,
        Object.keys(answers).length,
        15,
      ),
    }
    await persist(next)

    if (mode === 'as_many_as_you_can' && Object.keys(answers).length >= progress.targetCount) {
      await submitTest('cap')
    }
  }

  async function toggleFlag() {
    if (!current) return
    const flagged = flaggedSet.has(current.id)
      ? progress.flagged.filter((id) => id !== current.id)
      : [...progress.flagged, current.id]
    await persist({ ...progress, flagged })
  }

  async function goTo(index: number) {
    const clamped = Math.max(0, Math.min(questions.length - 1, index))
    await persist({ ...progress, currentIndex: clamped }, true)
  }

  if (phase === 'review' && resultMeta) {
    return (
      <MockReview
        mode={mode}
        questions={questions}
        progress={progress}
        percent={resultMeta.percent}
        correct={resultMeta.correct}
        answered={resultMeta.answered}
        passed={resultMeta.passed}
        passMark={passMarkPercent}
        elapsedSec={elapsedSec}
        attemptIdByQuestionId={resultMeta.attemptIdByQuestionId}
      />
    )
  }

  if (!current) {
    return <p className="text-sm text-incorrect">No questions loaded for this session.</p>
  }

  return (
    <div className="flex flex-col gap-4 lg:grid lg:grid-cols-[minmax(0,1fr)_280px] lg:items-start">
      <div className="flex flex-col gap-4">
        <header className="flex flex-wrap items-center justify-between gap-3 rounded-md border border-border bg-surface px-4 py-3">
          <div>
            <p className="text-sm font-semibold">
              {mode === 'full_mock' ? 'Full mock' : 'As many as you can'}
            </p>
            <p className="text-xs text-muted">
              Question {progress.currentIndex + 1} of {questions.length} · no feedback until you end
            </p>
          </div>
          <div className="text-right">
            <p
              className={
                remainingSec <= 300
                  ? 'text-lg font-semibold text-incorrect'
                  : 'text-lg font-semibold text-fg'
              }
              aria-label="Time remaining"
            >
              {formatDuration(remainingSec)}
            </p>
            <p className="text-xs text-muted">countdown</p>
          </div>
        </header>

        <PaceWidget
          compact
          elapsedSec={elapsedSec}
          timeLimitSec={progress.timeLimitSec}
          answeredCount={answeredCount}
          totalQuestions={questions.length}
        />

        <div className="rounded-md border border-border bg-surface p-4">
          <div className="mb-4">
            <StemWithGlossary text={current.stem} terms={glossaryTerms} />
            {current.is_uk_practice ? (
              <p className="mt-2 text-xs font-medium text-accent">UK practice item</p>
            ) : null}
          </div>
          <SbaOptions
            options={current.question_options}
            selectedId={progress.answers[current.id] ?? null}
            revealed={false}
            onSelect={(id) => void selectOption(id)}
          />
        </div>

        <div className="flex flex-wrap items-center gap-2">
          <Button
            variant="secondary"
            disabled={progress.currentIndex <= 0}
            onClick={() => void goTo(progress.currentIndex - 1)}
          >
            Previous
          </Button>
          <Button
            variant="secondary"
            disabled={progress.currentIndex >= questions.length - 1}
            onClick={() => void goTo(progress.currentIndex + 1)}
          >
            Next
          </Button>
          <Button variant={flaggedSet.has(current.id) ? 'primary' : 'ghost'} onClick={() => void toggleFlag()}>
            {flaggedSet.has(current.id) ? 'Flagged' : 'Flag for review'}
          </Button>
          <div className="ml-auto">
            <Button
              variant="danger"
              disabled={phase === 'submitting'}
              onClick={() => {
                const unanswered = questions.length - answeredCount
                const msg =
                  mode === 'full_mock'
                    ? `Finish mock now? ${unanswered} unanswered will be marked skipped.`
                    : `Finish now? You have answered ${answeredCount} of ${questions.length}.`
                if (window.confirm(msg)) void submitTest('manual')
              }}
            >
              {phase === 'submitting' ? 'Submitting…' : 'Finish'}
            </Button>
          </div>
        </div>

        {saveHint ? <p className="text-xs text-muted">Auto-save: {saveHint}</p> : null}
        {error ? <p className="text-sm text-incorrect">{error}</p> : null}
      </div>

      <aside className="flex flex-col gap-3">
        <QuestionNavigator
          total={questions.length}
          currentIndex={progress.currentIndex}
          answers={progress.answers}
          flagged={flaggedSet}
          questionIds={progress.questionIds}
          onJump={(i) => void goTo(i)}
        />
        <p className="text-xs text-muted">
          Progress auto-saves to Supabase and this browser. You can resume an unfinished timed test
          from the Tests page.
        </p>
      </aside>
    </div>
  )
}

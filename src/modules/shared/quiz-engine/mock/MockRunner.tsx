import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Button } from '@/components/ui/Button'
import { LabValuesButton } from '@/features/lab-values'
import { fetchGlossaryTerms } from '@/features/glossary/glossaryApi'
import { QuestionImage, questionImageUrl } from '@/components/ui/QuestionImage'
import { StemWithGlossary } from '@/features/glossary/StemWithGlossary'
import { SbaOptions } from '@/modules/shared/quiz-engine/SbaOptions'
import { MockReview } from '@/modules/shared/quiz-engine/mock/MockReview'
import { PaceWidget } from '@/modules/shared/quiz-engine/mock/PaceWidget'
import { QuestionNavigator } from '@/modules/shared/quiz-engine/mock/QuestionNavigator'
import {
  autosaveMockProgress,
  finalizeMockSession,
  normalizeMockProgress,
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
  const [progress, setProgress] = useState<MockProgressState>(() =>
    normalizeMockProgress(initialProgress),
  )
  const [phase, setPhase] = useState<Phase>('running')
  const [now, setNow] = useState(() => Date.now())
  const [error, setError] = useState<string | null>(null)
  const [saveHint, setSaveHint] = useState<string | null>(null)
  const [glossaryTerms, setGlossaryTerms] = useState<GlossaryTerm[]>([])
  const [resultMeta, setResultMeta] = useState<{
    percent: number
    correct: number
    answered: number
    skipped: number
    timesChanged: number
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
  const openedSet = useMemo(() => new Set(progress.openedIds ?? []), [progress.openedIds])

  const persist = useCallback(
    async (next: MockProgressState, quiet = false) => {
      const normalized = normalizeMockProgress(next)
      setProgress(normalized)
      const { error: saveErr } = await autosaveMockProgress({ sessionId, progress: normalized })
      if (saveErr) {
        setError(`Auto-save failed: ${saveErr} (kept a local backup)`)
      } else if (!quiet) {
        setSaveHint(`Saved ${new Date(normalized.autosavedAt).toLocaleTimeString()}`)
      }
    },
    [sessionId],
  )

  // Mark current question as opened whenever the index changes.
  useEffect(() => {
    if (phase !== 'running' || !current) return
    const opened = progressRef.current.openedIds ?? []
    if (opened.includes(current.id)) return
    void persist(
      {
        ...progressRef.current,
        openedIds: [...opened, current.id],
      },
      true,
    )
  }, [phase, current, persist])

  // Tick countdown + periodic pace samples / autosave
  useEffect(() => {
    if (phase !== 'running') return
    const tick = window.setInterval(() => setNow(Date.now()), 1000)
    return () => window.clearInterval(tick)
  }, [phase])

  const unlimited = mode === 'as_many_as_you_can' || progress.timeLimitSec <= 0

  useEffect(() => {
    if (phase !== 'running' || unlimited) return
    if (remainingSec <= 0) {
      void submitTest('time')
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps -- submit on deadline only
  }, [remainingSec, phase, unlimited])

  useEffect(() => {
    if (phase !== 'running') return
    const id = window.setInterval(() => {
      const currentProgress = progressRef.current
      const elapsed = Math.max(
        0,
        Math.floor((Date.now() - new Date(currentProgress.startedAt).getTime()) / 1000),
      )
      const answered = Object.keys(currentProgress.answers).length
      const withPace = {
        ...currentProgress,
        paceSamples: maybeRecordPaceSample(currentProgress.paceSamples, elapsed, answered, 30),
      }
      void persist(withPace, true)
    }, 20000)
    return () => window.clearInterval(id)
  }, [phase, persist])

  // Autosave progress (+ last selected answers) when navigating away / closing
  useEffect(() => {
    if (phase !== 'running') return
    const flush = () => {
      void autosaveMockProgress({ sessionId, progress: progressRef.current })
    }
    const onBeforeUnload = (e: BeforeUnloadEvent) => {
      flush()
      e.preventDefault()
      e.returnValue = ''
    }
    window.addEventListener('beforeunload', onBeforeUnload)
    window.addEventListener('pagehide', flush)
    return () => {
      flush()
      window.removeEventListener('beforeunload', onBeforeUnload)
      window.removeEventListener('pagehide', flush)
    }
  }, [phase, sessionId])

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
      skipped: finished.skipped,
      timesChanged: finished.timesChanged,
      passed: finished.passed,
      attemptIdByQuestionId: finished.attemptIdByQuestionId,
    })
    setPhase('review')
  }

  async function selectOption(optionId: string) {
    if (!current || phase !== 'running') return
    const prev = progress.answers[current.id]
    const answerChanges = { ...(progress.answerChanges ?? {}) }
    if (prev && prev !== optionId) {
      answerChanges[current.id] = (answerChanges[current.id] ?? 0) + 1
    }
    const answers = { ...progress.answers, [current.id]: optionId }
    const openedIds = progress.openedIds?.includes(current.id)
      ? progress.openedIds
      : [...(progress.openedIds ?? []), current.id]
    const next: MockProgressState = {
      ...progress,
      answers,
      answerChanges,
      openedIds,
      paceSamples: maybeRecordPaceSample(
        progress.paceSamples,
        elapsedSec,
        Object.keys(answers).length,
        15,
      ),
    }
    await persist(next)
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
    const qid = questions[clamped]?.id
    const openedIds =
      qid && !(progress.openedIds ?? []).includes(qid)
        ? [...(progress.openedIds ?? []), qid]
        : progress.openedIds
    await persist({ ...progress, currentIndex: clamped, openedIds }, true)
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
        skipped={resultMeta.skipped}
        timesChanged={resultMeta.timesChanged}
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
    <div className="flex w-full flex-col gap-4">
      <header className="flex flex-wrap items-center justify-between gap-3 rounded-md border border-border bg-surface px-4 py-3">
        <div>
          <p className="text-sm font-semibold">
            {mode === 'full_mock' ? 'Full Test' : 'Unlimited'}
          </p>
          <p className="text-xs text-muted">
            {unlimited ? 'Finish when done' : 'Timed paper'}
          </p>
        </div>
        <div className="flex flex-wrap items-center gap-3">
          <LabValuesButton />
          {unlimited ? (
            <div className="text-right">
              <p className="text-lg font-semibold text-fg" aria-label="Elapsed time">
                {formatDuration(elapsedSec)}
              </p>
              <p className="text-xs text-muted">Elapsed</p>
            </div>
          ) : (
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
              <p className="text-xs text-muted">Countdown</p>
            </div>
          )}
        </div>
      </header>

      {!unlimited ? (
        <PaceWidget
          compact
          elapsedSec={elapsedSec}
          timeLimitSec={progress.timeLimitSec}
          answeredCount={answeredCount}
          totalQuestions={questions.length}
        />
      ) : null}

      <div className="flex flex-col gap-4 lg:flex-row lg:items-start">
        <div className="min-w-0 flex-1 rounded-md border border-border bg-surface p-4">
          <div className="mb-4 flex flex-col gap-3">
            <StemWithGlossary text={current.stem} terms={glossaryTerms} />
            {questionImageUrl(current.payload) ? (
              <QuestionImage
                src={questionImageUrl(current.payload)!}
                alt="Clinical figure for this question"
              />
            ) : null}
            {current.is_uk_practice ? (
              <p className="text-xs font-medium text-accent">UK practice item</p>
            ) : null}
          </div>
          <SbaOptions
            options={current.question_options}
            selectedId={progress.answers[current.id] ?? null}
            revealed={false}
            onSelect={(id) => void selectOption(id)}
          />
        </div>

        <QuestionNavigator
          total={questions.length}
          currentIndex={progress.currentIndex}
          answers={progress.answers}
          flagged={flaggedSet}
          questionIds={progress.questionIds}
          openedIds={openedSet}
          onJump={(i) => void goTo(i)}
          onBack={() => void goTo(progress.currentIndex - 1)}
          onNext={() => void goTo(progress.currentIndex + 1)}
          canGoBack={progress.currentIndex > 0}
          canGoNext={progress.currentIndex < questions.length - 1}
        />
      </div>

      <div className="flex flex-wrap items-center gap-2">
        <button
          type="button"
          className={
            flaggedSet.has(current.id)
              ? 'inline-flex items-center gap-1 rounded-md px-2 py-1.5 text-sm text-incorrect'
              : 'inline-flex items-center gap-1 rounded-md px-2 py-1.5 text-sm text-muted hover:text-incorrect'
          }
          aria-pressed={flaggedSet.has(current.id)}
          aria-label={flaggedSet.has(current.id) ? 'Remove flag' : 'Flag for review'}
          onClick={() => void toggleFlag()}
        >
          <span aria-hidden className="text-lg leading-none text-incorrect">
            ⚑
          </span>
          <span className="sr-only sm:not-sr-only sm:inline">
            {flaggedSet.has(current.id) ? 'Flagged' : 'Flag for Review'}
          </span>
        </button>
        <div className="ml-auto">
          <Button
            variant="danger"
            disabled={phase === 'submitting'}
            onClick={() => {
              const unanswered = questions.length - answeredCount
              const msg =
                mode === 'full_mock'
                  ? `Finish test now? Opened unanswered become Skipped; never-opened stay New (${unanswered} unanswered).`
                  : `Finish now? You have answered ${answeredCount} of ${questions.length}.`
              if (window.confirm(msg)) void submitTest('manual')
            }}
          >
            {phase === 'submitting' ? 'Submitting…' : 'Finish'}
          </Button>
        </div>
      </div>

      <p className="text-center text-sm font-medium text-muted" aria-live="polite">
        {unlimited
          ? `${answeredCount} Questions Completed`
          : `${answeredCount}/${questions.length} Questions`}
      </p>

      {saveHint ? <p className="text-xs text-muted">Auto-save: {saveHint}</p> : null}
      {error ? <p className="text-sm text-incorrect">{error}</p> : null}
    </div>
  )
}

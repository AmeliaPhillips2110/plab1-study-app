import { useEffect, useState, type ReactNode } from 'react'
import { Button } from '@/components/ui/Button'
import { countWords } from '@/features/glossary/glossaryApi'
import { StemWithGlossary } from '@/features/glossary/StemWithGlossary'
import { FeedbackPanel } from '@/modules/shared/quiz-engine/FeedbackPanel'
import { FlashcardView } from '@/modules/shared/quiz-engine/FlashcardView'
import { SbaOptions } from '@/modules/shared/quiz-engine/SbaOptions'
import { gradeToResult } from '@/modules/shared/quiz-engine/scoring'
import type {
  AttemptResult,
  GlossaryTerm,
  PresentationFormat,
  QuestionWithOptions,
} from '@/types/database'
import type { FlashcardGrade, QuizAnswerPayload } from '@/types/quiz'

type SubmitArgs = {
  result: AttemptResult
  selectedOptionId: string | null
  payload: QuizAnswerPayload
  timeSpentMs: number | null
  answerChanges: number
}

type Props = {
  question: QuestionWithOptions
  format: PresentationFormat
  rapidFireSeconds?: number
  index: number
  total: number
  /** When true, show "X Questions Completed" instead of "X/N". */
  openProgress?: boolean
  completedCount?: number
  glossaryTerms?: GlossaryTerm[]
  readingSpeedWpm?: number | null
  /** Topic theme label shown top-right under This Question. */
  topicName?: string | null
  /** Locked review of an already-answered item. */
  lockedResult?: AttemptResult | null
  lockedSelectedId?: string | null
  /** Pre-selected draft (not yet submitted). */
  initialSelectedId?: string | null
  onBack?: () => void
  canGoBack?: boolean
  onFinish?: () => void
  finishDisabled?: boolean
  /** Draft selection change (for leave-autosave before Submit). */
  onDraftSelect?: (optionId: string | null) => void
  onSubmit: (args: SubmitArgs) => void
}

export function QuestionView({
  question,
  format,
  rapidFireSeconds = 15,
  index,
  total,
  openProgress = false,
  completedCount = 0,
  glossaryTerms = [],
  topicName = null,
  lockedResult = null,
  lockedSelectedId = null,
  initialSelectedId = null,
  onBack,
  canGoBack = false,
  onFinish,
  finishDisabled = false,
  onDraftSelect,
  onSubmit,
}: Props) {
  const [selectedId, setSelectedId] = useState<string | null>(
    lockedSelectedId ?? initialSelectedId,
  )
  const [revealed, setRevealed] = useState(Boolean(lockedResult))
  const [coverOpen, setCoverOpen] = useState(format !== 'cover_the_options')
  const [result, setResult] = useState<AttemptResult | null>(lockedResult)
  const [grade, setGrade] = useState<FlashcardGrade | undefined>()
  const [secondsLeft, setSecondsLeft] = useState(rapidFireSeconds)
  const [timedOut, setTimedOut] = useState(false)
  const [startedAt] = useState(() => Date.now())
  const [mistakeTags, setMistakeTags] = useState<string[]>([])
  const [mistakeNote, setMistakeNote] = useState('')
  const [flagged, setFlagged] = useState(false)
  const [answerChanges, setAnswerChanges] = useState(0)
  const [advanced, setAdvanced] = useState(false)

  useEffect(() => {
    setSelectedId(lockedSelectedId ?? initialSelectedId)
    setRevealed(Boolean(lockedResult))
    setCoverOpen(format !== 'cover_the_options')
    setResult(lockedResult)
    setGrade(undefined)
    setSecondsLeft(rapidFireSeconds)
    setTimedOut(false)
    setMistakeTags([])
    setMistakeNote('')
    setFlagged(false)
    setAnswerChanges(0)
    setAdvanced(false)
    // Only reset when the question (or lock state) changes — not on every draft keystroke.
  }, [question.id, format, rapidFireSeconds, lockedResult, lockedSelectedId]) // eslint-disable-line react-hooks/exhaustive-deps

  useEffect(() => {
    if (format !== 'rapid_fire' || revealed || lockedResult) return
    if (secondsLeft <= 0) {
      setTimedOut(true)
      setRevealed(true)
      setResult('skipped')
      return
    }
    const t = window.setTimeout(() => setSecondsLeft((s) => s - 1), 1000)
    return () => window.clearTimeout(t)
  }, [format, revealed, secondsLeft, lockedResult])

  function selectOption(optionId: string) {
    if (revealed || lockedResult) return
    if (selectedId && selectedId !== optionId) {
      setAnswerChanges((n) => n + 1)
    }
    setSelectedId(optionId)
    onDraftSelect?.(optionId)
  }

  function buildPayload(extra: Partial<QuizAnswerPayload> = {}): QuizAnswerPayload {
    return {
      selectedOptionId: selectedId,
      grade,
      timedOut,
      coverRevealed: coverOpen,
      mistakeTags: mistakeTags.length > 0 ? mistakeTags : undefined,
      mistakeNote: mistakeNote || null,
      answerChanges,
      flagged,
      ...extra,
    }
  }

  const flagToggle = (
    <button
      type="button"
      className={
        flagged
          ? 'inline-flex items-center gap-1 text-incorrect'
          : 'inline-flex items-center gap-1 text-muted hover:text-incorrect'
      }
      aria-pressed={flagged}
      onClick={() => setFlagged((v) => !v)}
    >
      <span aria-hidden>⚑</span>
      {flagged ? 'Flagged' : 'Flag for Review'}
    </button>
  )

  function onSubmitClick() {
    if (!selectedId || revealed || lockedResult) return
    const opt = question.question_options.find((o) => o.id === selectedId)
    const isCorrect = Boolean(opt?.is_correct)
    const nextResult: AttemptResult = isCorrect ? 'correct' : 'incorrect'
    setResult(nextResult)
    setRevealed(true)
    setMistakeTags([])
    setMistakeNote('')
  }

  function confirmAndAdvance() {
    if (!result || advanced || lockedResult) return
    setAdvanced(true)
    onSubmit({
      result,
      selectedOptionId: selectedId,
      payload: buildPayload(),
      timeSpentMs: Date.now() - startedAt,
      answerChanges,
    })
  }

  function onFlashGrade(g: FlashcardGrade) {
    const r = gradeToResult(g)
    setGrade(g)
    setResult(r)
    setRevealed(true)
    setMistakeTags([])
    setMistakeNote('')
  }

  const navRow = (
    <div className="flex flex-wrap items-center gap-2">
      <Button variant="secondary" disabled={!canGoBack} onClick={onBack}>
        Back
      </Button>
      <div className="ml-auto flex flex-wrap gap-2">
        {revealed && result && !lockedResult && !timedOut ? (
          <Button disabled={advanced} onClick={confirmAndAdvance}>
            Next
          </Button>
        ) : null}
        {revealed && result && !lockedResult && timedOut && !selectedId ? (
          <Button
            disabled={advanced}
            onClick={() => {
              setAdvanced(true)
              onSubmit({
                result: 'skipped',
                selectedOptionId: null,
                payload: buildPayload({ timedOut: true }),
                timeSpentMs: Date.now() - startedAt,
                answerChanges,
              })
            }}
          >
            Next
          </Button>
        ) : null}
        {onFinish ? (
          <Button variant="secondary" disabled={finishDisabled} onClick={onFinish}>
            Finish
          </Button>
        ) : null}
      </div>
    </div>
  )

  const progressFooter = (
    <p className="text-center text-sm font-medium text-muted" aria-live="polite">
      {openProgress
        ? `${completedCount} Questions Completed`
        : `${Math.min(index + (revealed && !lockedResult ? 1 : 0), total)}/${total} Questions`}
    </p>
  )

  if (format === 'flashcard' || question.question_type === 'flashcard') {
    return (
      <div className="flex w-full flex-col gap-4">
        <div className="flex flex-wrap items-start justify-between gap-2">
          <p className="text-sm font-medium text-fg">This Question:</p>
          {topicName ? (
            <span className="rounded-md border-2 border-accent bg-accent px-2.5 py-1 text-xs font-semibold text-white">
              {topicName}
            </span>
          ) : null}
        </div>
        <FlashcardView question={question} disabled={revealed} onGrade={onFlashGrade} />
        {revealed && result ? (
          <div className="flex flex-wrap items-center gap-3 rounded-md border border-border bg-surface p-3 text-sm">
            <span className="font-medium text-muted">
              Self-grade: <span className="text-fg capitalize">{grade ?? '—'}</span>
            </span>
            {flagToggle}
          </div>
        ) : null}
        {navRow}
        {revealed && result && !lockedResult ? (
          <div className="flex justify-end">
            <Button
              disabled={advanced}
              onClick={() => {
                setAdvanced(true)
                onSubmit({
                  result,
                  selectedOptionId: null,
                  payload: {
                    ...buildPayload({ grade }),
                    mistakeTags: undefined,
                    mistakeNote: null,
                  },
                  timeSpentMs: Date.now() - startedAt,
                  answerChanges,
                })
              }}
            >
              Next
            </Button>
          </div>
        ) : null}
        {progressFooter}
      </div>
    )
  }

  return (
    <div className="flex w-full flex-col gap-4">
      <div className="flex flex-wrap items-start justify-between gap-2">
        <div>
          <p className="text-sm font-medium text-fg">This Question:</p>
          {format === 'rapid_fire' && !revealed ? (
            <p
              className={
                secondsLeft <= 5
                  ? 'text-sm font-semibold text-incorrect'
                  : 'text-sm font-medium text-muted'
              }
            >
              {secondsLeft}s
            </p>
          ) : null}
        </div>
        {topicName ? (
          <span className="rounded-md border-2 border-accent bg-accent px-2.5 py-1 text-xs font-semibold text-white">
            {topicName}
          </span>
        ) : null}
      </div>

      <StemWithGlossary text={question.stem} terms={glossaryTerms} />

      {question.is_uk_practice ? (
        <p className="text-xs font-medium text-accent">UK practice item</p>
      ) : null}

      {format === 'cover_the_options' && !coverOpen ? (
        <div className="rounded-md border border-dashed border-border bg-surface p-6 text-center">
          <p className="mb-3 text-sm text-muted">
            Cover the options — decide your answer from the stem alone, then reveal.
          </p>
          <Button onClick={() => setCoverOpen(true)}>Reveal options</Button>
        </div>
      ) : (
        <SbaOptions
          options={question.question_options}
          selectedId={selectedId}
          revealed={revealed}
          disabled={revealed || Boolean(lockedResult)}
          onSelect={selectOption}
        />
      )}

      {!revealed && !lockedResult ? (
        <div className="flex flex-wrap items-center gap-2">
          <Button variant="secondary" disabled={!canGoBack} onClick={onBack}>
            Back
          </Button>
          <div className="ml-auto flex flex-wrap gap-2">
            <Button disabled={!selectedId} onClick={onSubmitClick}>
              Submit
            </Button>
            {onFinish ? (
              <Button variant="secondary" disabled={finishDisabled} onClick={onFinish}>
                Finish
              </Button>
            ) : null}
          </div>
        </div>
      ) : (
        <>
          {result ? (
            <FeedbackPanel
              question={question}
              result={result}
              format={format}
              timedOut={timedOut}
              timeSpentMs={Date.now() - startedAt}
              coverRevealed={coverOpen}
              isUkPractice={question.is_uk_practice}
              stemWordCount={countWords(question.stem)}
              onTagsChange={(tags, note) => {
                setMistakeTags(tags)
                setMistakeNote(note)
              }}
            />
          ) : null}
          {result && !lockedResult ? (
            <div className="flex flex-wrap items-center gap-3 text-sm">{flagToggle}</div>
          ) : null}
          {navRow}
        </>
      )}

      {progressFooter}
    </div>
  )
}

/** @deprecated kept for any external ProgressHeader imports */
export function ProgressHeader({
  index,
  total,
  children,
}: {
  index: number
  total: number
  children?: ReactNode
}) {
  return (
    <div className="flex items-center justify-between gap-2 text-sm text-muted">
      <span>
        Question {index + 1} of {total}
      </span>
      {children}
    </div>
  )
}

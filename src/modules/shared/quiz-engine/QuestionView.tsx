import { useEffect, useState, type ReactNode } from 'react'
import { Button } from '@/components/ui/Button'
import { countWords } from '@/features/glossary/glossaryApi'
import { ReadingTip } from '@/features/glossary/ReadingTip'
import { StemWithGlossary } from '@/features/glossary/StemWithGlossary'
import { suggestMistakeTags } from '@/features/mistakes/tags'
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
}

type Props = {
  question: QuestionWithOptions
  format: PresentationFormat
  rapidFireSeconds?: number
  index: number
  total: number
  glossaryTerms?: GlossaryTerm[]
  readingSpeedWpm?: number | null
  showReadingTip?: boolean
  onSubmit: (args: SubmitArgs) => void
}

export function QuestionView({
  question,
  format,
  rapidFireSeconds = 15,
  index,
  total,
  glossaryTerms = [],
  readingSpeedWpm,
  showReadingTip = true,
  onSubmit,
}: Props) {
  const [selectedId, setSelectedId] = useState<string | null>(null)
  const [revealed, setRevealed] = useState(false)
  const [coverOpen, setCoverOpen] = useState(format !== 'cover_the_options')
  const [result, setResult] = useState<AttemptResult | null>(null)
  const [grade, setGrade] = useState<FlashcardGrade | undefined>()
  const [secondsLeft, setSecondsLeft] = useState(rapidFireSeconds)
  const [timedOut, setTimedOut] = useState(false)
  const [startedAt] = useState(() => Date.now())
  const [mistakeTags, setMistakeTags] = useState<string[]>([])
  const [mistakeNote, setMistakeNote] = useState('')

  useEffect(() => {
    setSelectedId(null)
    setRevealed(false)
    setCoverOpen(format !== 'cover_the_options')
    setResult(null)
    setGrade(undefined)
    setSecondsLeft(rapidFireSeconds)
    setTimedOut(false)
    setMistakeTags([])
    setMistakeNote('')
  }, [question.id, format, rapidFireSeconds])

  useEffect(() => {
    if (format !== 'rapid_fire' || revealed) return
    if (secondsLeft <= 0) {
      setTimedOut(true)
      setRevealed(true)
      setResult('skipped')
      return
    }
    const t = window.setTimeout(() => setSecondsLeft((s) => s - 1), 1000)
    return () => window.clearTimeout(t)
  }, [format, revealed, secondsLeft])

  function seedSuggestions(nextResult: AttemptResult, nextGrade?: FlashcardGrade, nextTimedOut = false) {
    const suggestions = suggestMistakeTags({
      result: nextResult,
      format,
      timedOut: nextTimedOut,
      timeSpentMs: Date.now() - startedAt,
      grade: nextGrade,
      coverRevealed: coverOpen,
      isUkPractice: question.is_uk_practice,
      stemWordCount: countWords(question.stem),
    })
    setMistakeTags(suggestions)
  }

  function checkAnswer(optionId: string) {
    const opt = question.question_options.find((o) => o.id === optionId)
    const isCorrect = Boolean(opt?.is_correct)
    const nextResult: AttemptResult = isCorrect ? 'correct' : 'incorrect'
    setSelectedId(optionId)
    setResult(nextResult)
    setRevealed(true)
    if (!isCorrect) seedSuggestions(nextResult)
    else {
      setMistakeTags([])
      setMistakeNote('')
    }
  }

  function buildPayload(extra: Partial<QuizAnswerPayload> = {}): QuizAnswerPayload {
    return {
      selectedOptionId: selectedId,
      grade,
      timedOut,
      coverRevealed: coverOpen,
      mistakeTags: mistakeTags.length > 0 ? mistakeTags : undefined,
      mistakeNote: mistakeNote || null,
      ...extra,
    }
  }

  function confirmAndAdvance() {
    if (!result) return
    onSubmit({
      result,
      selectedOptionId: selectedId,
      payload: buildPayload(),
      timeSpentMs: Date.now() - startedAt,
    })
  }

  function onFlashGrade(g: FlashcardGrade) {
    const r = gradeToResult(g)
    setGrade(g)
    setResult(r)
    setRevealed(true)
    if (r === 'incorrect' || r === 'partial') seedSuggestions(r, g)
    else {
      setMistakeTags([])
      setMistakeNote('')
    }
  }

  if (format === 'flashcard' || question.question_type === 'flashcard') {
    return (
      <div className="flex flex-col gap-4">
        <ProgressHeader index={index} total={total} />
        <FlashcardView question={question} disabled={revealed} onGrade={onFlashGrade} />
        {revealed && result ? (
          <>
            <FeedbackPanel
              question={question}
              result={result}
              grade={grade}
              format={format}
              timeSpentMs={Date.now() - startedAt}
              onTagsChange={(tags, note) => {
                setMistakeTags(tags)
                setMistakeNote(note)
              }}
            />
            <Button
              onClick={() =>
                onSubmit({
                  result,
                  selectedOptionId: null,
                  payload: buildPayload({ grade }),
                  timeSpentMs: Date.now() - startedAt,
                })
              }
            >
              Next
            </Button>
          </>
        ) : null}
      </div>
    )
  }

  return (
    <div className="flex flex-col gap-4">
      <ProgressHeader index={index} total={total}>
        {format === 'rapid_fire' && !revealed ? (
          <span
            className={
              secondsLeft <= 5
                ? 'text-sm font-semibold text-incorrect'
                : 'text-sm font-medium text-muted'
            }
          >
            {secondsLeft}s
          </span>
        ) : null}
      </ProgressHeader>

      {showReadingTip ? (
        <ReadingTip stem={question.stem} readingSpeedWpm={readingSpeedWpm} />
      ) : null}

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
          disabled={revealed}
          onSelect={checkAnswer}
        />
      )}

      {format === 'rapid_fire' && !revealed ? (
        <p className="text-xs text-muted">
          Rapid fire: pick quickly. If time runs out the item is marked skipped.
        </p>
      ) : null}

      {revealed && result ? (
        <>
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
          <div className="flex flex-wrap gap-2">
            {timedOut && !selectedId ? (
              <Button
                variant="secondary"
                onClick={() =>
                  onSubmit({
                    result: 'skipped',
                    selectedOptionId: null,
                    payload: buildPayload({ timedOut: true }),
                    timeSpentMs: Date.now() - startedAt,
                  })
                }
              >
                Continue
              </Button>
            ) : (
              <Button onClick={confirmAndAdvance}>Next</Button>
            )}
          </div>
        </>
      ) : null}
    </div>
  )
}

function ProgressHeader({
  index,
  total,
  children,
}: {
  index: number
  total: number
  children?: ReactNode
}) {
  const pct = total > 0 ? Math.round(((index + 1) / total) * 100) : 0
  return (
    <div className="flex flex-col gap-2">
      <div className="flex items-center justify-between gap-2 text-sm text-muted">
        <span>
          Question {index + 1} of {total}
        </span>
        {children}
      </div>
      <div className="h-1.5 overflow-hidden rounded-full bg-border" aria-hidden>
        <div className="h-full bg-accent transition-all" style={{ width: `${pct}%` }} />
      </div>
    </div>
  )
}

import { useMemo, useState } from 'react'
import { MistakeTagPicker } from '@/features/mistakes'
import { suggestMistakeTags, type MistakeTagCode } from '@/features/mistakes/tags'
import type { AttemptResult, PresentationFormat, QuestionWithOptions } from '@/types/database'
import type { FlashcardGrade } from '@/types/quiz'
import { cn } from '@/lib/cn'

type Props = {
  question: QuestionWithOptions
  result: AttemptResult
  grade?: FlashcardGrade
  format?: PresentationFormat
  timedOut?: boolean
  timeSpentMs?: number | null
  coverRevealed?: boolean
  isUkPractice?: boolean
  stemWordCount?: number
  /** Controlled selection for tutor Next flow. */
  onTagsChange?: (tags: string[], note: string) => void
  /** Post-hoc save (mock review / log). */
  attemptId?: string | null
  initialTags?: string[]
  initialNote?: string
  onSaveTags?: (tags: string[], note: string) => Promise<void> | void
}

export function FeedbackPanel({
  question,
  result,
  grade,
  format,
  timedOut,
  timeSpentMs,
  coverRevealed,
  isUkPractice,
  stemWordCount,
  onTagsChange,
  attemptId,
  initialTags,
  initialNote,
  onSaveTags,
}: Props) {
  const correct = question.question_options?.find((o) => o.is_correct)
  const isGood = result === 'correct'
  const showTags = result === 'incorrect' || result === 'partial'
  const suggested = useMemo(
    () =>
      suggestMistakeTags({
        result,
        format,
        timedOut,
        timeSpentMs,
        grade,
        coverRevealed,
        isUkPractice: isUkPractice ?? question.is_uk_practice,
        stemWordCount,
      }),
    [
      result,
      format,
      timedOut,
      timeSpentMs,
      grade,
      coverRevealed,
      isUkPractice,
      question.is_uk_practice,
      stemWordCount,
    ],
  )
  const [localTags, setLocalTags] = useState<string[]>(initialTags ?? [])
  const [localNote, setLocalNote] = useState(initialNote ?? '')
  const [showExplanation, setShowExplanation] = useState(false)

  const title =
    result === 'skipped'
      ? 'Skipped'
      : isGood
        ? 'Correct'
        : result === 'partial'
          ? 'Partial'
          : 'Incorrect'

  return (
    <div
      className={
        isGood
          ? 'rounded-md border border-correct/40 bg-correct/10 p-4'
          : result === 'skipped'
            ? 'rounded-md border border-border bg-surface p-4'
            : 'rounded-md border border-incorrect/40 bg-incorrect/10 p-4'
      }
      role="status"
    >
      <p className="mb-2 flex items-center gap-2 text-sm font-semibold">
        <span aria-hidden>{isGood ? '✓' : result === 'skipped' ? '→' : '✗'}</span>
        <span
          className={
            isGood ? 'text-correct' : result === 'skipped' ? 'text-muted' : 'text-incorrect'
          }
        >
          {title}
        </span>
        {grade ? <span className="font-normal text-muted">· self-grade: {grade}</span> : null}
      </p>
      {correct && question.question_type === 'sba' ? (
        <p className="mb-2 text-sm">
          <span className="font-medium">Best answer:</span> {correct.label}. {correct.body}
        </p>
      ) : null}
      {question.explanation ? (
        <div className="text-sm">
          <button
            type="button"
            className={cn(
              'rounded border border-dashed border-accent/50 px-2 py-1 text-left font-medium text-accent hover:bg-accent-subtle',
            )}
            aria-expanded={showExplanation}
            onClick={() => setShowExplanation((v) => !v)}
          >
            {showExplanation ? 'Hide Explanation' : 'Show Explanation'}
          </button>
          {showExplanation ? (
            <p className="mt-2 whitespace-pre-wrap text-muted">{question.explanation}</p>
          ) : null}
        </div>
      ) : (
        <p className="text-sm text-muted">No explanation stored for this item yet.</p>
      )}

      {showTags ? (
        <MistakeTagPicker
          suggested={suggested as MistakeTagCode[]}
          initialSelected={localTags}
          initialNote={localNote}
          onChange={(tags, note) => {
            setLocalTags(tags)
            setLocalNote(note)
            onTagsChange?.(tags, note)
          }}
          onSave={
            onSaveTags
              ? async (tags, note) => {
                  await onSaveTags(tags, note)
                }
              : undefined
          }
        />
      ) : null}
      {attemptId ? (
        <p className="mt-2 text-[11px] text-muted">Attempt id saved for timeline / log.</p>
      ) : null}
    </div>
  )
}

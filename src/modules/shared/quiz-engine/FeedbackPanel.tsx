import type { AttemptResult, QuestionWithOptions } from '@/types/database'
import type { FlashcardGrade } from '@/types/quiz'

type Props = {
  question: QuestionWithOptions
  result: AttemptResult
  grade?: FlashcardGrade
}

export function FeedbackPanel({ question, result, grade }: Props) {
  const correct = question.question_options?.find((o) => o.is_correct)
  const isGood = result === 'correct'
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
        <span className={isGood ? 'text-correct' : result === 'skipped' ? 'text-muted' : 'text-incorrect'}>
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
          <p className="mb-1 font-medium">Tutor explanation</p>
          <p className="whitespace-pre-wrap text-muted">{question.explanation}</p>
        </div>
      ) : (
        <p className="text-sm text-muted">No explanation stored for this item yet.</p>
      )}
    </div>
  )
}

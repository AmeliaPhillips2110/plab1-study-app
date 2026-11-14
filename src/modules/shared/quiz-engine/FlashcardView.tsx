import { useState } from 'react'
import { Button } from '@/components/ui/Button'
import type { QuestionWithOptions } from '@/types/database'
import type { FlashcardGrade } from '@/types/quiz'

type Props = {
  question: QuestionWithOptions
  disabled?: boolean
  onGrade: (grade: FlashcardGrade) => void
}

export function flashcardSides(question: QuestionWithOptions): { front: string; back: string } {
  const payload = question.payload ?? {}
  const front =
    typeof payload.front === 'string' && payload.front.trim()
      ? payload.front
      : question.stem
  const correct = question.question_options?.find((o) => o.is_correct)
  const backFromPayload =
    typeof payload.back === 'string' && payload.back.trim() ? payload.back : null
  const composed = [correct ? `${correct.label}. ${correct.body}` : null, question.explanation]
    .filter(Boolean)
    .join('\n\n')
  const back = backFromPayload ?? (composed || 'No answer text stored for this card.')
  return { front, back }
}

export function FlashcardView({ question, disabled, onGrade }: Props) {
  const [flipped, setFlipped] = useState(false)
  const { front, back } = flashcardSides(question)
  const isMissCard = question.payload?.miss_card === true

  return (
    <div className="flex flex-col gap-4">
      <button
        type="button"
        className="min-h-48 rounded-md border border-border bg-surface p-6 text-left transition hover:border-accent"
        onClick={() => setFlipped((v) => !v)}
        aria-label={flipped ? 'Show front of card' : 'Reveal back of card'}
      >
        <p className="mb-2 text-xs font-medium uppercase tracking-wide text-muted">
          {flipped ? 'Back' : 'Front'}
          {isMissCard ? ' · miss recall' : ''} · click to flip
        </p>
        <p className="whitespace-pre-wrap text-base">{flipped ? back : front}</p>
      </button>

      {flipped ? (
        <div className="flex flex-wrap gap-2" role="group" aria-label="Self grade">
          <Button disabled={disabled} variant="danger" onClick={() => onGrade('again')}>
            Again
          </Button>
          <Button disabled={disabled} variant="secondary" onClick={() => onGrade('hard')}>
            Hard
          </Button>
          <Button disabled={disabled} variant="secondary" onClick={() => onGrade('good')}>
            Good
          </Button>
          <Button disabled={disabled} onClick={() => onGrade('easy')}>
            Easy
          </Button>
        </div>
      ) : (
        <Button variant="secondary" onClick={() => setFlipped(true)}>
          Reveal answer
        </Button>
      )}
    </div>
  )
}

import { Button } from '@/components/ui/Button'
import { cn } from '@/lib/cn'
import { SKIPPED_YELLOW } from '@/types/quiz'

type Props = {
  total: number
  currentIndex: number
  answers: Record<string, string>
  flagged: Set<string>
  questionIds: string[]
  /** Opened but unanswered — shown yellow (skipped state). */
  openedIds?: Set<string>
  onJump: (index: number) => void
  onBack?: () => void
  onNext?: () => void
  canGoBack?: boolean
  canGoNext?: boolean
}

export function QuestionNavigator({
  total,
  currentIndex,
  answers,
  flagged,
  questionIds,
  openedIds,
  onJump,
  onBack,
  onNext,
  canGoBack = false,
  canGoNext = false,
}: Props) {
  return (
    <aside className="w-full rounded-md border border-border bg-surface p-3 lg:w-56 xl:w-64">
      <div className="mb-3 flex flex-wrap gap-2">
        <Button
          type="button"
          variant="secondary"
          className="flex-1"
          disabled={!canGoBack}
          onClick={onBack}
        >
          Back
        </Button>
        <Button
          type="button"
          variant="secondary"
          className="flex-1"
          disabled={!canGoNext}
          onClick={onNext}
        >
          Next
        </Button>
      </div>
      <p className="mb-2 text-xs font-medium uppercase tracking-wide text-muted">
        Question {currentIndex + 1} of {total}
      </p>
      <div className="grid max-h-[min(60vh,28rem)] grid-cols-5 gap-1 overflow-y-auto sm:grid-cols-6 lg:grid-cols-4 xl:grid-cols-5">
        {Array.from({ length: total }, (_, i) => {
          const qid = questionIds[i]
          const answered = Boolean(qid && answers[qid])
          const openedUnanswered = Boolean(qid && !answered && openedIds?.has(qid))
          const isFlagged = Boolean(qid && flagged.has(qid))
          const current = i === currentIndex
          return (
            <button
              key={i}
              type="button"
              onClick={() => onJump(i)}
              aria-label={`Question ${i + 1}${answered ? ', answered' : openedUnanswered ? ', skipped' : ', new'}${isFlagged ? ', flagged' : ''}`}
              aria-current={current ? 'true' : undefined}
              className={cn(
                'relative h-8 rounded text-xs font-medium transition',
                current && 'ring-2 ring-accent',
                isFlagged
                  ? 'bg-incorrect text-white'
                  : answered
                    ? 'bg-accent text-white'
                    : openedUnanswered
                      ? 'text-fg'
                      : 'bg-bg text-muted hover:text-fg',
              )}
              style={
                !isFlagged && !answered && openedUnanswered
                  ? { backgroundColor: SKIPPED_YELLOW }
                  : undefined
              }
            >
              {isFlagged ? (
                <span className="absolute left-0.5 top-0 text-[10px] leading-none text-white">
                  ⚑
                </span>
              ) : null}
              {i + 1}
            </button>
          )
        })}
      </div>
      <ul className="mt-2 flex flex-col gap-1.5 text-xs text-muted">
        <li>
          <span className="mr-1 inline-block h-2 w-2 rounded-sm bg-accent" /> Answered
        </li>
        <li>
          <span
            className="mr-1 inline-block h-2 w-2 rounded-sm"
            style={{ backgroundColor: SKIPPED_YELLOW }}
          />{' '}
          Skipped
        </li>
        <li>
          <span className="mr-1 inline-block text-incorrect">⚑</span> Flagged
        </li>
        <li>
          <span className="mr-1 inline-block h-2 w-2 rounded-sm bg-bg ring-1 ring-border" /> New
        </li>
      </ul>
    </aside>
  )
}

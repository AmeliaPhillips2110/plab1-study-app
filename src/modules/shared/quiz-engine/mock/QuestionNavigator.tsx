import { cn } from '@/lib/cn'

type Props = {
  total: number
  currentIndex: number
  answers: Record<string, string>
  flagged: Set<string>
  questionIds: string[]
  onJump: (index: number) => void
}

export function QuestionNavigator({
  total,
  currentIndex,
  answers,
  flagged,
  questionIds,
  onJump,
}: Props) {
  return (
    <div className="rounded-md border border-border bg-surface p-3">
      <p className="mb-2 text-xs font-medium uppercase tracking-wide text-muted">Navigator</p>
      <div className="grid max-h-64 grid-cols-8 gap-1 overflow-y-auto sm:grid-cols-10">
        {Array.from({ length: total }, (_, i) => {
          const qid = questionIds[i]
          const answered = Boolean(qid && answers[qid])
          const isFlagged = Boolean(qid && flagged.has(qid))
          const current = i === currentIndex
          return (
            <button
              key={i}
              type="button"
              onClick={() => onJump(i)}
              aria-label={`Question ${i + 1}${answered ? ', answered' : ''}${isFlagged ? ', flagged' : ''}`}
              aria-current={current ? 'true' : undefined}
              className={cn(
                'relative h-8 rounded text-xs font-medium transition',
                current && 'ring-2 ring-accent',
                answered ? 'bg-accent text-white' : 'bg-bg text-muted hover:text-fg',
                isFlagged && !answered && 'bg-accent-subtle text-fg',
              )}
            >
              {i + 1}
              {isFlagged ? (
                <span className="absolute right-0.5 top-0.5 h-1.5 w-1.5 rounded-full bg-incorrect" />
              ) : null}
            </button>
          )
        })}
      </div>
      <ul className="mt-2 flex flex-wrap gap-3 text-xs text-muted">
        <li>
          <span className="mr-1 inline-block h-2 w-2 rounded-sm bg-accent" /> Answered
        </li>
        <li>
          <span className="mr-1 inline-block h-2 w-2 rounded-sm bg-accent-subtle" /> Flagged
        </li>
        <li>
          <span className="mr-1 inline-block h-2 w-2 rounded-sm bg-bg ring-1 ring-border" /> Unseen
        </li>
      </ul>
    </div>
  )
}

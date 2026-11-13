import { cn } from '@/lib/cn'
import type { QuestionOption } from '@/types/database'

type Props = {
  options: QuestionOption[]
  selectedId: string | null
  revealed: boolean
  disabled?: boolean
  onSelect: (optionId: string) => void
}

export function SbaOptions({ options, selectedId, revealed, disabled, onSelect }: Props) {
  return (
    <ul className="flex flex-col gap-2" role="listbox" aria-label="Answer options">
      {options.map((opt) => {
        const selected = selectedId === opt.id
        const showCorrect = revealed && opt.is_correct
        const showWrong = revealed && selected && !opt.is_correct
        return (
          <li key={opt.id}>
            <button
              type="button"
              role="option"
              aria-selected={selected}
              disabled={disabled || revealed}
              onClick={() => onSelect(opt.id)}
              className={cn(
                'flex w-full items-start gap-3 rounded-md border px-3 py-3 text-left text-sm transition',
                'border-border bg-surface hover:border-accent disabled:cursor-default',
                selected && !revealed && 'border-grey-300 bg-grey-100 text-fg',
                showCorrect && 'border-correct bg-correct/10',
                showWrong && 'border-incorrect bg-incorrect/10',
              )}
            >
              <span className="mt-0.5 inline-flex h-6 w-6 shrink-0 items-center justify-center rounded border border-border text-xs font-semibold">
                {opt.label}
              </span>
              <span className="flex-1">{opt.body}</span>
              {showCorrect ? (
                <span className="shrink-0 text-xs font-medium text-correct" aria-label="Correct">
                  ✓ Correct
                </span>
              ) : null}
              {showWrong ? (
                <span className="shrink-0 text-xs font-medium text-incorrect" aria-label="Incorrect">
                  ✗ Incorrect
                </span>
              ) : null}
            </button>
          </li>
        )
      })}
    </ul>
  )
}

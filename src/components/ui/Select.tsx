import type { SelectHTMLAttributes } from 'react'
import { cn } from '@/lib/cn'

type Props = SelectHTMLAttributes<HTMLSelectElement> & {
  label?: string
  options: Array<{ value: string; label: string }>
}

export function Select({ className, label, options, id, ...props }: Props) {
  const selectId = id || props.name
  return (
    <label className="flex w-full flex-col gap-1 text-sm">
      {label ? <span className="font-medium text-fg">{label}</span> : null}
      <select
        id={selectId}
        className={cn(
          'rounded-md border border-border bg-surface px-3 py-2 text-fg',
          className,
        )}
        {...props}
      >
        {options.map((opt) => (
          <option key={opt.value} value={opt.value}>
            {opt.label}
          </option>
        ))}
      </select>
    </label>
  )
}

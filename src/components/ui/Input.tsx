import type { InputHTMLAttributes } from 'react'
import { cn } from '@/lib/cn'

type Props = InputHTMLAttributes<HTMLInputElement> & {
  label?: string
  error?: string
}

export function Input({ className, label, error, id, ...props }: Props) {
  const inputId = id || props.name
  return (
    <label className="flex w-full flex-col gap-1 text-sm">
      {label ? <span className="font-medium text-fg">{label}</span> : null}
      <input
        id={inputId}
        className={cn(
          'rounded-md border border-border bg-surface px-3 py-2 text-fg placeholder:text-muted',
          error && 'border-incorrect',
          className,
        )}
        {...props}
      />
      {error ? <span className="text-xs text-incorrect">{error}</span> : null}
    </label>
  )
}

import { forwardRef, type InputHTMLAttributes } from 'react'
import { cn } from '@/lib/cn'

type Props = InputHTMLAttributes<HTMLInputElement> & {
  label?: string
  error?: string
}

export const Input = forwardRef<HTMLInputElement, Props>(function Input(
  { className, label, error, id, ...props },
  ref,
) {
  const inputId = id || props.name
  return (
    <label className="flex w-full flex-col gap-1 text-sm">
      {label ? <span className="font-medium text-fg">{label}</span> : null}
      <input
        ref={ref}
        id={inputId}
        className={cn(
          'rounded-md border border-border bg-surface px-3 py-2.5 text-base text-fg placeholder:text-muted sm:py-2 sm:text-sm',
          error && 'border-incorrect',
          className,
        )}
        {...props}
      />
      {error ? <span className="text-xs text-incorrect">{error}</span> : null}
    </label>
  )
})

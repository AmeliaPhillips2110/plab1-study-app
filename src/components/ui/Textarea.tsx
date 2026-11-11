import type { TextareaHTMLAttributes } from 'react'
import { cn } from '@/lib/cn'

type Props = TextareaHTMLAttributes<HTMLTextAreaElement> & {
  label?: string
}

export function Textarea({ className, label, id, ...props }: Props) {
  const areaId = id || props.name
  return (
    <label className="flex w-full flex-col gap-1 text-sm">
      {label ? <span className="font-medium text-fg">{label}</span> : null}
      <textarea
        id={areaId}
        className={cn(
          'min-h-24 rounded-md border border-border bg-surface px-3 py-2 text-fg placeholder:text-muted',
          className,
        )}
        {...props}
      />
    </label>
  )
}

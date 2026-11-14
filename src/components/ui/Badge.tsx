import type { ReactNode } from 'react'
import { cn } from '@/lib/cn'

type Props = {
  children: ReactNode
  tone?: 'neutral' | 'accent' | 'correct' | 'incorrect' | 'skipped'
  className?: string
}

export function Badge({ children, tone = 'neutral', className }: Props) {
  return (
    <span
      className={cn(
        'inline-flex items-center rounded px-2 py-0.5 text-xs font-medium',
        tone === 'neutral' && 'bg-accent-subtle text-fg',
        tone === 'accent' && 'bg-accent text-white',
        tone === 'correct' && 'bg-correct/15 text-correct',
        tone === 'incorrect' && 'bg-incorrect/15 text-incorrect',
        tone === 'skipped' && 'bg-[#eab308]/25 text-[#854d0e]',
        className,
      )}
    >
      {children}
    </span>
  )
}

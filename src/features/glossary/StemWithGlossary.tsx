import { useMemo, useState } from 'react'
import { findGlossaryMatches, type GlossaryMatch } from '@/features/glossary/glossaryApi'
import type { GlossaryTerm } from '@/types/database'
import { cn } from '@/lib/cn'

type Props = {
  text: string
  terms: GlossaryTerm[]
  className?: string
}

export function StemWithGlossary({ text, terms, className }: Props) {
  const matches = useMemo(() => findGlossaryMatches(text, terms), [text, terms])
  const [active, setActive] = useState<GlossaryMatch | null>(null)

  const parts = useMemo(() => {
    if (matches.length === 0) return [{ type: 'text' as const, value: text }]
    const out: Array<{ type: 'text' | 'term'; value: string; match?: GlossaryMatch }> = []
    let cursor = 0
    for (const m of matches) {
      if (m.start > cursor) out.push({ type: 'text', value: text.slice(cursor, m.start) })
      out.push({ type: 'term', value: m.matched, match: m })
      cursor = m.end
    }
    if (cursor < text.length) out.push({ type: 'text', value: text.slice(cursor) })
    return out
  }, [text, matches])

  return (
    <div className={cn('relative', className)}>
      <p className="whitespace-pre-wrap text-base font-normal leading-relaxed">
        {parts.map((part, i) =>
          part.type === 'text' ? (
            <span key={i}>{part.value}</span>
          ) : (
            <button
              key={i}
              type="button"
              className="rounded px-0.5 font-medium text-accent underline decoration-dotted underline-offset-2 hover:bg-accent-subtle"
              title={part.match!.term.definition}
              onMouseEnter={() => setActive(part.match!)}
              onMouseLeave={() => setActive(null)}
              onFocus={() => setActive(part.match!)}
              onBlur={() => setActive(null)}
              onClick={() => setActive((cur) => (cur === part.match ? null : part.match!))}
            >
              {part.value}
            </button>
          ),
        )}
      </p>
      {active ? (
        <div
          role="tooltip"
          className="mt-2 rounded-md border border-border bg-surface px-3 py-2 text-sm shadow-sm"
        >
          <p className="font-semibold text-fg">{active.term.term}</p>
          <p className="mt-1 text-muted">{active.term.definition}</p>
          {active.term.aliases?.length ? (
            <p className="mt-1 text-xs text-muted">Also: {active.term.aliases.join(', ')}</p>
          ) : null}
        </div>
      ) : matches.length > 0 ? (
        <p className="mt-1 text-xs text-muted">Tap or hover underlined terms for definitions.</p>
      ) : null}
    </div>
  )
}

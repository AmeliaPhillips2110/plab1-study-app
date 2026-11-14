import { useEffect, useId, useMemo, useRef, useState } from 'react'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { LAB_VALUE_SECTIONS } from '@/features/lab-values/labValuesData'

type Props = {
  open: boolean
  onClose: () => void
}

export function LabValuesModal({ open, onClose }: Props) {
  const titleId = useId()
  const searchRef = useRef<HTMLInputElement>(null)
  const [query, setQuery] = useState('')
  const wasOpen = useRef(false)

  // Reset search only when the dialog opens (not when onClose identity changes).
  useEffect(() => {
    if (open && !wasOpen.current) {
      setQuery('')
      const t = window.setTimeout(() => searchRef.current?.focus(), 0)
      wasOpen.current = true
      return () => window.clearTimeout(t)
    }
    if (!open) wasOpen.current = false
  }, [open])

  useEffect(() => {
    if (!open) return
    function onKey(e: KeyboardEvent) {
      if (e.key === 'Escape') onClose()
    }
    document.addEventListener('keydown', onKey)
    const prev = document.body.style.overflow
    document.body.style.overflow = 'hidden'
    return () => {
      document.removeEventListener('keydown', onKey)
      document.body.style.overflow = prev
    }
  }, [open, onClose])

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase()
    if (!q) return LAB_VALUE_SECTIONS
    return LAB_VALUE_SECTIONS.map((section) => ({
      ...section,
      rows: section.rows.filter((row) => {
        const hay = `${section.title} ${row.name} ${row.range} ${row.unit} ${row.note ?? ''}`.toLowerCase()
        return hay.includes(q)
      }),
    })).filter((section) => section.rows.length > 0)
  }, [query])

  if (!open) return null

  return (
    <div
      className="fixed inset-0 z-[80] flex items-end justify-center bg-black/45 p-3 sm:items-center"
      role="presentation"
      onMouseDown={(e) => {
        if (e.target === e.currentTarget) onClose()
      }}
    >
      <div
        role="dialog"
        aria-modal="true"
        aria-labelledby={titleId}
        className="flex max-h-[90vh] w-full max-w-2xl flex-col overflow-hidden rounded-md border border-border bg-surface shadow-lg"
      >
        <header className="flex items-start justify-between gap-3 border-b border-border px-4 py-3">
          <div>
            <h2 id={titleId} className="font-display text-lg font-semibold text-fg">
              Lab Values
            </h2>
            <p className="mt-0.5 text-xs text-muted">Adult reference ranges · searchable</p>
          </div>
          <Button type="button" variant="secondary" onClick={onClose} aria-label="Close lab values">
            Close
          </Button>
        </header>

        <div className="space-y-3 border-b border-border px-4 py-3">
          <Input
            ref={searchRef}
            label="Search"
            name="lab-search"
            type="search"
            placeholder="e.g. potassium, TSH, CRP…"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            autoComplete="off"
          />
        </div>

        <div className="flex-1 overflow-y-auto px-4 py-3">
          {filtered.length === 0 ? (
            <p className="text-sm text-muted">No lab values matched “{query.trim()}”.</p>
          ) : (
            <div className="flex flex-col gap-5">
              {filtered.map((section) => (
                <section key={section.id} aria-labelledby={`lab-sec-${section.id}`}>
                  <h3
                    id={`lab-sec-${section.id}`}
                    className="mb-2 font-display text-sm font-semibold uppercase tracking-wide text-accent"
                  >
                    {section.title}
                  </h3>
                  <ul className="divide-y divide-border rounded-md border border-border">
                    {section.rows.map((row) => (
                      <li
                        key={`${section.id}-${row.name}`}
                        className="grid grid-cols-[1fr_auto] gap-x-3 gap-y-0.5 px-3 py-2 text-sm sm:grid-cols-[minmax(0,1.4fr)_minmax(0,1fr)_auto]"
                      >
                        <span className="font-medium text-fg">
                          {row.name}
                          {row.note ? (
                            <span className="ml-1 text-xs font-normal text-muted">({row.note})</span>
                          ) : null}
                        </span>
                        <span className="tabular-nums text-fg sm:text-right">{row.range}</span>
                        <span className="col-span-2 text-xs text-muted sm:col-span-1 sm:text-right">
                          {row.unit || '—'}
                        </span>
                      </li>
                    ))}
                  </ul>
                </section>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}

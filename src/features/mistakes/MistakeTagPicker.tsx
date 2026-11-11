import { useEffect, useState } from 'react'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { MISTAKE_TAG_DEFS, type MistakeTagCode } from '@/features/mistakes/tags'
import { cn } from '@/lib/cn'

type Props = {
  suggested?: MistakeTagCode[]
  initialSelected?: string[]
  initialNote?: string
  disabled?: boolean
  onChange?: (tags: string[], note: string) => void
  /** When set, shows an explicit Save control for post-hoc review. */
  onSave?: (tags: string[], note: string) => Promise<void> | void
  compact?: boolean
}

export function MistakeTagPicker({
  suggested = [],
  initialSelected,
  initialNote = '',
  disabled,
  onChange,
  onSave,
  compact,
}: Props) {
  const [selected, setSelected] = useState<string[]>(() =>
    initialSelected && initialSelected.length > 0 ? initialSelected : suggested,
  )
  const [note, setNote] = useState(initialNote)
  const [busy, setBusy] = useState(false)
  const [savedMsg, setSavedMsg] = useState<string | null>(null)

  useEffect(() => {
    if (initialSelected) {
      setSelected(initialSelected)
    }
  }, [initialSelected?.join('|')]) // eslint-disable-line react-hooks/exhaustive-deps

  function emit(nextTags: string[], nextNote: string) {
    onChange?.(nextTags, nextNote)
  }

  function toggle(tag: string) {
    setSelected((prev) => {
      const next = prev.includes(tag) ? prev.filter((t) => t !== tag) : [...prev, tag]
      emit(next, note)
      return next
    })
    setSavedMsg(null)
  }

  async function handleSave() {
    if (!onSave) return
    setBusy(true)
    await onSave(selected, note)
    setBusy(false)
    setSavedMsg('Tags saved')
  }

  return (
    <div className={cn('flex flex-col gap-2', compact ? 'mt-2' : 'mt-3')}>
      <p className="text-sm font-medium">Why was this wrong?</p>
      <p className="text-xs text-muted">
        Pick one or more tags
        {suggested.length > 0 ? ' (soft highlight = auto-suggested)' : ''}.
      </p>
      <div className="flex flex-wrap gap-2">
        {MISTAKE_TAG_DEFS.map((def) => {
          const active = selected.includes(def.tag)
          const wasSuggested = suggested.includes(def.tag)
          return (
            <button
              key={def.tag}
              type="button"
              disabled={disabled}
              title={def.hint}
              onClick={() => toggle(def.tag)}
              className={cn(
                'rounded-md border px-2 py-1 text-xs font-medium transition',
                active
                  ? 'border-accent bg-accent text-white'
                  : wasSuggested
                    ? 'border-accent/50 bg-accent-subtle text-fg'
                    : 'border-border bg-surface text-muted hover:text-fg',
              )}
            >
              {def.label}
            </button>
          )
        })}
      </div>
      <Input
        label={compact ? undefined : 'Note (optional)'}
        name="mistake-note"
        placeholder="Short note…"
        value={note}
        disabled={disabled}
        onChange={(e) => {
          const v = e.target.value
          setNote(v)
          emit(selected, v)
          setSavedMsg(null)
        }}
      />
      {onSave ? (
        <div className="flex items-center gap-2">
          <Button
            type="button"
            variant="secondary"
            disabled={disabled || busy}
            onClick={() => void handleSave()}
          >
            {busy ? 'Saving…' : 'Save tags'}
          </Button>
          {savedMsg ? <span className="text-xs text-correct">{savedMsg}</span> : null}
        </div>
      ) : null}
    </div>
  )
}

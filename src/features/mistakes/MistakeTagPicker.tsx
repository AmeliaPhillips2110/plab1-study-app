import { useEffect, useRef, useState } from 'react'
import { Input } from '@/components/ui/Input'
import { Select } from '@/components/ui/Select'
import { MISTAKE_TAG_DEFS, type MistakeTagCode } from '@/features/mistakes/tags'
import { cn } from '@/lib/cn'

type Props = {
  /** Optional hints only — never auto-selected into the dropdown. */
  suggested?: MistakeTagCode[]
  initialSelected?: string[]
  initialNote?: string
  disabled?: boolean
  onChange?: (tags: string[], note: string) => void
  /** When provided, tags + notes auto-save after the user changes them. */
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
    initialSelected && initialSelected.length > 0 ? initialSelected : [],
  )
  const [note, setNote] = useState(initialNote)
  const [savedMsg, setSavedMsg] = useState<string | null>(null)
  const saveTimer = useRef<number | null>(null)
  const onSaveRef = useRef(onSave)
  onSaveRef.current = onSave

  useEffect(() => {
    if (initialSelected) setSelected(initialSelected)
  }, [initialSelected?.join('|')]) // eslint-disable-line react-hooks/exhaustive-deps

  useEffect(() => {
    setNote(initialNote)
  }, [initialNote])

  useEffect(() => {
    return () => {
      if (saveTimer.current != null) window.clearTimeout(saveTimer.current)
    }
  }, [])

  const primary = selected[0] ?? ''

  function scheduleSave(nextTags: string[], nextNote: string) {
    if (!onSaveRef.current) return
    if (saveTimer.current != null) window.clearTimeout(saveTimer.current)
    saveTimer.current = window.setTimeout(() => {
      void (async () => {
        if (!onSaveRef.current || nextTags.length === 0) return
        await onSaveRef.current(nextTags, nextNote)
        setSavedMsg('Saved')
      })()
    }, 400)
  }

  function emit(nextTags: string[], nextNote: string) {
    onChange?.(nextTags, nextNote)
    scheduleSave(nextTags, nextNote)
    setSavedMsg(null)
  }

  function onSelectChange(value: string) {
    const next = value ? [value] : []
    setSelected(next)
    emit(next, note)
  }

  const options = [
    { value: '', label: 'Select mistake…' },
    ...MISTAKE_TAG_DEFS.map((d) => ({ value: d.tag, label: d.label })),
  ]

  const hint =
    suggested.length > 0
      ? suggested
          .map((t) => MISTAKE_TAG_DEFS.find((d) => d.tag === t)?.label ?? t)
          .join(', ')
      : null

  return (
    <div className={cn('flex flex-col gap-2', compact ? 'mt-2' : 'mt-3')}>
      <Select
        label="Mistake"
        name="mistake-tag"
        value={primary}
        disabled={disabled}
        options={options}
        onChange={(e) => onSelectChange(e.target.value)}
      />
      {hint && !primary ? (
        <p className="text-xs text-muted">Suggestions: {hint}</p>
      ) : null}
      {primary === 'other' || note ? (
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
          }}
        />
      ) : null}
      {savedMsg ? <span className="text-xs text-correct">{savedMsg}</span> : null}
    </div>
  )
}

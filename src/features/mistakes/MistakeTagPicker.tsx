import { useEffect, useState } from 'react'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { Select } from '@/components/ui/Select'
import { MISTAKE_TAG_DEFS, type MistakeTagCode } from '@/features/mistakes/tags'
import { cn } from '@/lib/cn'

type Props = {
  suggested?: MistakeTagCode[]
  initialSelected?: string[]
  initialNote?: string
  disabled?: boolean
  onChange?: (tags: string[], note: string) => void
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
    initialSelected && initialSelected.length > 0 ? initialSelected : suggested.slice(0, 1),
  )
  const [note, setNote] = useState(initialNote)
  const [busy, setBusy] = useState(false)
  const [savedMsg, setSavedMsg] = useState<string | null>(null)

  useEffect(() => {
    if (initialSelected) setSelected(initialSelected)
  }, [initialSelected?.join('|')]) // eslint-disable-line react-hooks/exhaustive-deps

  const primary = selected[0] ?? ''

  function emit(nextTags: string[], nextNote: string) {
    onChange?.(nextTags, nextNote)
  }

  function onSelectChange(value: string) {
    const next = value ? [value] : []
    setSelected(next)
    emit(next, note)
    setSavedMsg(null)
  }

  async function handleSave() {
    if (!onSave) return
    setBusy(true)
    await onSave(selected, note)
    setBusy(false)
    setSavedMsg('Tags saved')
  }

  const options = [
    { value: '', label: 'Select mistake…' },
    ...MISTAKE_TAG_DEFS.map((d) => ({ value: d.tag, label: d.label })),
  ]

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
            setSavedMsg(null)
          }}
        />
      ) : null}
      {onSave ? (
        <div className="flex items-center gap-2">
          <Button
            type="button"
            variant="secondary"
            disabled={disabled || busy || !primary}
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

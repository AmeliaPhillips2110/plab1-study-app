import { useEffect, useState, type FormEvent } from 'react'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { supabase } from '@/lib/supabase'
import { useAuth } from '@/hooks/useAuth'
import type { ExamSettings } from '@/types/database'

type Props = {
  examId: string
  settings: ExamSettings | null
  onSaved: () => void
}

export function SettingsForm({ examId, settings, onSaved }: Props) {
  const { user } = useAuth()
  const [passMark, setPassMark] = useState('65')
  const [mockCount, setMockCount] = useState('180')
  const [mockMinutes, setMockMinutes] = useState('180')
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [ok, setOk] = useState<string | null>(null)

  useEffect(() => {
    setPassMark(String(settings?.pass_mark_percent ?? 65))
    setMockCount(String(settings?.default_mock_question_count ?? 180))
    setMockMinutes(String(settings?.default_mock_minutes ?? 180))
  }, [settings])

  async function onSubmit(e: FormEvent) {
    e.preventDefault()
    setError(null)
    setOk(null)
    const pass = Number(passMark)
    const count = Number(mockCount)
    const minutes = Number(mockMinutes)
    if (Number.isNaN(pass) || pass < 0 || pass > 100) {
      setError('Pass mark must be between 0 and 100.')
      return
    }
    setBusy(true)
    const { error: upsertError } = await supabase.from('exam_settings').upsert({
      exam_id: examId,
      pass_mark_percent: pass,
      default_mock_question_count: count,
      default_mock_minutes: minutes,
      updated_at: new Date().toISOString(),
      updated_by: user?.id ?? null,
    })
    setBusy(false)
    if (upsertError) {
      setError(upsertError.message)
      return
    }
    setOk('Settings saved.')
    onSaved()
  }

  return (
    <form onSubmit={onSubmit} className="flex max-w-md flex-col gap-4 rounded-md border border-border bg-surface p-4">
      <Input
        label="Pass mark (%)"
        name="passMark"
        type="number"
        min={0}
        max={100}
        step="0.01"
        required
        value={passMark}
        onChange={(e) => setPassMark(e.target.value)}
      />
      <Input
        label="Default mock question count"
        name="mockCount"
        type="number"
        min={1}
        required
        value={mockCount}
        onChange={(e) => setMockCount(e.target.value)}
      />
      <Input
        label="Default mock minutes"
        name="mockMinutes"
        type="number"
        min={1}
        required
        value={mockMinutes}
        onChange={(e) => setMockMinutes(e.target.value)}
      />
      {error ? <p className="text-sm text-incorrect">{error}</p> : null}
      {ok ? <p className="text-sm text-correct">{ok}</p> : null}
      <Button type="submit" disabled={busy}>
        {busy ? 'Saving…' : 'Save settings'}
      </Button>
    </form>
  )
}

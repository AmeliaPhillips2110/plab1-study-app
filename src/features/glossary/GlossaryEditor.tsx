import { useCallback, useEffect, useState, type FormEvent } from 'react'
import {
  deleteGlossaryTerm,
  fetchAllGlossaryTermsAdmin,
  upsertGlossaryTerm,
} from '@/features/glossary/glossaryApi'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { Textarea } from '@/components/ui/Textarea'
import type { GlossaryTerm } from '@/types/database'

type Props = {
  examId: string
}

const empty = {
  term: '',
  definition: '',
  aliases: '',
  is_active: true,
}

export function GlossaryEditor({ examId }: Props) {
  const [terms, setTerms] = useState<GlossaryTerm[]>([])
  const [form, setForm] = useState(empty)
  const [editingId, setEditingId] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  const reload = useCallback(async () => {
    const { terms: rows, error: err } = await fetchAllGlossaryTermsAdmin(examId)
    if (err) setError(err)
    else setTerms(rows)
  }, [examId])

  useEffect(() => {
    void reload()
  }, [reload])

  async function onSubmit(e: FormEvent) {
    e.preventDefault()
    setBusy(true)
    setError(null)
    const aliases = form.aliases
      .split(',')
      .map((a) => a.trim())
      .filter(Boolean)
    const { error: err } = await upsertGlossaryTerm({
      id: editingId ?? undefined,
      exam_id: examId,
      term: form.term.trim(),
      definition: form.definition.trim(),
      aliases,
      is_active: form.is_active,
    } as Partial<GlossaryTerm> & Pick<GlossaryTerm, 'exam_id' | 'term' | 'definition'>)
    setBusy(false)
    if (err) {
      setError(err)
      return
    }
    setForm(empty)
    setEditingId(null)
    await reload()
  }

  function startEdit(t: GlossaryTerm) {
    setEditingId(t.id)
    setForm({
      term: t.term,
      definition: t.definition,
      aliases: (t.aliases ?? []).join(', '),
      is_active: t.is_active,
    })
  }

  async function onDelete(id: string) {
    if (!confirm('Delete this glossary term?')) return
    setBusy(true)
    const { error: err } = await deleteGlossaryTerm(id)
    setBusy(false)
    if (err) setError(err)
    else await reload()
  }

  return (
    <div className="space-y-6">
      <form onSubmit={onSubmit} className="space-y-3 rounded-lg border border-border bg-surface p-4">
        <h2 className="font-display text-lg font-semibold">
          {editingId ? 'Edit term' : 'Add glossary term'}
        </h2>
        {error ? <p className="text-sm text-incorrect">{error}</p> : null}
        <Input
          label="Term"
          name="g-term"
          value={form.term}
          onChange={(e) => setForm((f) => ({ ...f, term: e.target.value }))}
          required
        />
        <Textarea
          label="Definition"
          name="g-def"
          value={form.definition}
          onChange={(e) => setForm((f) => ({ ...f, definition: e.target.value }))}
          required
          rows={3}
        />
        <Input
          label="Aliases (comma-separated)"
          name="g-aliases"
          value={form.aliases}
          onChange={(e) => setForm((f) => ({ ...f, aliases: e.target.value }))}
          placeholder="e.g. NICE, NICE guideline"
        />
        <label className="flex items-center gap-2 text-sm">
          <input
            type="checkbox"
            checked={form.is_active}
            onChange={(e) => setForm((f) => ({ ...f, is_active: e.target.checked }))}
          />
          Active (shown in stems)
        </label>
        <div className="flex gap-2">
          <Button type="submit" disabled={busy}>
            {editingId ? 'Save' : 'Add'}
          </Button>
          {editingId ? (
            <Button
              type="button"
              variant="ghost"
              onClick={() => {
                setEditingId(null)
                setForm(empty)
              }}
            >
              Cancel
            </Button>
          ) : null}
        </div>
      </form>

      <ul className="divide-y divide-border rounded-lg border border-border bg-surface">
        {terms.length === 0 ? (
          <li className="px-4 py-6 text-sm text-muted">No glossary terms yet.</li>
        ) : (
          terms.map((t) => (
            <li
              key={t.id}
              className="flex flex-col gap-2 px-4 py-3 sm:flex-row sm:items-start sm:justify-between"
            >
              <div>
                <p className="font-medium">
                  {t.term}{' '}
                  {!t.is_active ? (
                    <span className="text-xs font-normal text-muted">(inactive)</span>
                  ) : null}
                </p>
                <p className="text-sm text-muted">{t.definition}</p>
                {t.aliases?.length ? (
                  <p className="mt-1 text-xs text-muted">Aliases: {t.aliases.join(', ')}</p>
                ) : null}
              </div>
              <div className="flex shrink-0 gap-2">
                <Button type="button" variant="ghost" onClick={() => startEdit(t)}>
                  Edit
                </Button>
                <Button type="button" variant="ghost" onClick={() => void onDelete(t.id)}>
                  Delete
                </Button>
              </div>
            </li>
          ))
        )}
      </ul>
    </div>
  )
}

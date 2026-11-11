import { useEffect, useMemo, useState, type FormEvent } from 'react'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { Select } from '@/components/ui/Select'
import { Textarea } from '@/components/ui/Textarea'
import { Badge } from '@/components/ui/Badge'
import { supabase } from '@/lib/supabase'
import { useAuth } from '@/hooks/useAuth'
import type { QuestionOption, QuestionWithOptions, Topic } from '@/types/database'

const LABELS = ['A', 'B', 'C', 'D', 'E'] as const

type OptionDraft = {
  label: string
  body: string
  is_correct: boolean
  sort_order: number
}

type Props = {
  examId: string
  topics: Topic[]
  question: QuestionWithOptions | null
  onSaved: () => void
  onCancel: () => void
}

function emptyOptions(): OptionDraft[] {
  return LABELS.map((label, i) => ({
    label,
    body: '',
    is_correct: i === 0,
    sort_order: i,
  }))
}

export function QuestionEditor({ examId, topics, question, onSaved, onCancel }: Props) {
  const { user } = useAuth()
  const [stem, setStem] = useState('')
  const [explanation, setExplanation] = useState('')
  const [topicId, setTopicId] = useState('')
  const [difficulty, setDifficulty] = useState('3')
  const [isActive, setIsActive] = useState(true)
  const [isUkPractice, setIsUkPractice] = useState(false)
  const [options, setOptions] = useState<OptionDraft[]>(emptyOptions())
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [preview, setPreview] = useState(false)

  useEffect(() => {
    if (!question) {
      setStem('')
      setExplanation('')
      setTopicId(topics[0]?.id ?? '')
      setDifficulty('3')
      setIsActive(true)
      setIsUkPractice(false)
      setOptions(emptyOptions())
      return
    }
    setStem(question.stem)
    setExplanation(question.explanation ?? '')
    setTopicId(question.topic_id ?? '')
    setDifficulty(String(question.difficulty ?? 3))
    setIsActive(question.is_active)
    setIsUkPractice(question.is_uk_practice)
    const mapped = LABELS.map((label, i) => {
      const existing = question.question_options.find((o) => o.label === label)
      return {
        label,
        body: existing?.body ?? '',
        is_correct: existing?.is_correct ?? false,
        sort_order: existing?.sort_order ?? i,
      }
    })
    if (!mapped.some((o) => o.is_correct) && mapped[0]) mapped[0].is_correct = true
    setOptions(mapped)
  }, [question, topics])

  const topicOptions = useMemo(
    () => [
      { value: '', label: 'No topic' },
      ...topics.map((t) => ({ value: t.id, label: t.name })),
    ],
    [topics],
  )

  function updateOption(index: number, patch: Partial<OptionDraft>) {
    setOptions((prev) =>
      prev.map((opt, i) => {
        if (i !== index) {
          if (patch.is_correct) return { ...opt, is_correct: false }
          return opt
        }
        return { ...opt, ...patch }
      }),
    )
  }

  async function onSubmit(e: FormEvent) {
    e.preventDefault()
    setError(null)

    if (!stem.trim()) {
      setError('Stem is required.')
      return
    }
    if (options.some((o) => !o.body.trim())) {
      setError('All five options (A–E) need text.')
      return
    }
    if (!options.some((o) => o.is_correct)) {
      setError('Mark one option as correct.')
      return
    }

    setBusy(true)
    const now = new Date().toISOString()
    const payload = {
      exam_id: examId,
      topic_id: topicId || null,
      question_type: 'sba' as const,
      stem: stem.trim(),
      explanation: explanation.trim() || null,
      difficulty: Number(difficulty),
      is_active: isActive,
      is_uk_practice: isUkPractice,
      updated_by: user?.id ?? null,
      updated_at: now,
    }

    let questionId = question?.id

    if (questionId) {
      const { error: updErr } = await supabase.from('questions').update(payload).eq('id', questionId)
      if (updErr) {
        setError(updErr.message)
        setBusy(false)
        return
      }
      await supabase.from('question_options').delete().eq('question_id', questionId)
    } else {
      const { data, error: insErr } = await supabase
        .from('questions')
        .insert({ ...payload, created_by: user?.id ?? null })
        .select('id')
        .single()
      if (insErr || !data) {
        setError(insErr?.message ?? 'Failed to create question.')
        setBusy(false)
        return
      }
      questionId = (data as { id: string }).id
    }

    const optionRows = options.map((o) => ({
      question_id: questionId!,
      label: o.label,
      body: o.body.trim(),
      is_correct: o.is_correct,
      sort_order: o.sort_order,
    }))
    const { error: optErr } = await supabase.from('question_options').insert(optionRows)
    if (optErr) {
      setError(optErr.message)
      setBusy(false)
      return
    }

    setBusy(false)
    onSaved()
  }

  if (preview) {
    return (
      <div className="flex flex-col gap-4 rounded-md border border-border bg-surface p-4">
        <div className="flex items-center justify-between gap-2">
          <h2 className="text-lg font-semibold">Preview</h2>
          <Button variant="secondary" onClick={() => setPreview(false)}>
            Back to editor
          </Button>
        </div>
        <p className="whitespace-pre-wrap text-base">{stem || 'Empty stem'}</p>
        <ul className="flex flex-col gap-2">
          {options.map((o) => (
            <li
              key={o.label}
              className="rounded border border-border px-3 py-2 text-sm"
            >
              <span className="font-semibold">{o.label}.</span> {o.body || '—'}
              {o.is_correct ? (
                <Badge tone="correct">Correct</Badge>
              ) : null}
            </li>
          ))}
        </ul>
        {explanation ? (
          <div className="rounded border border-border bg-bg p-3 text-sm">
            <p className="mb-1 font-medium">Explanation</p>
            <p className="whitespace-pre-wrap text-muted">{explanation}</p>
          </div>
        ) : null}
      </div>
    )
  }

  return (
    <form onSubmit={onSubmit} className="flex flex-col gap-4 rounded-md border border-border bg-surface p-4">
      <div className="flex flex-wrap items-center justify-between gap-2">
        <h2 className="text-lg font-semibold">{question ? 'Edit question' : 'Add question'}</h2>
        <div className="flex gap-2">
          <Button type="button" variant="secondary" onClick={() => setPreview(true)}>
            Preview
          </Button>
          <Button type="button" variant="ghost" onClick={onCancel}>
            Cancel
          </Button>
        </div>
      </div>

      <Textarea label="Stem" name="stem" required value={stem} onChange={(e) => setStem(e.target.value)} />
      <Textarea
        label="Explanation"
        name="explanation"
        value={explanation}
        onChange={(e) => setExplanation(e.target.value)}
      />

      <div className="grid gap-3 sm:grid-cols-2">
        <Select
          label="Topic"
          name="topic"
          value={topicId}
          onChange={(e) => setTopicId(e.target.value)}
          options={topicOptions}
        />
        <Select
          label="Difficulty (1–5)"
          name="difficulty"
          value={difficulty}
          onChange={(e) => setDifficulty(e.target.value)}
          options={[1, 2, 3, 4, 5].map((n) => ({ value: String(n), label: String(n) }))}
        />
      </div>

      <div className="flex flex-wrap gap-4 text-sm">
        <label className="inline-flex items-center gap-2">
          <input type="checkbox" checked={isActive} onChange={(e) => setIsActive(e.target.checked)} />
          Active
        </label>
        <label className="inline-flex items-center gap-2">
          <input
            type="checkbox"
            checked={isUkPractice}
            onChange={(e) => setIsUkPractice(e.target.checked)}
          />
          UK practice
        </label>
      </div>

      <fieldset className="flex flex-col gap-3">
        <legend className="text-sm font-medium">Options (mark one correct)</legend>
        {options.map((opt, index) => (
          <div key={opt.label} className="flex flex-col gap-2 rounded border border-border p-3 sm:flex-row sm:items-start">
            <label className="mt-2 inline-flex items-center gap-2 text-sm font-semibold">
              <input
                type="radio"
                name="correct"
                checked={opt.is_correct}
                onChange={() => updateOption(index, { is_correct: true })}
              />
              {opt.label}
            </label>
            <Input
              className="flex-1"
              name={`option-${opt.label}`}
              value={opt.body}
              onChange={(e) => updateOption(index, { body: e.target.value })}
              required
              aria-label={`Option ${opt.label}`}
            />
          </div>
        ))}
      </fieldset>

      {error ? <p className="text-sm text-incorrect">{error}</p> : null}

      <div className="flex gap-2">
        <Button type="submit" disabled={busy}>
          {busy ? 'Saving…' : 'Save question'}
        </Button>
      </div>
    </form>
  )
}

export type { QuestionOption }

import { useCallback, useEffect, useState } from 'react'
import { Button } from '@/components/ui/Button'
import { Badge } from '@/components/ui/Badge'
import { QuestionEditor } from '@/modules/shared/admin/QuestionEditor'
import { supabase } from '@/lib/supabase'
import { formatDateTime } from '@/lib/dates'
import type { QuestionWithOptions, Topic } from '@/types/database'

type Props = {
  examId: string
  topics: Topic[]
}

export function QuestionList({ examId, topics }: Props) {
  const [items, setItems] = useState<QuestionWithOptions[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [editing, setEditing] = useState<QuestionWithOptions | null | 'new'>(null)

  const load = useCallback(async () => {
    setLoading(true)
    setError(null)
    const { data, error: qErr } = await supabase
      .from('questions')
      .select('*, question_options(*), topics(*)')
      .eq('exam_id', examId)
      .order('created_at', { ascending: false })

    if (qErr) {
      setError(qErr.message)
      setItems([])
    } else {
      setItems((data as unknown as QuestionWithOptions[]) ?? [])
    }
    setLoading(false)
  }, [examId])

  useEffect(() => {
    void load()
  }, [load])

  async function remove(id: string) {
    if (!window.confirm('Delete this question and its options?')) return
    const { error: delErr } = await supabase.from('questions').delete().eq('id', id)
    if (delErr) {
      setError(delErr.message)
      return
    }
    await load()
  }

  if (editing === 'new' || editing) {
    return (
      <QuestionEditor
        examId={examId}
        topics={topics}
        question={editing === 'new' ? null : editing}
        onCancel={() => setEditing(null)}
        onSaved={async () => {
          setEditing(null)
          await load()
        }}
      />
    )
  }

  return (
    <div className="flex flex-col gap-4">
      <div className="flex flex-wrap items-center justify-between gap-2">
        <p className="text-sm text-muted">{items.length} question{items.length === 1 ? '' : 's'}</p>
        <Button onClick={() => setEditing('new')}>Add question</Button>
      </div>

      {error ? <p className="text-sm text-incorrect">{error}</p> : null}
      {loading ? <p className="text-sm text-muted">Loading questions…</p> : null}

      {!loading && items.length === 0 ? (
        <p className="text-sm text-muted">
          No questions yet. Add one here, or in Supabase SQL paste{' '}
          <code className="text-fg">supabase/seed_example_pack.sql</code> (safe re-run for Q42–Q51). Fresh
          project: paste <code className="text-fg">APPLY_ALL.sql</code> once.
        </p>
      ) : null}

      <ul className="flex flex-col gap-2">
        {items.map((q) => {
          const topicName = q.topics?.name
          const correct = q.question_options?.find((o) => o.is_correct)
          return (
            <li
              key={q.id}
              className="flex flex-col gap-3 rounded-md border border-border bg-surface p-4 sm:flex-row sm:items-start sm:justify-between"
            >
              <div className="min-w-0 flex-1">
                <div className="mb-1 flex flex-wrap gap-2">
                  <Badge>{q.question_type.toUpperCase()}</Badge>
                  {q.is_active ? <Badge tone="correct">Active</Badge> : <Badge tone="incorrect">Inactive</Badge>}
                  {q.is_uk_practice ? <Badge tone="accent">UK practice</Badge> : null}
                  {topicName ? <Badge>{topicName}</Badge> : null}
                </div>
                <p className="line-clamp-3 text-sm">{q.stem}</p>
                <p className="mt-1 text-xs text-muted">
                  Correct: {correct ? `${correct.label}` : '—'} · Updated {formatDateTime(q.updated_at)}
                </p>
              </div>
              <div className="flex shrink-0 gap-2">
                <Button variant="secondary" onClick={() => setEditing(q)}>
                  Edit
                </Button>
                <Button variant="danger" onClick={() => void remove(q.id)}>
                  Delete
                </Button>
              </div>
            </li>
          )
        })}
      </ul>
    </div>
  )
}

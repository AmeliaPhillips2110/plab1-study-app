import { supabase } from '@/lib/supabase'
import type { MistakeTagCode } from '@/features/mistakes/tags'

export type MistakeTagRow = {
  id: string
  attempt_id: string
  tag: string
  note: string | null
  created_at: string
}

export async function saveMistakeTags(params: {
  attemptId: string
  tags: Array<{ tag: MistakeTagCode | string; note?: string | null; source?: 'manual' | 'auto' }>
}): Promise<{ error: string | null }> {
  if (params.tags.length === 0) return { error: null }

  // Replace existing tags for a clean re-tag from review UI.
  await supabase.from('mistake_tags').delete().eq('attempt_id', params.attemptId)

  const rows = params.tags.map((t) => ({
    attempt_id: params.attemptId,
    tag: t.tag,
    note: t.note
      ? t.note
      : t.source === 'auto'
        ? 'auto-suggested'
        : null,
  }))

  const { error } = await supabase.from('mistake_tags').insert(rows)
  return { error: error?.message ?? null }
}

export async function loadMistakeTagsForAttempts(
  attemptIds: string[],
): Promise<Record<string, MistakeTagRow[]>> {
  if (attemptIds.length === 0) return {}
  const { data, error } = await supabase
    .from('mistake_tags')
    .select('*')
    .in('attempt_id', attemptIds)
  if (error || !data) return {}
  const map: Record<string, MistakeTagRow[]> = {}
  for (const row of data as MistakeTagRow[]) {
    const list = map[row.attempt_id] ?? []
    list.push(row)
    map[row.attempt_id] = list
  }
  return map
}

export async function loadMistakeTagsForAttempt(attemptId: string): Promise<MistakeTagRow[]> {
  const map = await loadMistakeTagsForAttempts([attemptId])
  return map[attemptId] ?? []
}

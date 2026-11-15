import { supabase } from '@/lib/supabase'

/** Supabase/PostgREST defaults to max 1000 rows per request — page past that. */
export const SUPABASE_PAGE_SIZE = 1000

/**
 * Fetch all rows for a simple select builder, paging with `.range`.
 * `build` is called once per page with from/to inclusive indexes.
 */
export async function fetchAllPaged<T>(
  build: (from: number, to: number) => PromiseLike<{ data: T[] | null; error: { message: string } | null }>,
  pageSize = SUPABASE_PAGE_SIZE,
): Promise<{ rows: T[]; error: string | null }> {
  const rows: T[] = []
  let from = 0
  for (;;) {
    const to = from + pageSize - 1
    const { data, error } = await build(from, to)
    if (error) return { rows, error: error.message }
    const chunk = data ?? []
    rows.push(...chunk)
    if (chunk.length < pageSize) break
    from += pageSize
  }
  return { rows, error: null }
}

/** Active SBA id + topic_id for an exam (full bank, paged). */
export async function fetchActiveSbaTopicIds(
  examId: string,
): Promise<{ rows: Array<{ id: string; topic_id: string | null }>; error: string | null }> {
  return fetchAllPaged((from, to) =>
    supabase
      .from('questions')
      .select('id, topic_id')
      .eq('exam_id', examId)
      .eq('is_active', true)
      .eq('question_type', 'sba')
      .order('id', { ascending: true })
      .range(from, to),
  )
}

/** Counts active SBAs grouped by payload.source (exact, via full scan of sources). */
export async function countActiveSbaBySource(
  examId: string,
): Promise<{ total: number; bySource: Record<string, number>; error: string | null }> {
  const { rows, error } = await fetchAllPaged<{ payload: { source?: string } | null }>((from, to) =>
    supabase
      .from('questions')
      .select('payload')
      .eq('exam_id', examId)
      .eq('is_active', true)
      .eq('question_type', 'sba')
      .order('id', { ascending: true })
      .range(from, to),
  )
  if (error) return { total: 0, bySource: {}, error }
  const bySource: Record<string, number> = {}
  for (const row of rows) {
    const src = row.payload?.source?.trim() || '(none)'
    bySource[src] = (bySource[src] ?? 0) + 1
  }
  return { total: rows.length, bySource, error: null }
}

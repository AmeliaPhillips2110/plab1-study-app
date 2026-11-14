import { supabase } from '@/lib/supabase'
import { TOPIC_CATALOG, topicIdForSlug } from '@/features/question-import/topicAliases'
import type { ParsedQuestion } from '@/features/question-import/parseQuestionBankXlsx'
import type { Topic } from '@/types/database'

export type ImportItem = {
  id: string
  topic_id: string | null
  question_type: 'sba'
  stem: string
  explanation: string | null
  difficulty: null
  is_active: boolean
  is_uk_practice: boolean
  payload: Record<string, unknown>
  options: {
    id: string
    label: string
    body: string
    is_correct: boolean
    sort_order: number
  }[]
}

export type NewTopicSpec = {
  id: string
  slug: string
  name: string
  sort_order: number
}

export type ImportBatchResult = {
  inserted: number
  updated: number
  options: number
  topics_created: number
}

export type ImportProgress = {
  done: number
  total: number
  last?: ImportBatchResult
}

const BATCH_SIZE = 40

export function buildImportItems(
  questions: ParsedQuestion[],
  sourceTag: string,
  topicsBySlug: Map<string, Topic>,
): { items: ImportItem[]; missingSlugs: string[] } {
  const missing = new Set<string>()
  const items: ImportItem[] = questions.map((q) => {
    let topicId: string | null = null
    if (q.topicSlug) {
      const existing = topicsBySlug.get(q.topicSlug)
      if (existing) topicId = existing.id
      else missing.add(q.topicSlug)
    }

    const payload: Record<string, unknown> = { source: sourceTag }
    if (q.guidelinesText) payload.guidelines_text = q.guidelinesText
    if (q.imageUrl) payload.image_url = q.imageUrl

    return {
      id: q.id,
      topic_id: topicId,
      question_type: 'sba',
      stem: q.stem,
      explanation: q.explanation,
      difficulty: null,
      is_active: true,
      is_uk_practice: q.isUkPractice,
      payload,
      options: q.options,
    }
  })
  return { items, missingSlugs: [...missing] }
}

/** After creating missing topics (or leaving null), re-resolve topic_id from slug map. */
export function applyTopicIds(
  items: ImportItem[],
  questions: ParsedQuestion[],
  topicsBySlug: Map<string, Topic>,
): ImportItem[] {
  return items.map((item, i) => {
    const slug = questions[i]?.topicSlug
    if (!slug) return { ...item, topic_id: null }
    return { ...item, topic_id: topicsBySlug.get(slug)?.id ?? null }
  })
}

export function specsForMissingSlugs(slugs: string[]): NewTopicSpec[] {
  return slugs.map((slug, i) => {
    const catalog = TOPIC_CATALOG[slug]
    const id = topicIdForSlug(slug) ?? crypto.randomUUID()
    return {
      id,
      slug,
      name: catalog?.name ?? slug.replace(/-/g, ' ').replace(/\b\w/g, (c) => c.toUpperCase()),
      sort_order: 900 + i * 10,
    }
  })
}

export async function importQuestionBatches(params: {
  examId: string
  items: ImportItem[]
  newTopics?: NewTopicSpec[]
  onProgress?: (p: ImportProgress) => void
}): Promise<{ totals: ImportBatchResult; errors: string[] }> {
  const { examId, items, onProgress } = params
  const newTopics = params.newTopics ?? []
  const totals: ImportBatchResult = { inserted: 0, updated: 0, options: 0, topics_created: 0 }
  const errors: string[] = []

  // Create topics once up front
  if (newTopics.length > 0) {
    const { data, error } = await supabase.rpc('import_questions', {
      p_exam_id: examId,
      p_items: [],
      p_new_topics: newTopics,
    })
    if (error) {
      errors.push(error.message)
      return { totals, errors }
    }
    const row = data as ImportBatchResult
    totals.topics_created += row.topics_created ?? 0
  }

  const total = items.length
  for (let i = 0; i < items.length; i += BATCH_SIZE) {
    const batch = items.slice(i, i + BATCH_SIZE)
    const { data, error } = await supabase.rpc('import_questions', {
      p_exam_id: examId,
      p_items: batch,
      p_new_topics: [],
    })
    if (error) {
      errors.push(`Batch ${Math.floor(i / BATCH_SIZE) + 1}: ${error.message}`)
      onProgress?.({ done: Math.min(i + batch.length, total), total })
      break
    }
    const row = data as ImportBatchResult
    totals.inserted += row.inserted ?? 0
    totals.updated += row.updated ?? 0
    totals.options += row.options ?? 0
    onProgress?.({
      done: Math.min(i + batch.length, total),
      total,
      last: row,
    })
  }

  return { totals, errors }
}

import { collectGuidelineRefs } from '@/features/guidelines/guidelineRefs'
import { fetchQuestionIdsForTagSlugs, UK_PRACTICE_TAG } from '@/features/tags/tagsApi'
import { supabase } from '@/lib/supabase'
import type { QuestionWithOptions } from '@/types/database'

type HotspotRow = Pick<
  QuestionWithOptions,
  'id' | 'is_uk_practice' | 'explanation' | 'payload' | 'question_type' | 'is_active'
>

/** True when the item is UK-practice flagged, tagged, or carries NICE/BNF/guideline refs. */
export function questionIsGuidelineHotspot(
  question: HotspotRow,
  ukPracticeTaggedIds?: Set<string>,
): boolean {
  if (question.is_uk_practice) return true
  if (ukPracticeTaggedIds?.has(question.id)) return true

  const payload = (question.payload ?? {}) as Record<string, unknown>
  if (typeof payload.guidelines_text === 'string' && payload.guidelines_text.trim()) {
    return true
  }

  const refs = collectGuidelineRefs({
    explanation: question.explanation,
    payload: question.payload,
  })
  return refs.length > 0
}

export async function loadUkPracticeTaggedIds(
  examId: string,
): Promise<{ questionIds: Set<string>; error: string | null }> {
  return fetchQuestionIdsForTagSlugs(examId, [UK_PRACTICE_TAG])
}

/** Active SBA pool filtered to guideline / UK-practice hotspots. */
export async function fetchGuidelineHotspotQuestions(
  examId: string,
  limit = 10_000,
): Promise<{ questions: QuestionWithOptions[]; error: string | null }> {
  const tagged = await loadUkPracticeTaggedIds(examId)
  if (tagged.error) return { questions: [], error: tagged.error }

  const { data, error } = await supabase
    .from('questions')
    .select('*, question_options(*)')
    .eq('exam_id', examId)
    .eq('is_active', true)
    .eq('question_type', 'sba')
    .limit(Math.min(Math.max(limit, 1), 10_000))

  if (error) return { questions: [], error: error.message }

  const rows = ((data as unknown as QuestionWithOptions[] | null) ?? []).map((q) => ({
    ...q,
    question_options: [...(q.question_options ?? [])].sort((a, b) => a.sort_order - b.sort_order),
  }))

  const hotspots = rows.filter((q) => questionIsGuidelineHotspot(q, tagged.questionIds))
  return { questions: hotspots, error: null }
}

export async function countGuidelineHotspots(
  examId: string,
): Promise<{ count: number; error: string | null }> {
  const { questions, error } = await fetchGuidelineHotspotQuestions(examId, 10_000)
  if (error) return { count: 0, error }
  return { count: questions.length, error: null }
}

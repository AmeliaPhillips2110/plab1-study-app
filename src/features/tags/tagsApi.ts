import { supabase } from '@/lib/supabase'
import type { Tag } from '@/types/database'

export async function fetchTags(examId: string): Promise<{ tags: Tag[]; error: string | null }> {
  const { data, error } = await supabase
    .from('tags')
    .select('*')
    .eq('exam_id', examId)
    .order('label', { ascending: true })
  if (error) return { tags: [], error: error.message }
  return { tags: (data as Tag[] | null) ?? [], error: null }
}

export async function fetchQuestionIdsForTagSlugs(
  examId: string,
  slugs: string[],
): Promise<{ questionIds: Set<string>; error: string | null }> {
  if (slugs.length === 0) return { questionIds: new Set(), error: null }
  const { data: tags, error: tagErr } = await supabase
    .from('tags')
    .select('id, slug')
    .eq('exam_id', examId)
    .in('slug', slugs)
  if (tagErr) return { questionIds: new Set(), error: tagErr.message }
  const tagIds = ((tags as Array<{ id: string; slug: string }> | null) ?? []).map((t) => t.id)
  if (tagIds.length === 0) return { questionIds: new Set(), error: null }

  const { data: links, error: linkErr } = await supabase
    .from('question_tags')
    .select('question_id, tag_id')
    .in('tag_id', tagIds)
  if (linkErr) return { questionIds: new Set(), error: linkErr.message }
  return {
    questionIds: new Set(((links as Array<{ question_id: string }> | null) ?? []).map((l) => l.question_id)),
    error: null,
  }
}

export const UK_PRACTICE_TAG = 'uk-practice'
export const PATIENT_CENTRED_TAG = 'patient-centred'
export const LONG_STEM_MIN_WORDS = 80

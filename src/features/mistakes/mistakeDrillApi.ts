import { loadMistakeTagsForAttempts } from '@/features/mistakes/mistakeApi'
import {
  MISTAKE_TAG_DEFS,
  MISTAKE_TAG_LABELS,
  type MistakeTagCode,
} from '@/features/mistakes/tags'
import { supabase } from '@/lib/supabase'

export type MistakeTagDrillStat = {
  tag: string
  label: string
  /** Unique questions tagged this way on an incorrect/partial attempt. */
  questionCount: number
  questionIds: string[]
}

type AttemptMissRow = {
  id: string
  question_id: string
  result: string
  answered_at: string
}

/**
 * Unique SBA question IDs the user previously tagged with each mistake code
 * (incorrect / partial attempts only). Reuses attempt + mistake_tags data.
 */
export async function fetchMistakeTagDrillStats(params: {
  examId: string
  userId: string
}): Promise<{ stats: MistakeTagDrillStat[]; totalQuestions: number; error: string | null }> {
  const { data, error } = await supabase
    .from('attempts')
    .select('id, question_id, result, answered_at')
    .eq('exam_id', params.examId)
    .eq('user_id', params.userId)
    .in('result', ['incorrect', 'partial'])
    .order('answered_at', { ascending: false })
    .limit(3000)

  if (error) return { stats: [], totalQuestions: 0, error: error.message }

  const attempts = (data as AttemptMissRow[] | null) ?? []
  if (attempts.length === 0) {
    return { stats: emptyCanonicalStats(), totalQuestions: 0, error: null }
  }

  const tagMap = await loadMistakeTagsForAttemptsChunked(attempts.map((a) => a.id))
  const idsByTag = new Map<string, Set<string>>()

  for (const attempt of attempts) {
    const tags = tagMap[attempt.id] ?? []
    for (const row of tags) {
      const code = row.tag?.trim()
      if (!code) continue
      let set = idsByTag.get(code)
      if (!set) {
        set = new Set()
        idsByTag.set(code, set)
      }
      set.add(attempt.question_id)
    }
  }

  const knownOrder = MISTAKE_TAG_DEFS.map((d) => d.tag)
  const knownSet = new Set<string>(knownOrder)
  const unknownTags = [...idsByTag.keys()].filter((t) => !knownSet.has(t)).sort()

  const stats: MistakeTagDrillStat[] = []
  for (const tag of [...knownOrder, ...unknownTags]) {
    const ids = [...(idsByTag.get(tag) ?? [])]
    stats.push({
      tag,
      label: MISTAKE_TAG_LABELS[tag as MistakeTagCode] ?? humaniseTag(tag),
      questionCount: ids.length,
      questionIds: ids,
    })
  }

  const totalQuestions = new Set(stats.flatMap((s) => s.questionIds)).size
  return { stats, totalQuestions, error: null }
}

function emptyCanonicalStats(): MistakeTagDrillStat[] {
  return MISTAKE_TAG_DEFS.map((d) => ({
    tag: d.tag,
    label: d.label,
    questionCount: 0,
    questionIds: [],
  }))
}

function humaniseTag(tag: string): string {
  return tag
    .split(/[_-]+/)
    .filter(Boolean)
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join(' ')
}

async function loadMistakeTagsForAttemptsChunked(attemptIds: string[]) {
  const chunkSize = 200
  const merged: Awaited<ReturnType<typeof loadMistakeTagsForAttempts>> = {}
  for (let i = 0; i < attemptIds.length; i += chunkSize) {
    const chunk = await loadMistakeTagsForAttempts(attemptIds.slice(i, i + chunkSize))
    Object.assign(merged, chunk)
  }
  return merged
}

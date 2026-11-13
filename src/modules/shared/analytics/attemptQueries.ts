import { supabase } from '@/lib/supabase'
import { loadMistakeTagsForAttempts, type MistakeTagRow } from '@/features/mistakes'
import type { Attempt, AttemptResult, Question, StudySession, Topic } from '@/types/database'

export type AttemptLogRow = Attempt & {
  questions: Pick<Question, 'id' | 'stem' | 'topic_id' | 'question_type'> | null
  study_sessions: Pick<StudySession, 'id' | 'session_type' | 'presentation_format' | 'score_percent'> | null
  topics: Pick<Topic, 'id' | 'name' | 'slug'> | null
  mistake_tags: MistakeTagRow[]
}

export async function fetchAttemptLog(params: {
  userId: string
  examId: string
  limit?: number
}): Promise<{ rows: AttemptLogRow[]; error: string | null }> {
  const { data, error } = await supabase
    .from('attempts')
    .select(
      '*, questions(id, stem, topic_id, question_type), study_sessions(id, session_type, presentation_format, score_percent)',
    )
    .eq('user_id', params.userId)
    .eq('exam_id', params.examId)
    .order('answered_at', { ascending: false })
    .limit(params.limit ?? 500)

  if (error) return { rows: [], error: error.message }

  const raw = (data as unknown as AttemptLogRow[] | null) ?? []
  const topicIds = [
    ...new Set(raw.map((r) => r.questions?.topic_id).filter(Boolean) as string[]),
  ]
  let topicMap: Record<string, Topic> = {}
  if (topicIds.length > 0) {
    const { data: topics } = await supabase.from('topics').select('*').in('id', topicIds)
    topicMap = Object.fromEntries(((topics as Topic[] | null) ?? []).map((t) => [t.id, t]))
  }

  const tagMap = await loadMistakeTagsForAttempts(raw.map((r) => r.id))
  const rows = raw.map((r) => ({
    ...r,
    topics: r.questions?.topic_id ? topicMap[r.questions.topic_id] ?? null : null,
    mistake_tags: tagMap[r.id] ?? [],
  }))

  return { rows, error: null }
}

export async function fetchQuestionTimeline(params: {
  userId: string
  examId: string
  questionId: string
}): Promise<{ rows: AttemptLogRow[]; error: string | null }> {
  const { data, error } = await supabase
    .from('attempts')
    .select(
      '*, questions(id, stem, topic_id, question_type), study_sessions(id, session_type, presentation_format, score_percent)',
    )
    .eq('user_id', params.userId)
    .eq('exam_id', params.examId)
    .eq('question_id', params.questionId)
    .order('answered_at', { ascending: true })

  if (error) return { rows: [], error: error.message }
  const raw = (data as unknown as AttemptLogRow[] | null) ?? []
  const tagMap = await loadMistakeTagsForAttempts(raw.map((r) => r.id))
  return {
    rows: raw.map((r) => ({ ...r, topics: null, mistake_tags: tagMap[r.id] ?? [] })),
    error: null,
  }
}

export async function fetchSessionsForExport(params: {
  userId: string
  examId: string
}): Promise<{ sessions: StudySession[]; error: string | null }> {
  const { data, error } = await supabase
    .from('study_sessions')
    .select('*')
    .eq('user_id', params.userId)
    .eq('exam_id', params.examId)
    .order('started_at', { ascending: false })
    .limit(200)
  if (error) return { sessions: [], error: error.message }
  return { sessions: (data as StudySession[] | null) ?? [], error: null }
}

export type AttemptFilters = {
  result: 'all' | AttemptResult
  sessionType: string
  mistakeTag: string
  query: string
}

export type AttemptSort = 'worst_scores' | 'best_scores' | 'most_recent' | 'all_attempts'

const MOCK_SESSION_TYPES = new Set(['full_mock', 'as_many_as_you_can'])
const STUDY_SESSION_TYPES = new Set([
  'topic',
  'random',
  'weakness',
  'spaced_repetition',
  'flashcard',
])

export function isMockSessionType(sessionType: string | null | undefined): boolean {
  return Boolean(sessionType && MOCK_SESSION_TYPES.has(sessionType))
}

export function isStudySessionType(sessionType: string | null | undefined): boolean {
  return Boolean(sessionType && STUDY_SESSION_TYPES.has(sessionType))
}

export async function fetchSessionTimeline(params: {
  userId: string
  examId: string
  sessionId: string
}): Promise<{ rows: AttemptLogRow[]; error: string | null }> {
  const { data, error } = await supabase
    .from('attempts')
    .select(
      '*, questions(id, stem, topic_id, question_type), study_sessions(id, session_type, presentation_format, score_percent)',
    )
    .eq('user_id', params.userId)
    .eq('exam_id', params.examId)
    .eq('session_id', params.sessionId)
    .order('answered_at', { ascending: true })

  if (error) return { rows: [], error: error.message }
  const raw = (data as unknown as AttemptLogRow[] | null) ?? []
  const topicIds = [
    ...new Set(raw.map((r) => r.questions?.topic_id).filter(Boolean) as string[]),
  ]
  let topicMap: Record<string, Topic> = {}
  if (topicIds.length > 0) {
    const { data: topics } = await supabase.from('topics').select('*').in('id', topicIds)
    topicMap = Object.fromEntries(((topics as Topic[] | null) ?? []).map((t) => [t.id, t]))
  }
  const tagMap = await loadMistakeTagsForAttempts(raw.map((r) => r.id))
  return {
    rows: raw.map((r) => ({
      ...r,
      topics: r.questions?.topic_id ? topicMap[r.questions.topic_id] ?? null : null,
      mistake_tags: tagMap[r.id] ?? [],
    })),
    error: null,
  }
}

const RESULT_RANK: Record<string, number> = {
  correct: 3,
  partial: 2,
  skipped: 1,
  incorrect: 0,
}

function sessionScore(row: AttemptLogRow): number {
  if (row.study_sessions?.score_percent != null) return Number(row.study_sessions.score_percent)
  return RESULT_RANK[row.result] ?? 0
}

export function filterAndSortAttempts(
  rows: AttemptLogRow[],
  filters: AttemptFilters,
  sort: AttemptSort,
): AttemptLogRow[] {
  let out = rows.filter((r) => {
    if (filters.result !== 'all' && r.result !== filters.result) return false
    if (
      filters.sessionType !== 'all' &&
      (r.study_sessions?.session_type ?? 'standalone') !== filters.sessionType
    ) {
      return false
    }
    if (filters.mistakeTag !== 'all') {
      if (!r.mistake_tags.some((t) => t.tag === filters.mistakeTag)) return false
    }
    if (filters.query.trim()) {
      const q = filters.query.trim().toLowerCase()
      const hay = `${r.questions?.stem ?? ''} ${r.topics?.name ?? ''}`.toLowerCase()
      if (!hay.includes(q)) return false
    }
    return true
  })

  out = [...out].sort((a, b) => {
    const byRecent =
      new Date(b.answered_at).getTime() - new Date(a.answered_at).getTime()
    if (sort === 'most_recent' || sort === 'all_attempts') return byRecent
    const sa = sessionScore(a)
    const sb = sessionScore(b)
    if (sort === 'best_scores') return sb - sa || byRecent
    return sa - sb || byRecent
  })

  return out
}

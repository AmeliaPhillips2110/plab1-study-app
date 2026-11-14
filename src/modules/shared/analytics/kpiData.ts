import { sortTopicsByName } from '@/lib/topics'
import { supabase } from '@/lib/supabase'
import { fetchAttemptLog, type AttemptLogRow } from '@/modules/shared/analytics/attemptQueries'
import type { StudySession, Topic } from '@/types/database'

export async function fetchKpiBundle(params: {
  userId: string
  examId: string
}): Promise<{
  attempts: AttemptLogRow[]
  sessions: StudySession[]
  topics: Topic[]
  bankActive: number
  /** Active SBA counts keyed by topic_id (for mastery rings). */
  bankByTopic: Record<string, number>
  error: string | null
}> {
  const [attemptsRes, sessionsRes, topicsRes, bankRes, sbaRes] = await Promise.all([
    fetchAttemptLog({ userId: params.userId, examId: params.examId, limit: 1000 }),
    supabase
      .from('study_sessions')
      .select('*')
      .eq('user_id', params.userId)
      .eq('exam_id', params.examId)
      .order('started_at', { ascending: false })
      .limit(200),
    supabase
      .from('topics')
      .select('*')
      .eq('exam_id', params.examId)
      .eq('is_active', true)
      .order('name', { ascending: true }),
    supabase
      .from('questions')
      .select('id', { count: 'exact', head: true })
      .eq('exam_id', params.examId)
      .eq('is_active', true),
    supabase
      .from('questions')
      .select('topic_id')
      .eq('exam_id', params.examId)
      .eq('is_active', true)
      .eq('question_type', 'sba'),
  ])

  const bankByTopic: Record<string, number> = {}
  for (const q of sbaRes.data ?? []) {
    const tid = (q as { topic_id: string | null }).topic_id
    if (!tid) continue
    bankByTopic[tid] = (bankByTopic[tid] ?? 0) + 1
  }

  if (attemptsRes.error) {
    return {
      attempts: [],
      sessions: [],
      topics: [],
      bankActive: 0,
      bankByTopic: {},
      error: attemptsRes.error,
    }
  }
  if (sessionsRes.error) {
    return {
      attempts: attemptsRes.rows,
      sessions: [],
      topics: [],
      bankActive: 0,
      bankByTopic,
      error: sessionsRes.error.message,
    }
  }

  return {
    attempts: attemptsRes.rows,
    sessions: (sessionsRes.data as StudySession[] | null) ?? [],
    topics: sortTopicsByName((topicsRes.data as Topic[] | null) ?? []),
    bankActive: bankRes.count ?? 0,
    bankByTopic,
    error:
      topicsRes.error?.message ?? bankRes.error?.message ?? sbaRes.error?.message ?? null,
  }
}

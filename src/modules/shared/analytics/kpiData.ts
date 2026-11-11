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
  error: string | null
}> {
  const [attemptsRes, sessionsRes, topicsRes, bankRes] = await Promise.all([
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
      .order('sort_order', { ascending: true }),
    supabase
      .from('questions')
      .select('id', { count: 'exact', head: true })
      .eq('exam_id', params.examId)
      .eq('is_active', true),
  ])

  if (attemptsRes.error) {
    return {
      attempts: [],
      sessions: [],
      topics: [],
      bankActive: 0,
      error: attemptsRes.error,
    }
  }
  if (sessionsRes.error) {
    return {
      attempts: attemptsRes.rows,
      sessions: [],
      topics: [],
      bankActive: 0,
      error: sessionsRes.error.message,
    }
  }

  return {
    attempts: attemptsRes.rows,
    sessions: (sessionsRes.data as StudySession[] | null) ?? [],
    topics: (topicsRes.data as Topic[] | null) ?? [],
    bankActive: bankRes.count ?? 0,
    error: topicsRes.error?.message ?? bankRes.error?.message ?? null,
  }
}

import { supabase } from '@/lib/supabase'
import { shuffleInPlace } from '@/modules/shared/quiz-engine/scoring'
import type { AttemptResult, QuestionWithOptions } from '@/types/database'

export type DueTodayBreakdown = {
  daily: number
  flagged: number
  weak: number
  /** Unique questions that would enter the session (before hard cap). */
  unique: number
}

export type DueTodayResult = {
  questions: QuestionWithOptions[]
  breakdown: DueTodayBreakdown
  error: string | null
}

const SESSION_CAP = 40

type AttemptRow = {
  question_id: string
  result: AttemptResult
  answered_at: string
  response_payload?: Record<string, unknown> | null
}

function asQuestions(data: unknown): QuestionWithOptions[] {
  return ((data as QuestionWithOptions[] | null) ?? []).map((q) => ({
    ...q,
    question_options: [...(q.question_options ?? [])].sort((a, b) => a.sort_order - b.sort_order),
  }))
}

/** Due spaced-repetition cards (missed days included via due_at <= now). */
async function fetchDueDailyIds(examId: string, userId: string): Promise<{ ids: string[]; error: string | null }> {
  const nowIso = new Date().toISOString()
  const { data, error } = await supabase
    .from('spaced_repetition_state')
    .select('question_id, due_at')
    .eq('exam_id', examId)
    .eq('user_id', userId)
    .lte('due_at', nowIso)
    .order('due_at', { ascending: true })
    .limit(200)

  if (error) return { ids: [], error: error.message }
  const ids = ((data as Array<{ question_id: string }> | null) ?? []).map((r) => r.question_id)
  return { ids: [...new Set(ids)], error: null }
}

/** Latest flag wins per question (same rule as Revise Flagged). */
async function fetchFlaggedIds(examId: string, userId: string): Promise<{ ids: string[]; error: string | null }> {
  const { data: attempts, error } = await supabase
    .from('attempts')
    .select('question_id, response_payload, answered_at')
    .eq('exam_id', examId)
    .eq('user_id', userId)
    .order('answered_at', { ascending: false })
    .limit(3000)

  if (error) return { ids: [], error: error.message }

  const flaggedIds: string[] = []
  const seen = new Set<string>()
  for (const row of (attempts as AttemptRow[] | null) ?? []) {
    if (seen.has(row.question_id)) continue
    seen.add(row.question_id)
    if (row.response_payload?.flagged === true) flaggedIds.push(row.question_id)
  }
  return { ids: flaggedIds, error: null }
}

/**
 * Weak-topic items: SBAs from the 1–3 topics with the worst miss rate
 * (reuses weakness by_topic ranking; no random fallback).
 */
async function fetchWeakTopicIds(
  examId: string,
  userId: string,
): Promise<{ ids: string[]; error: string | null }> {
  const { data: attempts, error } = await supabase
    .from('attempts')
    .select('question_id, result, answered_at')
    .eq('exam_id', examId)
    .eq('user_id', userId)
    .order('answered_at', { ascending: false })
    .limit(500)

  if (error) return { ids: [], error: error.message }
  const rows = (attempts as AttemptRow[] | null) ?? []
  if (rows.length === 0) return { ids: [], error: null }

  const attemptedIds = [...new Set(rows.map((r) => r.question_id))]
  const { data: qs, error: qErr } = await supabase
    .from('questions')
    .select('id, topic_id')
    .eq('exam_id', examId)
    .in('id', attemptedIds)

  if (qErr) return { ids: [], error: qErr.message }

  type QMeta = { id: string; topic_id: string | null }
  const metas = (qs as QMeta[] | null) ?? []
  const topicByQ = new Map(metas.map((m) => [m.id, m.topic_id]))

  const missByTopic = new Map<string, { wrong: number; total: number }>()
  for (const row of rows) {
    const topicId = topicByQ.get(row.question_id)
    if (!topicId) continue
    const s = missByTopic.get(topicId) ?? { wrong: 0, total: 0 }
    s.total += 1
    if (row.result === 'incorrect' || row.result === 'partial') s.wrong += 1
    missByTopic.set(topicId, s)
  }

  const weakTopics = [...missByTopic.entries()]
    .filter(([, s]) => s.total >= 2 && s.wrong / s.total > 0)
    .sort((a, b) => b[1].wrong / b[1].total - a[1].wrong / a[1].total || b[1].wrong - a[1].wrong)
    .slice(0, 3)
    .map(([id]) => id)

  if (weakTopics.length === 0) return { ids: [], error: null }

  // Prefer recently missed items in those topics, then fill from the topic bank.
  const recentMisses: string[] = []
  const seen = new Set<string>()
  for (const row of rows) {
    if (row.result !== 'incorrect' && row.result !== 'partial') continue
    const topicId = topicByQ.get(row.question_id)
    if (!topicId || !weakTopics.includes(topicId)) continue
    if (seen.has(row.question_id)) continue
    seen.add(row.question_id)
    recentMisses.push(row.question_id)
    if (recentMisses.length >= 40) break
  }

  if (recentMisses.length >= 10) return { ids: recentMisses, error: null }

  const { data: poolData, error: poolErr } = await supabase
    .from('questions')
    .select('id')
    .eq('exam_id', examId)
    .eq('is_active', true)
    .eq('question_type', 'sba')
    .in('topic_id', weakTopics)
    .limit(80)

  if (poolErr) return { ids: recentMisses, error: poolErr.message }

  const poolIds = ((poolData as Array<{ id: string }> | null) ?? []).map((r) => r.id)
  for (const id of shuffleInPlace(poolIds)) {
    if (seen.has(id)) continue
    seen.add(id)
    recentMisses.push(id)
    if (recentMisses.length >= 40) break
  }

  return { ids: recentMisses, error: null }
}

export async function fetchDueTodayBreakdown(
  examId: string,
  userId: string,
): Promise<{ breakdown: DueTodayBreakdown; error: string | null }> {
  const [daily, flagged, weak] = await Promise.all([
    fetchDueDailyIds(examId, userId),
    fetchFlaggedIds(examId, userId),
    fetchWeakTopicIds(examId, userId),
  ])
  const err = daily.error ?? flagged.error ?? weak.error
  if (err) {
    return { breakdown: { daily: 0, flagged: 0, weak: 0, unique: 0 }, error: err }
  }
  const unique = new Set([...daily.ids, ...flagged.ids, ...weak.ids])
  return {
    breakdown: {
      daily: daily.ids.length,
      flagged: flagged.ids.length,
      weak: weak.ids.length,
      unique: unique.size,
    },
    error: null,
  }
}

/**
 * Single session queue: due daily SR cards → flagged → weak-topic items (deduped).
 * No spaced/random fallback — empty when nothing is due.
 */
export async function selectDueTodayQueue(
  examId: string,
  userId: string,
  limit = SESSION_CAP,
): Promise<DueTodayResult> {
  const cap = Math.min(Math.max(limit, 1), SESSION_CAP)
  const [daily, flagged, weak] = await Promise.all([
    fetchDueDailyIds(examId, userId),
    fetchFlaggedIds(examId, userId),
    fetchWeakTopicIds(examId, userId),
  ])
  const err = daily.error ?? flagged.error ?? weak.error
  if (err) {
    return {
      questions: [],
      breakdown: { daily: 0, flagged: 0, weak: 0, unique: 0 },
      error: err,
    }
  }

  const breakdown: DueTodayBreakdown = {
    daily: daily.ids.length,
    flagged: flagged.ids.length,
    weak: weak.ids.length,
    unique: 0,
  }

  const ordered: string[] = []
  const seen = new Set<string>()
  for (const id of [...daily.ids, ...flagged.ids, ...weak.ids]) {
    if (seen.has(id)) continue
    seen.add(id)
    ordered.push(id)
  }
  breakdown.unique = ordered.length

  if (ordered.length === 0) {
    return { questions: [], breakdown, error: null }
  }

  const take = ordered.slice(0, cap)
  const { data, error } = await supabase
    .from('questions')
    .select('*, question_options(*)')
    .in('id', take)
    .eq('is_active', true)

  if (error) return { questions: [], breakdown, error: error.message }

  const loaded = asQuestions(data)
  const byId = new Map(loaded.map((q) => [q.id, q]))
  const questions = take.map((id) => byId.get(id)).filter(Boolean) as QuestionWithOptions[]
  return { questions, breakdown, error: null }
}

export function formatDueTodayCounts(b: DueTodayBreakdown): string {
  return `${b.daily} daily · ${b.flagged} flagged · ${b.weak} weak`
}

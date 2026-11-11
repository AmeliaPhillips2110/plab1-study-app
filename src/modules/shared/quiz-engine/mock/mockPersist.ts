import { supabase } from '@/lib/supabase'
import { scorePercent } from '@/modules/shared/quiz-engine/scoring'
import { shuffleInPlace } from '@/modules/shared/quiz-engine/scoring'
import type { QuestionWithOptions, StudySession } from '@/types/database'
import type { MockProgressState, MockStartConfig, TimedMode } from '@/types/quiz'

const LOCAL_KEY = (sessionId: string) => `plaboratory-mock:${sessionId}`

export function loadLocalProgress(sessionId: string): MockProgressState | null {
  try {
    const raw = localStorage.getItem(LOCAL_KEY(sessionId))
    if (!raw) return null
    return JSON.parse(raw) as MockProgressState
  } catch {
    return null
  }
}

export function saveLocalProgress(sessionId: string, state: MockProgressState) {
  localStorage.setItem(LOCAL_KEY(sessionId), JSON.stringify(state))
}

export function clearLocalProgress(sessionId: string) {
  localStorage.removeItem(LOCAL_KEY(sessionId))
}

export async function countActiveSba(examId: string): Promise<number> {
  const { count, error } = await supabase
    .from('questions')
    .select('id', { count: 'exact', head: true })
    .eq('exam_id', examId)
    .eq('is_active', true)
    .eq('question_type', 'sba')
  if (error) return 0
  return count ?? 0
}

export async function loadSbaBank(examId: string, limit: number): Promise<{
  questions: QuestionWithOptions[]
  error: string | null
}> {
  const { data, error } = await supabase
    .from('questions')
    .select('*, question_options(*)')
    .eq('exam_id', examId)
    .eq('is_active', true)
    .eq('question_type', 'sba')
    .limit(Math.max(limit, 1))

  if (error) return { questions: [], error: error.message }
  const rows = ((data as unknown as QuestionWithOptions[] | null) ?? []).map((q) => ({
    ...q,
    question_options: [...(q.question_options ?? [])].sort((a, b) => a.sort_order - b.sort_order),
  }))
  return { questions: shuffleInPlace(rows).slice(0, limit), error: null }
}

export async function createMockSession(params: {
  userId: string
  config: MockStartConfig
  questions: QuestionWithOptions[]
}): Promise<{ sessionId: string | null; progress: MockProgressState | null; error: string | null }> {
  const now = new Date()
  const timeLimitSec = params.config.timeLimitSec
  const deadline = new Date(now.getTime() + timeLimitSec * 1000)
  const progress: MockProgressState = {
    version: 1,
    mode: params.config.mode,
    questionIds: params.questions.map((q) => q.id),
    answers: {},
    flagged: [],
    currentIndex: 0,
    targetCount: params.config.targetQuestionCount,
    timeLimitSec,
    deadlineAt: deadline.toISOString(),
    startedAt: now.toISOString(),
    paceSamples: [{ elapsedSec: 0, answeredCount: 0 }],
    autosavedAt: now.toISOString(),
  }

  const { data, error } = await supabase
    .from('study_sessions')
    .insert({
      exam_id: params.config.examId,
      user_id: params.userId,
      session_type: params.config.mode,
      presentation_format: 'sba',
      unseen_only: false,
      settings: progress as unknown as Record<string, unknown>,
      question_count: params.questions.length,
      time_limit_sec: timeLimitSec,
      started_at: now.toISOString(),
    })
    .select('id')
    .single()

  if (error || !data) {
    return { sessionId: null, progress: null, error: error?.message ?? 'Could not create mock session.' }
  }

  const sessionId = (data as { id: string }).id
  saveLocalProgress(sessionId, progress)
  return { sessionId, progress, error: null }
}

export async function autosaveMockProgress(params: {
  sessionId: string
  progress: MockProgressState
}): Promise<{ error: string | null }> {
  const next = { ...params.progress, autosavedAt: new Date().toISOString() }
  saveLocalProgress(params.sessionId, next)
  const { error } = await supabase
    .from('study_sessions')
    .update({ settings: next as unknown as Record<string, unknown> })
    .eq('id', params.sessionId)
  return { error: error?.message ?? null }
}

export async function findOpenTimedSessions(params: {
  userId: string
  examId: string
}): Promise<StudySession[]> {
  const { data, error } = await supabase
    .from('study_sessions')
    .select('*')
    .eq('user_id', params.userId)
    .eq('exam_id', params.examId)
    .is('ended_at', null)
    .in('session_type', ['full_mock', 'as_many_as_you_can'])
    .order('started_at', { ascending: false })

  if (error) return []
  return (data as StudySession[] | null) ?? []
}

export function progressFromSession(session: StudySession): MockProgressState | null {
  const local = loadLocalProgress(session.id)
  const remote = session.settings as unknown as MockProgressState | null
  if (local?.version === 1 && remote?.version === 1) {
    // Prefer whichever was autosaved later.
    return new Date(local.autosavedAt) >= new Date(remote.autosavedAt) ? local : remote
  }
  if (local?.version === 1) return local
  if (remote?.version === 1) return remote
  return null
}

export async function loadQuestionsByIds(ids: string[]): Promise<QuestionWithOptions[]> {
  if (ids.length === 0) return []
  const { data, error } = await supabase
    .from('questions')
    .select('*, question_options(*)')
    .in('id', ids)
  if (error || !data) return []
  const map = new Map(
    ((data as unknown as QuestionWithOptions[]) ?? []).map((q) => [
      q.id,
      {
        ...q,
        question_options: [...(q.question_options ?? [])].sort((a, b) => a.sort_order - b.sort_order),
      },
    ]),
  )
  return ids.map((id) => map.get(id)).filter(Boolean) as QuestionWithOptions[]
}

export async function finalizeMockSession(params: {
  sessionId: string
  examId: string
  userId: string
  questions: QuestionWithOptions[]
  progress: MockProgressState
  passMarkPercent: number
}): Promise<{
  error: string | null
  percent: number
  correct: number
  answered: number
  passed: boolean
  attemptIdByQuestionId: Record<string, string>
}> {
  const rows = params.questions.map((q) => {
    const selected = params.progress.answers[q.id] ?? null
    const correctOpt = q.question_options.find((o) => o.is_correct)
    let result: 'correct' | 'incorrect' | 'skipped' = 'skipped'
    if (selected) {
      result = selected === correctOpt?.id ? 'correct' : 'incorrect'
    }
    return {
      session_id: params.sessionId,
      exam_id: params.examId,
      user_id: params.userId,
      question_id: q.id,
      selected_option_id: selected,
      response_payload: {
        flagged: params.progress.flagged.includes(q.id),
        mode: params.progress.mode,
      },
      result,
      time_spent_ms: null,
    }
  })

  // Replace any prior draft attempts for this session.
  await supabase.from('attempts').delete().eq('session_id', params.sessionId)
  const attemptIdByQuestionId: Record<string, string> = {}
  if (rows.length > 0) {
    const { data: inserted, error: insErr } = await supabase
      .from('attempts')
      .insert(rows)
      .select('id, question_id')
    if (insErr) {
      return {
        error: insErr.message,
        percent: 0,
        correct: 0,
        answered: 0,
        passed: false,
        attemptIdByQuestionId: {},
      }
    }
    for (const row of (inserted as { id: string; question_id: string }[] | null) ?? []) {
      attemptIdByQuestionId[row.question_id] = row.id
    }
  }

  const answered = rows.filter((r) => r.result !== 'skipped').length
  const correct = rows.filter((r) => r.result === 'correct').length
  // Full mock: score vs whole paper (unanswered count as not correct).
  // AMAYC: score vs answered items so early stop is fair.
  const denom =
    params.progress.mode === 'as_many_as_you_can'
      ? Math.max(answered, 1)
      : Math.max(rows.length, 1)
  const percent = scorePercent(correct, denom)
  const passed = percent >= params.passMarkPercent

  const finishedProgress = {
    ...params.progress,
    autosavedAt: new Date().toISOString(),
  }

  const { error } = await supabase
    .from('study_sessions')
    .update({
      ended_at: new Date().toISOString(),
      score_percent: percent,
      question_count: rows.length,
      settings: {
        ...finishedProgress,
        finished: true,
        correct,
        answered,
        passed,
      } as unknown as Record<string, unknown>,
    })
    .eq('id', params.sessionId)

  clearLocalProgress(params.sessionId)
  return {
    error: error?.message ?? null,
    percent,
    correct,
    answered,
    passed,
    attemptIdByQuestionId,
  }
}

export function defaultMockLimits(settings: {
  default_mock_question_count: number
  default_mock_minutes: number
} | null): { questions: number; minutes: number; seconds: number } {
  const questions = settings?.default_mock_question_count ?? 180
  const minutes = settings?.default_mock_minutes ?? 180
  return { questions, minutes, seconds: minutes * 60 }
}

export type { TimedMode }

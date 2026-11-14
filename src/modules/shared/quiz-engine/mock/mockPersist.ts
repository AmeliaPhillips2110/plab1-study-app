import { supabase } from '@/lib/supabase'
import { scorePercent } from '@/modules/shared/quiz-engine/scoring'
import { shuffleInPlace } from '@/modules/shared/quiz-engine/scoring'
import type { QuestionWithOptions, StudySession } from '@/types/database'
import type { MockProgressState, MockStartConfig, TimedMode } from '@/types/quiz'

const LOCAL_KEY = (sessionId: string) => `plaboratory-mock:${sessionId}`

/** Fill optional fields for progress saved before opened/answer-change tracking. */
export function normalizeMockProgress(state: MockProgressState): MockProgressState {
  const firstId = state.questionIds[state.currentIndex]
  const opened = new Set(state.openedIds ?? [])
  if (firstId) opened.add(firstId)
  return {
    ...state,
    openedIds: [...opened],
    answerChanges: state.answerChanges ?? {},
  }
}

export function loadLocalProgress(sessionId: string): MockProgressState | null {
  try {
    const raw = localStorage.getItem(LOCAL_KEY(sessionId))
    if (!raw) return null
    return normalizeMockProgress(JSON.parse(raw) as MockProgressState)
  } catch {
    return null
  }
}

export function saveLocalProgress(sessionId: string, state: MockProgressState) {
  localStorage.setItem(LOCAL_KEY(sessionId), JSON.stringify(normalizeMockProgress(state)))
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

function mapSbaRows(data: QuestionWithOptions[] | null | undefined): QuestionWithOptions[] {
  return (data ?? []).map((q) => ({
    ...q,
    question_options: [...(q.question_options ?? [])].sort((a, b) => a.sort_order - b.sort_order),
  }))
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
  const rows = mapSbaRows(data as unknown as QuestionWithOptions[] | null)
  return { questions: shuffleInPlace(rows).slice(0, limit), error: null }
}

/** Load active SBAs for one topic (server-side filter — required for Themed Test). */
export async function loadSbaByTopic(
  examId: string,
  topicId: string,
  limit: number,
): Promise<{
  questions: QuestionWithOptions[]
  error: string | null
}> {
  const { data, error } = await supabase
    .from('questions')
    .select('*, question_options(*)')
    .eq('exam_id', examId)
    .eq('topic_id', topicId)
    .eq('is_active', true)
    .eq('question_type', 'sba')
    .limit(Math.max(limit, 1))

  if (error) return { questions: [], error: error.message }
  const rows = mapSbaRows(data as unknown as QuestionWithOptions[] | null)
  return { questions: shuffleInPlace(rows).slice(0, limit), error: null }
}

export async function createMockSession(params: {
  userId: string
  config: MockStartConfig
  questions: QuestionWithOptions[]
}): Promise<{ sessionId: string | null; progress: MockProgressState | null; error: string | null }> {
  const now = new Date()
  const timeLimitSec = Math.max(0, params.config.timeLimitSec)
  // Unlimited (0s): far deadline so runner never auto-ends on time.
  const deadlineMs =
    timeLimitSec > 0 ? now.getTime() + timeLimitSec * 1000 : now.getTime() + 365 * 24 * 60 * 60 * 1000
  const deadline = new Date(deadlineMs)
  const questionIds = params.questions.map((q) => q.id)
  const progress: MockProgressState = {
    version: 1,
    mode: params.config.mode,
    questionIds,
    answers: {},
    flagged: [],
    openedIds: questionIds[0] ? [questionIds[0]] : [],
    answerChanges: {},
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

/**
 * Close an unfinished mock without scoring — used when saved question IDs
 * were deleted from the bank (e.g. SAMPLE rows cleared after Excel import).
 */
export async function abandonMockSession(sessionId: string): Promise<{ error: string | null }> {
  const { error } = await supabase
    .from('study_sessions')
    .update({
      ended_at: new Date().toISOString(),
      settings: {
        orphaned: true,
        orphanReason: 'questions_missing_from_bank',
        finished: true,
      } as unknown as Record<string, unknown>,
    })
    .eq('id', sessionId)
    .is('ended_at', null)

  clearLocalProgress(sessionId)
  return { error: error?.message ?? null }
}

/** True when every saved question id still exists in the bank. */
export async function mockSessionQuestionsIntact(
  progress: MockProgressState | null,
): Promise<{ intact: boolean; questions: QuestionWithOptions[] }> {
  if (!progress || progress.questionIds.length === 0) {
    return { intact: false, questions: [] }
  }
  const questions = await loadQuestionsByIds(progress.questionIds)
  return {
    intact: questions.length === progress.questionIds.length,
    questions,
  }
}

/**
 * Open timed sessions that still have a complete question set.
 * Auto-abandons orphans (missing bank ids) so Resume Unfinished stays clean.
 */
export async function findValidOpenTimedSessions(params: {
  userId: string
  examId: string
}): Promise<{ sessions: StudySession[]; purged: number }> {
  const open = await findOpenTimedSessions(params)
  const valid: StudySession[] = []
  let purged = 0

  for (const session of open) {
    const progress = progressFromSession(session)
    const { intact } = await mockSessionQuestionsIntact(progress)
    if (intact) {
      valid.push(session)
      continue
    }
    await abandonMockSession(session.id)
    purged += 1
  }

  return { sessions: valid, purged }
}

export function progressFromSession(session: StudySession): MockProgressState | null {
  const local = loadLocalProgress(session.id)
  const remoteRaw = session.settings as unknown as MockProgressState | null
  const remote =
    remoteRaw?.version === 1 ? normalizeMockProgress(remoteRaw) : null
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
  skipped: number
  timesChanged: number
  passed: boolean
  attemptIdByQuestionId: Record<string, string>
}> {
  const progress = normalizeMockProgress(params.progress)
  const opened = new Set(progress.openedIds ?? [])
  const answerChanges = progress.answerChanges ?? {}

  // Answered → correct/incorrect. Opened but unanswered → skipped.
  // Never opened → no attempt row (keep last status / stay New).
  const rows = params.questions
    .map((q) => {
      const selected = progress.answers[q.id] ?? null
      const changes = answerChanges[q.id] ?? 0
      if (selected) {
        const correctOpt = q.question_options.find((o) => o.is_correct)
        const result: 'correct' | 'incorrect' =
          selected === correctOpt?.id ? 'correct' : 'incorrect'
        return {
          session_id: params.sessionId,
          exam_id: params.examId,
          user_id: params.userId,
          question_id: q.id,
          selected_option_id: selected,
          response_payload: {
            flagged: progress.flagged.includes(q.id),
            mode: progress.mode,
            answerChanges: changes,
          },
          result,
          time_spent_ms: null,
        }
      }
      if (opened.has(q.id)) {
        return {
          session_id: params.sessionId,
          exam_id: params.examId,
          user_id: params.userId,
          question_id: q.id,
          selected_option_id: null as string | null,
          response_payload: {
            flagged: progress.flagged.includes(q.id),
            mode: progress.mode,
            answerChanges: changes,
            skippedOpened: true,
          },
          result: 'skipped' as const,
          time_spent_ms: null,
        }
      }
      return null
    })
    .filter(Boolean) as Array<{
    session_id: string
    exam_id: string
    user_id: string
    question_id: string
    selected_option_id: string | null
    response_payload: Record<string, unknown>
    result: 'correct' | 'incorrect' | 'skipped'
    time_spent_ms: null
  }>

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
        skipped: 0,
        timesChanged: 0,
        passed: false,
        attemptIdByQuestionId: {},
      }
    }
    for (const row of (inserted as { id: string; question_id: string }[] | null) ?? []) {
      attemptIdByQuestionId[row.question_id] = row.id
    }
  }

  const graded = rows.filter((r) => r.result === 'correct' || r.result === 'incorrect')
  const answered = graded.length
  const skipped = rows.filter((r) => r.result === 'skipped').length
  const correct = graded.filter((r) => r.result === 'correct').length
  const timesChanged = Object.values(answerChanges).reduce((s, n) => s + (n || 0), 0)
  // Full mock: score vs whole paper (unanswered count as not correct).
  // AMAYC: score vs answered items so early stop is fair.
  const denom =
    progress.mode === 'as_many_as_you_can'
      ? Math.max(answered, 1)
      : Math.max(params.questions.length, 1)
  const percent = scorePercent(correct, denom)
  const passed = percent >= params.passMarkPercent

  const finishedProgress = {
    ...progress,
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
        skipped,
        timesChanged,
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
    skipped,
    timesChanged,
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

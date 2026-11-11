import { supabase } from '@/lib/supabase'
import { nextSrState } from '@/modules/shared/quiz-engine/spacedRepetition'
import { scorePercent } from '@/modules/shared/quiz-engine/scoring'
import type { AttemptResult, PresentationFormat, SessionType, WeaknessVariant } from '@/types/database'
import type { FlashcardGrade, LocalAttempt, QuizAnswerPayload, SessionSetupConfig } from '@/types/quiz'

export async function createStudySession(params: {
  userId: string
  config: SessionSetupConfig
  questionCount: number
}): Promise<{ sessionId: string | null; error: string | null }> {
  const { userId, config, questionCount } = params
  const row = {
    exam_id: config.examId,
    user_id: userId,
    session_type: config.sessionType as SessionType,
    presentation_format: config.presentationFormat as PresentationFormat,
    topic_id: config.sessionType === 'topic' ? config.topicId ?? null : null,
    weakness_variant:
      config.sessionType === 'weakness'
        ? ((config.weaknessVariant ?? 'recent_mistakes') as WeaknessVariant)
        : null,
    unseen_only: Boolean(config.unseenOnly),
    settings: {
      question_limit: config.questionLimit ?? 10,
      rapid_fire_seconds: config.rapidFireSeconds ?? 15,
    },
    question_count: questionCount,
  }

  const { data, error } = await supabase.from('study_sessions').insert(row).select('id').single()
  if (error || !data) return { sessionId: null, error: error?.message ?? 'Could not create session.' }
  return { sessionId: (data as { id: string }).id, error: null }
}

export async function saveAttempt(params: {
  sessionId: string
  examId: string
  userId: string
  questionId: string
  selectedOptionId: string | null
  result: AttemptResult
  responsePayload: QuizAnswerPayload
  timeSpentMs: number | null
}): Promise<{ error: string | null }> {
  const { error } = await supabase.from('attempts').insert({
    session_id: params.sessionId,
    exam_id: params.examId,
    user_id: params.userId,
    question_id: params.questionId,
    selected_option_id: params.selectedOptionId,
    response_payload: params.responsePayload,
    result: params.result,
    time_spent_ms: params.timeSpentMs,
  })
  return { error: error?.message ?? null }
}

export async function updateSpacedRepetition(params: {
  userId: string
  examId: string
  questionId: string
  grade?: FlashcardGrade
  result?: AttemptResult
}): Promise<void> {
  const { data: existing } = await supabase
    .from('spaced_repetition_state')
    .select('ease_factor, interval_days, repetitions, due_at')
    .eq('user_id', params.userId)
    .eq('question_id', params.questionId)
    .maybeSingle()

  const next = nextSrState(
    (existing as {
      ease_factor: number
      interval_days: number
      repetitions: number
      due_at: string
    } | null) ?? null,
    { grade: params.grade, result: params.result },
  )

  await supabase.from('spaced_repetition_state').upsert({
    user_id: params.userId,
    question_id: params.questionId,
    exam_id: params.examId,
    ease_factor: next.ease_factor,
    interval_days: next.interval_days,
    repetitions: next.repetitions,
    due_at: next.due_at,
    last_result: params.result ?? null,
    last_reviewed_at: new Date().toISOString(),
    updated_at: new Date().toISOString(),
  })
}

export async function finishStudySession(params: {
  sessionId: string
  attempts: LocalAttempt[]
}): Promise<{ error: string | null; percent: number }> {
  const graded = params.attempts.filter((a) => a.result !== 'skipped')
  const correct = graded.filter((a) => a.result === 'correct').length
  const percent = scorePercent(correct, graded.length || params.attempts.length)

  const { error } = await supabase
    .from('study_sessions')
    .update({
      ended_at: new Date().toISOString(),
      score_percent: percent,
      question_count: params.attempts.length,
    })
    .eq('id', params.sessionId)

  return { error: error?.message ?? null, percent }
}

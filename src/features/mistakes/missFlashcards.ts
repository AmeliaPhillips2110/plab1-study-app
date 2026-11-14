import { supabase } from '@/lib/supabase'
import type { AttemptResult, QuestionWithOptions } from '@/types/database'

type AttemptRow = {
  question_id: string
  result: AttemptResult
  answered_at: string
}

/** First sentence or truncated stem as a clinical cue for the card front. */
export function clinicalCueFromStem(stem: string): string {
  const trimmed = stem.trim().replace(/\s+/g, ' ')
  if (!trimmed) return 'Recall this item'
  const sentenceMatch = trimmed.match(/^[\s\S]{20,220}?[.!?](?=\s|$)/)
  if (sentenceMatch) return sentenceMatch[0].trim()
  if (trimmed.length <= 180) return trimmed
  return `${trimmed.slice(0, 177).trimEnd()}…`
}

function shortExplanation(text: string | null | undefined): string | null {
  if (!text?.trim()) return null
  const cleaned = text.trim().replace(/\s+/g, ' ')
  const sentences = cleaned.match(/[^.!?]+[.!?]+/g)
  if (sentences && sentences.length > 0) {
    const take = sentences.slice(0, 2).join(' ').trim()
    if (take.length <= 360) return take
  }
  if (cleaned.length <= 280) return cleaned
  return `${cleaned.slice(0, 277).trimEnd()}…`
}

/** In-memory flashcard sides for an SBA miss — does not write to the bank. */
export function asMissFlashcard(question: QuestionWithOptions): QuestionWithOptions {
  const payload = { ...(question.payload ?? {}) }
  const alreadyFront = typeof payload.front === 'string' && payload.front.trim()
  const alreadyBack = typeof payload.back === 'string' && payload.back.trim()
  if (alreadyFront && alreadyBack) {
    return {
      ...question,
      payload: { ...payload, miss_card: true, source_question_id: question.id },
    }
  }

  const correct = [...(question.question_options ?? [])].find((o) => o.is_correct)
  const correctLine = correct ? `${correct.label}. ${correct.body}` : null
  const expl = shortExplanation(question.explanation)
  const back = [correctLine, expl].filter(Boolean).join('\n\n') || 'No answer text stored for this card.'

  return {
    ...question,
    payload: {
      ...payload,
      miss_card: true,
      source_question_id: question.id,
      front: alreadyFront ? payload.front : clinicalCueFromStem(question.stem),
      back: alreadyBack ? payload.back : back,
    },
  }
}

/**
 * Unique SBA question IDs the user has got wrong (or partial), newest first.
 * Dedupes by question_id so the miss deck stays one card per item.
 */
export async function fetchMissQuestionIds(
  examId: string,
  userId: string,
): Promise<{ questionIds: string[]; error: string | null }> {
  const { data, error } = await supabase
    .from('attempts')
    .select('question_id, result, answered_at')
    .eq('exam_id', examId)
    .eq('user_id', userId)
    .in('result', ['incorrect', 'partial'])
    .order('answered_at', { ascending: false })
    .limit(3000)

  if (error) return { questionIds: [], error: error.message }

  const ids: string[] = []
  const seen = new Set<string>()
  for (const row of (data as AttemptRow[] | null) ?? []) {
    if (seen.has(row.question_id)) continue
    seen.add(row.question_id)
    ids.push(row.question_id)
  }
  return { questionIds: ids, error: null }
}

export async function selectMissFlashcardQuestions(
  examId: string,
  userId: string,
  limit: number,
): Promise<{ questions: QuestionWithOptions[]; error: string | null }> {
  const { questionIds, error } = await fetchMissQuestionIds(examId, userId)
  if (error) return { questions: [], error }
  if (questionIds.length === 0) {
    return {
      questions: [],
      error: 'No miss cards yet — get an SBA wrong in Practice or Tests first.',
    }
  }

  const take = questionIds.slice(0, Math.min(Math.max(limit, 1), 50))
  const { data, error: qErr } = await supabase
    .from('questions')
    .select('*, question_options(*)')
    .in('id', take)
    .eq('is_active', true)
    .eq('question_type', 'sba')

  if (qErr) return { questions: [], error: qErr.message }

  const loaded = ((data as unknown as QuestionWithOptions[] | null) ?? []).map((q) => ({
    ...q,
    question_options: [...(q.question_options ?? [])].sort((a, b) => a.sort_order - b.sort_order),
  }))
  const byId = new Map(loaded.map((q) => [q.id, q]))
  const ordered = take
    .map((id) => byId.get(id))
    .filter(Boolean)
    .map((q) => asMissFlashcard(q as QuestionWithOptions))

  if (ordered.length === 0) {
    return {
      questions: [],
      error: 'No miss cards yet — get an SBA wrong in Practice or Tests first.',
    }
  }

  return { questions: ordered, error: null }
}

export async function countMissFlashcards(
  examId: string,
  userId: string,
): Promise<{ count: number; error: string | null }> {
  const { questionIds, error } = await fetchMissQuestionIds(examId, userId)
  if (error) return { count: 0, error }
  if (questionIds.length === 0) return { count: 0, error: null }

  // Confirm still-active SBA rows so hub count matches the playable deck.
  const chunkSize = 200
  let active = 0
  for (let i = 0; i < questionIds.length; i += chunkSize) {
    const chunk = questionIds.slice(i, i + chunkSize)
    const { data, error: qErr } = await supabase
      .from('questions')
      .select('id')
      .in('id', chunk)
      .eq('is_active', true)
      .eq('question_type', 'sba')
    if (qErr) return { count: 0, error: qErr.message }
    active += ((data as Array<{ id: string }> | null) ?? []).length
  }
  return { count: active, error: null }
}

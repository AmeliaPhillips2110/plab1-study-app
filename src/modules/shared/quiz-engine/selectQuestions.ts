import { supabase } from '@/lib/supabase'
import { shuffleInPlace } from '@/modules/shared/quiz-engine/scoring'
import type { AttemptResult, QuestionWithOptions, WeaknessVariant } from '@/types/database'
import type { SessionSetupConfig } from '@/types/quiz'

type AttemptRow = {
  question_id: string
  result: AttemptResult
  answered_at: string
}

function asQuestions(data: unknown): QuestionWithOptions[] {
  return ((data as QuestionWithOptions[] | null) ?? []).map(normaliseOptions)
}

export async function selectQuestionsForSession(
  config: SessionSetupConfig,
  userId: string,
): Promise<{ questions: QuestionWithOptions[]; error: string | null }> {
  const limit = Math.min(Math.max(config.questionLimit ?? 10, 1), 50)

  if (config.sessionType === 'spaced_repetition') {
    return selectSpacedRepetition(config.examId, userId, limit, config.presentationFormat)
  }

  if (config.sessionType === 'weakness') {
    return selectWeakness(
      config.examId,
      userId,
      config.weaknessVariant ?? 'recent_mistakes',
      limit,
      config.presentationFormat,
    )
  }

  let query = supabase
    .from('questions')
    .select('*, question_options(*)')
    .eq('exam_id', config.examId)
    .eq('is_active', true)

  if (config.sessionType === 'topic') {
    if (!config.topicId) {
      return { questions: [], error: 'Choose a topic for topic practice.' }
    }
    query = query.eq('topic_id', config.topicId)
  }

  if (config.sessionType === 'flashcard' || config.presentationFormat === 'flashcard') {
    // Prefer native flashcards; fall back to SBA bank if none seeded yet.
    const flash = await supabase
      .from('questions')
      .select('*, question_options(*)')
      .eq('exam_id', config.examId)
      .eq('is_active', true)
      .eq('question_type', 'flashcard')
      .limit(200)
    const flashRows = asQuestions(flash.data)
    if (flashRows.length > 0) {
      let pool = flashRows
      if (config.sessionType === 'topic' && config.topicId) {
        pool = pool.filter((q) => q.topic_id === config.topicId)
      }
      if (config.unseenOnly) {
        pool = await filterUnseen(pool, userId)
      }
      return { questions: shuffleInPlace(pool).slice(0, limit), error: null }
    }
  }

  if (config.sessionType === 'flashcard') {
    query = query.in('question_type', ['sba', 'flashcard'])
  } else if (config.presentationFormat !== 'flashcard') {
    query = query.eq('question_type', 'sba')
  }

  const { data, error } = await query.limit(300)
  if (error) return { questions: [], error: error.message }

  let pool = asQuestions(data)

  if (config.unseenOnly) {
    pool = await filterUnseen(pool, userId)
  }

  if (pool.length === 0) {
    return { questions: [], error: 'No questions matched these filters.' }
  }

  return { questions: shuffleInPlace(pool).slice(0, limit), error: null }
}

async function selectSpacedRepetition(
  examId: string,
  userId: string,
  limit: number,
  format: SessionSetupConfig['presentationFormat'],
) {
  const now = new Date().toISOString()
  const { data: dueRows, error: dueErr } = await supabase
    .from('spaced_repetition_state')
    .select('question_id, due_at')
    .eq('exam_id', examId)
    .eq('user_id', userId)
    .lte('due_at', now)
    .order('due_at', { ascending: true })
    .limit(limit)

  if (dueErr) return { questions: [], error: dueErr.message }

  let questionIds = ((dueRows as { question_id: string }[] | null) ?? []).map((r) => r.question_id)

  // Cold start: seed from active bank questions the user has not mastered.
  if (questionIds.length === 0) {
    let q = supabase
      .from('questions')
      .select('id')
      .eq('exam_id', examId)
      .eq('is_active', true)
      .limit(limit)
    if (format === 'flashcard') {
      // include SBA fallback
    } else {
      q = q.eq('question_type', 'sba')
    }
    const { data: fresh, error } = await q
    if (error) return { questions: [], error: error.message }
    questionIds = ((fresh as { id: string }[] | null) ?? []).map((r) => r.id)
  }

  if (questionIds.length === 0) {
    return { questions: [], error: 'No spaced-repetition items due yet.' }
  }

  const { data, error } = await supabase
    .from('questions')
    .select('*, question_options(*)')
    .in('id', questionIds)
    .eq('is_active', true)

  if (error) return { questions: [], error: error.message }
  const loaded = asQuestions(data)
  const map = new Map(loaded.map((q) => [q.id, q]))
  const ordered = questionIds.map((id) => map.get(id)).filter(Boolean) as QuestionWithOptions[]
  return { questions: ordered.slice(0, limit), error: null }
}

async function selectWeakness(
  examId: string,
  userId: string,
  variant: WeaknessVariant,
  limit: number,
  format: SessionSetupConfig['presentationFormat'],
) {
  const { data: attempts, error } = await supabase
    .from('attempts')
    .select('question_id, result, answered_at')
    .eq('exam_id', examId)
    .eq('user_id', userId)
    .order('answered_at', { ascending: false })
    .limit(500)

  if (error) return { questions: [], error: error.message }
  const rows = (attempts as AttemptRow[] | null) ?? []

  if (rows.length === 0) {
    // No history yet — fall back to random SBA so the mode is usable on day one.
    return selectQuestionsForSession(
      {
        examId,
        sessionType: 'random',
        presentationFormat: format,
        questionLimit: limit,
      },
      userId,
    )
  }

  let questionIds: string[] = []

  if (variant === 'recent_mistakes') {
    const seen = new Set<string>()
    for (const row of rows) {
      if (row.result === 'incorrect' && !seen.has(row.question_id)) {
        seen.add(row.question_id)
        questionIds.push(row.question_id)
      }
      if (questionIds.length >= limit) break
    }
  } else if (variant === 'most_missed') {
    const stats = new Map<string, { wrong: number; total: number }>()
    for (const row of rows) {
      const s = stats.get(row.question_id) ?? { wrong: 0, total: 0 }
      s.total += 1
      if (row.result === 'incorrect') s.wrong += 1
      stats.set(row.question_id, s)
    }
    questionIds = [...stats.entries()]
      .filter(([, s]) => s.wrong > 0)
      .sort((a, b) => b[1].wrong / b[1].total - a[1].wrong / a[1].total)
      .map(([id]) => id)
      .slice(0, limit)
  } else if (variant === 'by_topic' || variant === 'by_tag') {
    // Load question metadata for attempted IDs, rank by miss rate, then pull more from weak topics/tags.
    const attemptedIds = [...new Set(rows.map((r) => r.question_id))]
    const { data: qs, error: qErr } = await supabase
      .from('questions')
      .select('id, topic_id, question_tags(tag_id)')
      .eq('exam_id', examId)
      .in('id', attemptedIds)
    if (qErr) return { questions: [], error: qErr.message }

    type QMeta = {
      id: string
      topic_id: string | null
      question_tags?: { tag_id: string }[] | null
    }
    const metas = (qs as unknown as QMeta[] | null) ?? []
    const missByKey = new Map<string, { wrong: number; total: number }>()
    const resultByQ = new Map<string, AttemptRow[]>()
    for (const row of rows) {
      const list = resultByQ.get(row.question_id) ?? []
      list.push(row)
      resultByQ.set(row.question_id, list)
    }

    for (const meta of metas) {
      const aList = resultByQ.get(meta.id) ?? []
      const wrong = aList.filter((a) => a.result === 'incorrect').length
      const total = aList.length
      const keys =
        variant === 'by_topic'
          ? [meta.topic_id ?? 'none']
          : (meta.question_tags ?? []).map((t) => t.tag_id)
      const useKeys = keys.length > 0 ? keys : ['none']
      for (const key of useKeys) {
        const s = missByKey.get(key) ?? { wrong: 0, total: 0 }
        s.wrong += wrong
        s.total += total
        missByKey.set(key, s)
      }
    }

    const weakKeys = [...missByKey.entries()]
      .filter(([, s]) => s.total > 0)
      .sort((a, b) => b[1].wrong / b[1].total - a[1].wrong / a[1].total)
      .map(([k]) => k)
      .slice(0, 3)

    let poolQuery = supabase
      .from('questions')
      .select('*, question_options(*)')
      .eq('exam_id', examId)
      .eq('is_active', true)
      .eq('question_type', format === 'flashcard' ? 'flashcard' : 'sba')
      .limit(200)

    if (variant === 'by_topic') {
      const topicIds = weakKeys.filter((k) => k !== 'none')
      if (topicIds.length === 0) {
        return selectQuestionsForSession(
          { examId, sessionType: 'random', presentationFormat: format, questionLimit: limit },
          userId,
        )
      }
      poolQuery = poolQuery.in('topic_id', topicIds)
    }

    const { data: poolData, error: poolErr } = await poolQuery
    if (poolErr) return { questions: [], error: poolErr.message }
    let pool = asQuestions(poolData)

    if (variant === 'by_tag') {
      const tagIds = weakKeys.filter((k) => k !== 'none')
      if (tagIds.length > 0) {
        const { data: tagged } = await supabase
          .from('question_tags')
          .select('question_id')
          .in('tag_id', tagIds)
        const allowed = new Set(((tagged as { question_id: string }[] | null) ?? []).map((t) => t.question_id))
        pool = pool.filter((q) => allowed.has(q.id))
      }
    }

    if (pool.length === 0) {
      return selectQuestionsForSession(
        { examId, sessionType: 'random', presentationFormat: format, questionLimit: limit },
        userId,
      )
    }
    return { questions: shuffleInPlace(pool).slice(0, limit), error: null }
  }

  if (questionIds.length === 0) {
    return selectQuestionsForSession(
      { examId, sessionType: 'random', presentationFormat: format, questionLimit: limit },
      userId,
    )
  }

  const { data, error: loadErr } = await supabase
    .from('questions')
    .select('*, question_options(*)')
    .in('id', questionIds)
    .eq('is_active', true)
  if (loadErr) return { questions: [], error: loadErr.message }

  const loaded = asQuestions(data)
  const map = new Map(loaded.map((q) => [q.id, q]))
  const ordered = questionIds.map((id) => map.get(id)).filter(Boolean) as QuestionWithOptions[]
  return { questions: ordered.slice(0, limit), error: null }
}

async function filterUnseen(pool: QuestionWithOptions[], userId: string) {
  const ids = pool.map((q) => q.id)
  if (ids.length === 0) return pool
  const { data } = await supabase
    .from('attempts')
    .select('question_id')
    .eq('user_id', userId)
    .in('question_id', ids)
  const seen = new Set(((data as { question_id: string }[] | null) ?? []).map((r) => r.question_id))
  return pool.filter((q) => !seen.has(q.id))
}

function normaliseOptions(q: QuestionWithOptions): QuestionWithOptions {
  const opts = [...(q.question_options ?? [])].sort((a, b) => a.sort_order - b.sort_order)
  return { ...q, question_options: opts }
}

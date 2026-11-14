import { countWords } from '@/features/glossary/glossaryApi'
import { fetchGuidelineHotspotQuestions } from '@/features/guidelines/hotspots'
import { selectMissFlashcardQuestions } from '@/features/mistakes/missFlashcards'
import {
  fetchQuestionIdsForTagSlugs,
  LONG_STEM_MIN_WORDS,
  PATIENT_CENTRED_TAG,
  UK_PRACTICE_TAG,
} from '@/features/tags/tagsApi'
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
  // Open / new-questions modes are effectively unlimited (bank-sized).
  const maxLimit = config.openEnded || config.unseenOnly ? 10_000 : 50
  const limit = Math.min(Math.max(config.questionLimit ?? 10, 1), maxLimit)

  if (config.dailyQueue) {
    return selectDailyQueue(config.examId, userId, limit)
  }

  if (config.missFlashcardsOnly) {
    return selectMissFlashcardQuestions(config.examId, userId, limit)
  }

  if (config.guidelineHotspotsOnly) {
    return selectGuidelineHotspots(config.examId, limit)
  }

  if (config.sessionType === 'spaced_repetition') {
    return selectSpacedRepetition(config.examId, userId, limit)
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

  if (config.flaggedOnly) {
    return selectFlaggedQuestions(config.examId, userId, limit)
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
      const filteredFlash = await applyStageFFilters(pool, config)
      if (filteredFlash.error) return { questions: [], error: filteredFlash.error }
      pool = filteredFlash.questions
      if (pool.length === 0) {
        return { questions: [], error: 'No questions matched these filters.' }
      }
      return { questions: shuffleInPlace(pool).slice(0, limit), error: null }
    }
  }

  if (config.sessionType === 'flashcard') {
    query = query.in('question_type', ['sba', 'flashcard'])
  } else if (config.presentationFormat !== 'flashcard') {
    query = query.eq('question_type', 'sba')
  }

  if (config.ukPracticeOnly) {
    query = query.eq('is_uk_practice', true)
  }

  // Unseen / open modes need the full bank so filtering “never answered” is accurate.
  const fetchCap = config.unseenOnly || config.openEnded ? 10_000 : 300
  const { data, error } = await query.limit(fetchCap)
  if (error) return { questions: [], error: error.message }

  let pool = asQuestions(data)

  if (config.unseenOnly) {
    pool = await filterUnseen(pool, userId)
  }

  const filtered = await applyStageFFilters(pool, config)
  if (filtered.error) return { questions: [], error: filtered.error }
  pool = filtered.questions

  if (pool.length === 0) {
    return {
      questions: [],
      error: config.unseenOnly
        ? 'No new questions left — every available item has already been answered.'
        : 'No questions matched these filters.',
    }
  }

  return { questions: shuffleInPlace(pool).slice(0, limit), error: null }
}

async function selectGuidelineHotspots(examId: string, limit: number) {
  const { questions, error } = await fetchGuidelineHotspotQuestions(examId, 10_000)
  if (error) return { questions: [], error }
  if (questions.length === 0) {
    return {
      questions: [],
      error:
        'No guideline hotspots in the bank yet — mark is_uk_practice, tag uk-practice, or add NICE/BNF refs.',
    }
  }
  return { questions: shuffleInPlace([...questions]).slice(0, limit), error: null }
}

/** Questions the user flagged in Practice or Tests (latest flag wins). */
async function selectFlaggedQuestions(examId: string, userId: string, limit: number) {
  const { data: attempts, error } = await supabase
    .from('attempts')
    .select('question_id, response_payload, answered_at')
    .eq('exam_id', examId)
    .eq('user_id', userId)
    .order('answered_at', { ascending: false })
    .limit(3000)

  if (error) return { questions: [], error: error.message }

  const flaggedIds: string[] = []
  const seen = new Set<string>()
  for (const row of (attempts as Array<{
    question_id: string
    response_payload: Record<string, unknown> | null
  }> | null) ?? []) {
    if (seen.has(row.question_id)) continue
    seen.add(row.question_id)
    if (row.response_payload?.flagged === true) flaggedIds.push(row.question_id)
  }

  if (flaggedIds.length === 0) {
    return {
      questions: [],
      error: 'No flagged questions yet — flag items during Practice or Tests first.',
    }
  }

  const take = shuffleInPlace([...flaggedIds]).slice(0, limit)
  const { data, error: qErr } = await supabase
    .from('questions')
    .select('*, question_options(*)')
    .in('id', take)
    .eq('is_active', true)

  if (qErr) return { questions: [], error: qErr.message }
  return { questions: shuffleInPlace(asQuestions(data)).slice(0, limit), error: null }
}

/**
 * Daily Questions: due SR cards (overdue from missed days included) + recent mistakes.
 * Target mix ≈ 70% due reviews / 30% fresh mistakes.
 */
async function selectDailyQueue(examId: string, userId: string, limit: number) {
  const nowIso = new Date().toISOString()
  const dueTarget = Math.max(1, Math.round(limit * 0.7))
  const mistakeTarget = Math.max(0, limit - dueTarget)

  const { data: dueRows, error: dueErr } = await supabase
    .from('spaced_repetition_state')
    .select('question_id, due_at')
    .eq('exam_id', examId)
    .eq('user_id', userId)
    .lte('due_at', nowIso)
    .order('due_at', { ascending: true })
    .limit(Math.max(dueTarget * 2, 40))

  if (dueErr) return { questions: [], error: dueErr.message }

  const dueIds = ((dueRows as Array<{ question_id: string }> | null) ?? []).map((r) => r.question_id)
  const selectedDue = dueIds.slice(0, dueTarget)
  const selectedSet = new Set(selectedDue)

  // Recent mistakes not already in the due set
  const { data: attempts, error: attErr } = await supabase
    .from('attempts')
    .select('question_id, result, answered_at')
    .eq('exam_id', examId)
    .eq('user_id', userId)
    .in('result', ['incorrect', 'partial'])
    .order('answered_at', { ascending: false })
    .limit(200)

  if (attErr) return { questions: [], error: attErr.message }

  const mistakeIds: string[] = []
  for (const row of (attempts as AttemptRow[] | null) ?? []) {
    if (selectedSet.has(row.question_id) || mistakeIds.includes(row.question_id)) continue
    mistakeIds.push(row.question_id)
    if (mistakeIds.length >= mistakeTarget) break
  }

  // If due queue is short, fill remaining with more mistakes / older due leftovers
  const combined = [...selectedDue, ...mistakeIds]
  if (combined.length < limit) {
    for (const id of dueIds) {
      if (combined.includes(id)) continue
      combined.push(id)
      if (combined.length >= limit) break
    }
  }
  if (combined.length < limit) {
    for (const row of (attempts as AttemptRow[] | null) ?? []) {
      if (combined.includes(row.question_id)) continue
      combined.push(row.question_id)
      if (combined.length >= limit) break
    }
  }

  if (combined.length === 0) {
    // Bootstrap: fall back to classic spaced-review eligibility
    return selectSpacedRepetition(examId, userId, limit)
  }

  const take = combined.slice(0, limit)
  const { data, error } = await supabase
    .from('questions')
    .select('*, question_options(*)')
    .in('id', take)
    .eq('is_active', true)
    .eq('question_type', 'sba')

  if (error) return { questions: [], error: error.message }
  const loaded = asQuestions(data)
  // Preserve due-first order roughly
  const byId = new Map(loaded.map((q) => [q.id, q]))
  const ordered = take.map((id) => byId.get(id)).filter(Boolean) as QuestionWithOptions[]
  return { questions: ordered.slice(0, limit), error: null }
}

/**
 * Spaced Review: only items previously wrong, or wrong before and correct
 * fewer than 3 times since the last incorrect attempt.
 */
async function selectSpacedRepetition(examId: string, userId: string, limit: number) {
  const { data: attempts, error: attErr } = await supabase
    .from('attempts')
    .select('question_id, result, answered_at')
    .eq('exam_id', examId)
    .eq('user_id', userId)
    .order('answered_at', { ascending: true })
    .limit(2000)

  if (attErr) return { questions: [], error: attErr.message }
  const rows = (attempts as AttemptRow[] | null) ?? []

  const byQ = new Map<string, AttemptRow[]>()
  for (const row of rows) {
    const list = byQ.get(row.question_id) ?? []
    list.push(row)
    byQ.set(row.question_id, list)
  }

  const eligibleIds: string[] = []
  for (const [qid, history] of byQ) {
    const lastWrongIdx = [...history].map((h) => h.result).lastIndexOf('incorrect')
    const lastPartialIdx = [...history].map((h) => h.result).lastIndexOf('partial')
    const wrongIdx = Math.max(lastWrongIdx, lastPartialIdx)
    if (wrongIdx < 0) continue
    const sinceWrong = history.slice(wrongIdx + 1)
    const correctsSince = sinceWrong.filter((h) => h.result === 'correct').length
    if (correctsSince < 3) eligibleIds.push(qid)
  }

  if (eligibleIds.length === 0) {
    return {
      questions: [],
      error: 'No spaced-review items yet — miss a question in practice first.',
    }
  }

  const take = shuffleInPlace([...eligibleIds]).slice(0, limit)
  const { data, error } = await supabase
    .from('questions')
    .select('*, question_options(*)')
    .in('id', take)
    .eq('is_active', true)

  if (error) return { questions: [], error: error.message }
  const loaded = asQuestions(data)
  return { questions: shuffleInPlace(loaded).slice(0, limit), error: null }
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

/** Unseen = never answered by this user (any result including skipped). */
async function filterUnseen(pool: QuestionWithOptions[], userId: string) {
  const ids = pool.map((q) => q.id)
  if (ids.length === 0) return pool
  const seen = new Set<string>()
  // Chunk .in() to avoid URL/body limits on large banks.
  const chunkSize = 200
  for (let i = 0; i < ids.length; i += chunkSize) {
    const chunk = ids.slice(i, i + chunkSize)
    const { data } = await supabase
      .from('attempts')
      .select('question_id')
      .eq('user_id', userId)
      .in('question_id', chunk)
    for (const row of (data as { question_id: string }[] | null) ?? []) {
      seen.add(row.question_id)
    }
  }
  return pool.filter((q) => !seen.has(q.id))
}

function normaliseOptions(q: QuestionWithOptions): QuestionWithOptions {
  const opts = [...(q.question_options ?? [])].sort((a, b) => a.sort_order - b.sort_order)
  return { ...q, question_options: opts }
}

async function applyStageFFilters(
  pool: QuestionWithOptions[],
  config: SessionSetupConfig,
): Promise<{ questions: QuestionWithOptions[]; error: string | null }> {
  let next = pool

  if (config.ukPracticeOnly) {
    // Prefer column; also include questions tagged uk-practice if the flag was unset.
    const tagged = await fetchQuestionIdsForTagSlugs(config.examId, [UK_PRACTICE_TAG])
    if (tagged.error) return { questions: [], error: tagged.error }
    next = next.filter((q) => q.is_uk_practice || tagged.questionIds.has(q.id))
  }

  if (config.patientCentredOnly) {
    const tagged = await fetchQuestionIdsForTagSlugs(config.examId, [PATIENT_CENTRED_TAG])
    if (tagged.error) return { questions: [], error: tagged.error }
    if (tagged.questionIds.size === 0) {
      return { questions: [], error: 'No patient-centred tagged questions yet. Re-run Stage f seed.' }
    }
    next = next.filter((q) => tagged.questionIds.has(q.id))
  }

  if (config.longStemOnly) {
    const minWords = config.minStemWords ?? LONG_STEM_MIN_WORDS
    next = next.filter((q) => countWords(q.stem) >= minWords)
  }

  return { questions: next, error: null }
}

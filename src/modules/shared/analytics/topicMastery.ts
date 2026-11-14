import type { AttemptLogRow } from '@/modules/shared/analytics/attemptQueries'
import type { Topic } from '@/types/database'

/** Ready / close / weak — derived from coverage + accuracy vs pass mark. */
export type MasteryStatus = 'ready' | 'close' | 'weak'

export type TopicMastery = {
  topicId: string
  topic: string
  status: MasteryStatus
  /** Latest-graded accuracy 0–100, or null when nothing graded. */
  accuracy: number | null
  /** Unique SBA questions attempted / bank size, 0–1. */
  coverage: number
  bank: number
  uniqueAttempted: number
  correct: number
  incorrect: number
  graded: number
  /** 0–100 ring fill: blend of accuracy + coverage, or coverage alone when ungraded. */
  ringPercent: number
}

export const MASTERY_STATUS_LABELS: Record<MasteryStatus, string> = {
  ready: 'Ready',
  close: 'Close',
  weak: 'Weak',
}

/** Teal brand for ready; amber for close; muted red for weak. */
export const MASTERY_STATUS_COLORS: Record<MasteryStatus, string> = {
  ready: '#337d8a',
  close: '#c47a3a',
  weak: '#b54a4a',
}

/** Track / empty arc under the fill. */
export const MASTERY_RING_TRACK = '#d4d4d4'

/** Minimum share of the topic bank seen before accuracy alone can mark Ready. */
export const READY_COVERAGE = 0.35

/** Accuracy band below pass mark that still counts as Close (percentage points). */
export const CLOSE_BAND = 10

function isQuizAttempt(a: AttemptLogRow): boolean {
  const st = a.study_sessions?.session_type
  const fmt = a.study_sessions?.presentation_format
  if (st === 'flashcard' || fmt === 'flashcard') return false
  if (a.questions?.question_type === 'flashcard') return false
  return true
}

/**
 * Classify coverage + accuracy against the exam pass mark (default 65%).
 *
 * - Ready: accuracy ≥ pass mark and coverage ≥ READY_COVERAGE
 * - Close: accuracy within CLOSE_BAND of pass, or pass-level accuracy with thin coverage
 * - Weak: everything else (including untouched topics)
 */
export function classifyMasteryStatus(params: {
  accuracy: number | null
  coverage: number
  passMarkPercent: number
}): MasteryStatus {
  const pass = params.passMarkPercent
  const closeFloor = Math.max(0, pass - CLOSE_BAND)
  const acc = params.accuracy
  const cov = params.coverage

  if (acc == null) return 'weak'

  if (acc >= pass && cov >= READY_COVERAGE) return 'ready'

  if (acc >= pass && cov < READY_COVERAGE) return 'close'
  if (acc >= closeFloor && acc < pass) return 'close'

  return 'weak'
}

/** Ring fill blends accuracy with coverage so thin banks do not look fully ready. */
export function masteryRingPercent(accuracy: number | null, coverage: number): number {
  const covPct = Math.round(Math.min(1, Math.max(0, coverage)) * 100)
  if (accuracy == null) return Math.min(covPct, 12)
  const blended = Math.round(accuracy * 0.65 + covPct * 0.35)
  return Math.min(100, Math.max(0, blended))
}

/**
 * Per-topic mastery from latest quiz/mock result per question + bank sizes.
 * No new schema — reuses attempt log + questions.topic_id counts.
 */
export function computeTopicMastery(params: {
  attempts: AttemptLogRow[]
  topics: Topic[]
  bankByTopic: Record<string, number>
  passMarkPercent?: number
}): TopicMastery[] {
  const passMark = params.passMarkPercent ?? 65
  const quiz = params.attempts.filter(isQuizAttempt)

  // Latest attempt per question (rows are usually newest-first; still sort).
  const byQuestion = new Map<string, AttemptLogRow>()
  const sorted = [...quiz].sort(
    (a, b) => new Date(b.answered_at).getTime() - new Date(a.answered_at).getTime(),
  )
  for (const a of sorted) {
    if (!byQuestion.has(a.question_id)) byQuestion.set(a.question_id, a)
  }

  const stats = new Map<
    string,
    { correct: number; incorrect: number; attempted: Set<string>; name: string }
  >()
  for (const t of params.topics) {
    stats.set(t.id, { correct: 0, incorrect: 0, attempted: new Set(), name: t.name })
  }

  for (const a of byQuestion.values()) {
    const tid = a.questions?.topic_id ?? a.topics?.id
    if (!tid) continue
    const row = stats.get(tid) ?? {
      correct: 0,
      incorrect: 0,
      attempted: new Set<string>(),
      name: a.topics?.name ?? 'Unknown',
    }
    row.attempted.add(a.question_id)
    if (a.result === 'correct') row.correct += 1
    else if (a.result === 'incorrect' || a.result === 'partial') row.incorrect += 1
    stats.set(tid, row)
  }

  return params.topics.map((t) => {
    const row = stats.get(t.id)!
    const bank = params.bankByTopic[t.id] ?? 0
    const uniqueAttempted = row.attempted.size
    const coverage = bank > 0 ? uniqueAttempted / bank : 0
    const graded = row.correct + row.incorrect
    const accuracy = graded > 0 ? Math.round((row.correct / graded) * 1000) / 10 : null
    const status = classifyMasteryStatus({ accuracy, coverage, passMarkPercent: passMark })
    return {
      topicId: t.id,
      topic: t.name,
      status,
      accuracy,
      coverage,
      bank,
      uniqueAttempted,
      correct: row.correct,
      incorrect: row.incorrect,
      graded,
      ringPercent: masteryRingPercent(accuracy, coverage),
    }
  })
}

export function masteryPracticeHref(topicId: string, limit = 15): string {
  const q = new URLSearchParams({
    topicId,
    limit: String(limit),
    autostart: '1',
  })
  return `/study/topics?${q.toString()}`
}

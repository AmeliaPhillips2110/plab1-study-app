import {
  computeTopicAccuracy,
  computeWeaknesses,
  type TopicAccuracy,
  type WeaknessItem,
} from '@/modules/shared/analytics/kpiMetrics'
import type { AttemptLogRow } from '@/modules/shared/analytics/attemptQueries'
import type { Topic } from '@/types/database'

export type StudySuggestionKind =
  | 'topic_weakness'
  | 'topic_coverage'
  | 'error_tests'
  | 'most_missed'
  | 'new_questions'
  | 'open_quiz'
  | 'daily_questions'

export type StudySuggestion = {
  id: string
  kind: StudySuggestionKind
  title: string
  reason: string
  href: string
  modeLabel: string
  questionLimit: number
  topicId: string | null
  /** Higher = more urgent. */
  score: number
}

export type StudyPlan = {
  suggestions: StudySuggestion[]
  today: {
    primary: StudySuggestion | null
    secondary: StudySuggestion[]
  }
  isEmptyState: boolean
}

const PASS_MARK = 65
const DEFAULT_TOPIC_LIMIT = 15
const DEFAULT_MODE_LIMIT = 20
const MIN_ATTEMPTS_FOR_WEAKNESS = 2

function topicHref(topicId: string, limit = DEFAULT_TOPIC_LIMIT): string {
  const params = new URLSearchParams({
    topicId,
    limit: String(limit),
    autostart: '1',
  })
  return `/study/topics?${params.toString()}`
}

function clampLimit(n: number, fallback: number): number {
  if (!Number.isFinite(n)) return fallback
  return Math.min(40, Math.max(5, Math.round(n)))
}

function accuracyReason(item: WeaknessItem | TopicAccuracy): string {
  const graded = item.correct + item.incorrect
  return `${item.accuracy}% accuracy · ${graded} graded`
}

function coverageReason(attempted: number, bank: number): string {
  if (attempted === 0) {
    return bank > 0 ? `Not started · ${bank} in bank` : 'Not started yet'
  }
  if (bank > 0) {
    const pct = Math.round((attempted / bank) * 100)
    return `${pct}% coverage · ${attempted}/${bank} seen`
  }
  return `Only ${attempted} attempts so far`
}

function modeSuggestion(
  kind: Extract<
    StudySuggestionKind,
    'error_tests' | 'most_missed' | 'new_questions' | 'open_quiz' | 'daily_questions'
  >,
  score: number,
  reason: string,
): StudySuggestion {
  const map = {
    error_tests: {
      title: 'Error Tests',
      href: '/study/error-tests',
      modeLabel: 'Recent mistakes · 20 Qs',
      questionLimit: DEFAULT_MODE_LIMIT,
    },
    most_missed: {
      title: 'Most Missed',
      href: '/study/most-missed',
      modeLabel: 'Weakness drill · 20 Qs',
      questionLimit: DEFAULT_MODE_LIMIT,
    },
    new_questions: {
      title: 'New Questions',
      href: '/study/new-questions',
      modeLabel: 'Unseen SBAs',
      questionLimit: 10_000,
    },
    open_quiz: {
      title: 'Open Quiz',
      href: '/study/open-quiz',
      modeLabel: 'Random mix · 40 Qs',
      questionLimit: 40,
    },
    daily_questions: {
      title: 'Daily Questions',
      href: '/study/daily-questions',
      modeLabel: 'Spaced queue · 30 Qs',
      questionLimit: 30,
    },
  } as const
  const m = map[kind]
  return {
    id: kind,
    kind,
    title: m.title,
    reason,
    href: m.href,
    modeLabel: m.modeLabel,
    questionLimit: m.questionLimit,
    topicId: null,
    score,
  }
}

function topicWeaknessSuggestion(item: WeaknessItem, score: number): StudySuggestion {
  const limit = clampLimit(
    item.incorrect >= 12 ? 20 : item.incorrect >= 6 ? 15 : 10,
    DEFAULT_TOPIC_LIMIT,
  )
  return {
    id: `weak:${item.topicId}`,
    kind: 'topic_weakness',
    title: item.topic,
    reason: accuracyReason(item),
    href: topicHref(item.topicId, limit),
    modeLabel: `Topic quiz · ${limit} Qs`,
    questionLimit: limit,
    topicId: item.topicId,
    score,
  }
}

function topicCoverageSuggestion(
  topic: Topic,
  attempted: number,
  bank: number,
  score: number,
): StudySuggestion {
  const limit = DEFAULT_TOPIC_LIMIT
  return {
    id: `cover:${topic.id}`,
    kind: 'topic_coverage',
    title: topic.name,
    reason: coverageReason(attempted, bank),
    href: topicHref(topic.id, limit),
    modeLabel: `Topic quiz · ${limit} Qs`,
    questionLimit: limit,
    topicId: topic.id,
    score,
  }
}

/**
 * Ranked practice suggestions from KPI topic accuracy + coverage gaps.
 * No new schema — derived from attempts/topics already loaded for KPIs.
 */
export function buildStudyPlan(params: {
  topics: Topic[]
  topicAccuracy: TopicAccuracy[]
  bankByTopic?: Record<string, number>
  incorrectAttemptCount: number
  gradedAttemptCount: number
  passMarkPercent?: number
  limit?: number
}): StudyPlan {
  const passMark = params.passMarkPercent ?? PASS_MARK
  const limit = params.limit ?? 5
  const bankByTopic = params.bankByTopic ?? {}
  const byId = new Map(params.topicAccuracy.map((t) => [t.topicId, t]))

  const candidates: StudySuggestion[] = []

  const weaknesses = computeWeaknesses(params.topicAccuracy, 8)
  for (const w of weaknesses) {
    if (w.accuracy >= passMark && w.incorrect < 3) continue
    const urgency =
      Math.max(0, passMark - w.accuracy) * 2 +
      Math.min(30, w.incorrect) +
      (w.accuracy < 50 ? 12 : 0)
    candidates.push(topicWeaknessSuggestion(w, 100 + urgency))
  }

  // Under-covered specialties (enough bank, few or no attempts).
  const coverageCandidates = [...params.topics]
    .filter((t) => (bankByTopic[t.id] ?? 0) > 0)
    .map((t) => {
      const acc = byId.get(t.id)
      const attempted = acc?.total ?? 0
      const bank = bankByTopic[t.id] ?? 0
      const coverage = bank > 0 ? attempted / bank : 1
      return { topic: t, attempted, bank, coverage }
    })
    .filter((r) => r.attempted < MIN_ATTEMPTS_FOR_WEAKNESS || r.coverage < 0.15)
    .sort((a, b) => a.coverage - b.coverage || b.bank - a.bank || a.topic.sort_order - b.topic.sort_order)

  for (const row of coverageCandidates.slice(0, 4)) {
    const gapScore = (1 - row.coverage) * 40 + Math.min(20, row.bank / 5)
    candidates.push(
      topicCoverageSuggestion(row.topic, row.attempted, row.bank, 70 + gapScore),
    )
  }

  if (params.incorrectAttemptCount >= 3) {
    candidates.push(
      modeSuggestion(
        'error_tests',
        85 + Math.min(20, params.incorrectAttemptCount),
        `${params.incorrectAttemptCount} recent mistakes to revisit`,
      ),
    )
  }
  if (params.incorrectAttemptCount >= 8) {
    candidates.push(
      modeSuggestion('most_missed', 75, 'Questions you miss most often overall'),
    )
  }

  const isEmptyState =
    params.gradedAttemptCount < 5 ||
    (weaknesses.length === 0 && coverageCandidates.every((c) => c.attempted === 0))

  if (isEmptyState || candidates.length < 2) {
    // High-yield-ish fallback: lower sort_order first among banked topics with little practice.
    const fallbackTopics = [...params.topics]
      .filter((t) => (bankByTopic[t.id] ?? 0) > 0)
      .sort((a, b) => a.sort_order - b.sort_order || a.name.localeCompare(b.name))
      .slice(0, 4)

    for (const t of fallbackTopics) {
      const attempted = byId.get(t.id)?.total ?? 0
      const bank = bankByTopic[t.id] ?? 0
      if (candidates.some((c) => c.topicId === t.id)) continue
      candidates.push(
        topicCoverageSuggestion(t, attempted, bank, 55 - t.sort_order * 0.01),
      )
    }
    candidates.push(
      modeSuggestion('new_questions', 60, 'Build coverage with unseen SBAs'),
      modeSuggestion('daily_questions', 58, 'Light daily mix to start a streak'),
      modeSuggestion('open_quiz', 50, 'Random practice when you are not sure where to start'),
    )
  }

  // Dedupe by id, keep highest score.
  const best = new Map<string, StudySuggestion>()
  for (const s of candidates) {
    const prev = best.get(s.id)
    if (!prev || s.score > prev.score) best.set(s.id, s)
  }

  const ranked = [...best.values()].sort((a, b) => b.score - a.score || a.title.localeCompare(b.title))
  const suggestions = ranked.slice(0, limit)
  const primary = suggestions[0] ?? null
  const secondary = suggestions.slice(1, 3)

  return {
    suggestions,
    today: { primary, secondary },
    isEmptyState,
  }
}

/** Convenience: derive plan from a KPI attempt bundle. */
export function buildStudyPlanFromAttempts(params: {
  attempts: AttemptLogRow[]
  topics: Topic[]
  bankByTopic?: Record<string, number>
  passMarkPercent?: number
  limit?: number
}): StudyPlan {
  const topicAccuracy = computeTopicAccuracy(params.attempts, params.topics)
  const incorrectAttemptCount = params.attempts.filter((a) => a.result === 'incorrect').length
  const gradedAttemptCount = params.attempts.filter(
    (a) => a.result === 'correct' || a.result === 'incorrect',
  ).length
  return buildStudyPlan({
    topics: params.topics,
    topicAccuracy,
    bankByTopic: params.bankByTopic,
    incorrectAttemptCount,
    gradedAttemptCount,
    passMarkPercent: params.passMarkPercent,
    limit: params.limit,
  })
}

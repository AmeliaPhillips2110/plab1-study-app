import { countWords } from '@/features/glossary/glossaryApi'
import { MISTAKE_TAG_LABELS } from '@/features/mistakes'
import type { AttemptLogRow } from '@/modules/shared/analytics/attemptQueries'
import type { StudySession, Topic } from '@/types/database'

export type HeadlineKpis = {
  accuracyPercent: number
  attemptCount: number
  gradedCount: number
  correctCount: number
  sessionCount: number
  finishedSessionCount: number
  coveragePercent: number
  uniqueAttempted: number
  bankActive: number
  qpm: number
  activeDays30: number
  latestMockPercent: number | null
}

export type ScorePoint = { date: string; label: string; score: number; sessionType: string }
export type TopicAccuracy = {
  topicId: string
  topic: string
  correct: number
  total: number
  accuracy: number
}
export type MistakeSlice = { tag: string; label: string; count: number }
export type QpmPoint = { date: string; label: string; qpm: number; attempts: number }
export type DayActivity = { date: string; count: number }
export type TopicDayCell = { topic: string; day: string; count: number }
export type WeaknessItem = TopicAccuracy & { focusReason: string }
export type PaceVsStemPoint = {
  words: number
  seconds: number
  result: string
  questionId: string
}
export type PaceVsStemBucket = {
  bucket: string
  avgSeconds: number
  attempts: number
  accuracy: number
}

function dayKey(iso: string): string {
  return iso.slice(0, 10)
}

function weekday(iso: string): string {
  return ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][new Date(iso).getDay()]!
}

export function computeHeadlineKpis(params: {
  attempts: AttemptLogRow[]
  sessions: StudySession[]
  bankActive: number
}): HeadlineKpis {
  const { attempts, sessions, bankActive } = params
  const graded = attempts.filter((a) => a.result === 'correct' || a.result === 'incorrect')
  const correct = graded.filter((a) => a.result === 'correct').length
  const uniqueAttempted = new Set(attempts.map((a) => a.question_id)).size
  const finished = sessions.filter((s) => s.ended_at)
  const totalMs = attempts.reduce((sum, a) => sum + (a.time_spent_ms ?? 0), 0)
  const qpm = totalMs > 0 ? (attempts.length / totalMs) * 60_000 : 0

  const cutoff = Date.now() - 30 * 24 * 60 * 60 * 1000
  const activeDays30 = new Set(
    attempts.filter((a) => new Date(a.answered_at).getTime() >= cutoff).map((a) => dayKey(a.answered_at)),
  ).size

  const mocks = finished
    .filter((s) => s.session_type === 'full_mock' || s.session_type === 'as_many_as_you_can')
    .sort((a, b) => new Date(b.ended_at!).getTime() - new Date(a.ended_at!).getTime())
  const latestMockPercent = mocks[0]?.score_percent != null ? Number(mocks[0].score_percent) : null

  return {
    accuracyPercent: graded.length ? Math.round((correct / graded.length) * 1000) / 10 : 0,
    attemptCount: attempts.length,
    gradedCount: graded.length,
    correctCount: correct,
    sessionCount: sessions.length,
    finishedSessionCount: finished.length,
    coveragePercent: bankActive > 0 ? Math.round((uniqueAttempted / bankActive) * 1000) / 10 : 0,
    uniqueAttempted,
    bankActive,
    qpm: Math.round(qpm * 100) / 100,
    activeDays30,
    latestMockPercent,
  }
}

export function computeScoreTrend(sessions: StudySession[]): ScorePoint[] {
  return sessions
    .filter((s) => s.ended_at && s.score_percent != null)
    .sort((a, b) => new Date(a.ended_at!).getTime() - new Date(b.ended_at!).getTime())
    .map((s) => ({
      date: s.ended_at!,
      label: dayKey(s.ended_at!),
      score: Number(s.score_percent),
      sessionType: s.session_type,
    }))
}

export function computeTopicAccuracy(
  attempts: AttemptLogRow[],
  topics: Topic[],
): TopicAccuracy[] {
  const byTopic = new Map<string, { correct: number; total: number; name: string }>()
  for (const t of topics) {
    byTopic.set(t.id, { correct: 0, total: 0, name: t.name })
  }
  for (const a of attempts) {
    if (a.result !== 'correct' && a.result !== 'incorrect') continue
    const tid = a.questions?.topic_id ?? a.topics?.id
    if (!tid) continue
    const row = byTopic.get(tid) ?? {
      correct: 0,
      total: 0,
      name: a.topics?.name ?? 'Unknown',
    }
    row.total += 1
    if (a.result === 'correct') row.correct += 1
    byTopic.set(tid, row)
  }
  return [...byTopic.entries()]
    .map(([topicId, v]) => ({
      topicId,
      topic: v.name,
      correct: v.correct,
      total: v.total,
      accuracy: v.total ? Math.round((v.correct / v.total) * 1000) / 10 : 0,
    }))
    .filter((r) => r.total > 0)
    .sort((a, b) => a.accuracy - b.accuracy)
}

export function computeMistakeBreakdown(attempts: AttemptLogRow[]): MistakeSlice[] {
  const counts = new Map<string, number>()
  for (const a of attempts) {
    for (const t of a.mistake_tags) {
      counts.set(t.tag, (counts.get(t.tag) ?? 0) + 1)
    }
  }
  return [...counts.entries()]
    .map(([tag, count]) => ({
      tag,
      label: MISTAKE_TAG_LABELS[tag as keyof typeof MISTAKE_TAG_LABELS] ?? tag,
      count,
    }))
    .sort((a, b) => b.count - a.count)
}

export function computeQpmSeries(attempts: AttemptLogRow[]): QpmPoint[] {
  const byDay = new Map<string, { ms: number; n: number }>()
  for (const a of attempts) {
    const d = dayKey(a.answered_at)
    const row = byDay.get(d) ?? { ms: 0, n: 0 }
    row.n += 1
    row.ms += a.time_spent_ms ?? 0
    byDay.set(d, row)
  }
  return [...byDay.entries()]
    .sort(([a], [b]) => a.localeCompare(b))
    .map(([date, v]) => ({
      date,
      label: date.slice(5),
      attempts: v.n,
      qpm: v.ms > 0 ? Math.round((v.n / v.ms) * 60_000 * 100) / 100 : 0,
    }))
}

export function computeCalendarHeatmap(attempts: AttemptLogRow[], days = 84): DayActivity[] {
  const end = new Date()
  end.setHours(0, 0, 0, 0)
  const start = new Date(end)
  start.setDate(start.getDate() - (days - 1))
  const counts = new Map<string, number>()
  for (const a of attempts) {
    const d = dayKey(a.answered_at)
    counts.set(d, (counts.get(d) ?? 0) + 1)
  }
  const out: DayActivity[] = []
  for (let i = 0; i < days; i += 1) {
    const d = new Date(start)
    d.setDate(start.getDate() + i)
    const key = d.toISOString().slice(0, 10)
    out.push({ date: key, count: counts.get(key) ?? 0 })
  }
  return out
}

export function computeTopicWeekdayHeatmap(attempts: AttemptLogRow[]): TopicDayCell[] {
  const map = new Map<string, number>()
  for (const a of attempts) {
    const topic = a.topics?.name ?? 'Untagged'
    const day = weekday(a.answered_at)
    const key = `${topic}||${day}`
    map.set(key, (map.get(key) ?? 0) + 1)
  }
  return [...map.entries()].map(([key, count]) => {
    const [topic, day] = key.split('||')
    return { topic: topic!, day: day!, count }
  })
}

export function computeWeaknesses(topicAccuracy: TopicAccuracy[], limit = 5): WeaknessItem[] {
  return topicAccuracy
    .filter((t) => t.total >= 2)
    .sort((a, b) => a.accuracy - b.accuracy || b.total - a.total)
    .slice(0, limit)
    .map((t) => ({
      ...t,
      focusReason:
        t.accuracy < 50
          ? 'Below 50% accuracy'
          : t.accuracy < 65
            ? 'Below pass-mark style threshold'
            : 'Relatively weaker topic',
    }))
}

export function computePaceVsStem(attempts: AttemptLogRow[]): {
  points: PaceVsStemPoint[]
  buckets: PaceVsStemBucket[]
  languageMistakes: number
  ukPracticeMistakes: number
} {
  const points: PaceVsStemPoint[] = []
  const bucketAcc = new Map<string, { ms: number; n: number; correct: number; graded: number }>()

  let languageMistakes = 0
  let ukPracticeMistakes = 0

  for (const a of attempts) {
    for (const t of a.mistake_tags) {
      if (t.tag === 'language_issue') languageMistakes += 1
      if (t.tag === 'uk_practice_gap' || t.tag === 'guideline_mixup') ukPracticeMistakes += 1
    }

    if (a.time_spent_ms == null || a.time_spent_ms <= 0 || !a.questions?.stem) continue
    const words = countWords(a.questions.stem)
    const seconds = Math.round(a.time_spent_ms / 1000)
    points.push({
      words,
      seconds,
      result: a.result,
      questionId: a.question_id,
    })

    const bucket =
      words < 40 ? '<40 words' : words < 80 ? '40–79 words' : words < 120 ? '80–119 words' : '120+ words'
    const row = bucketAcc.get(bucket) ?? { ms: 0, n: 0, correct: 0, graded: 0 }
    row.ms += a.time_spent_ms
    row.n += 1
    if (a.result === 'correct' || a.result === 'incorrect') {
      row.graded += 1
      if (a.result === 'correct') row.correct += 1
    }
    bucketAcc.set(bucket, row)
  }

  const order = ['<40 words', '40–79 words', '80–119 words', '120+ words']
  const buckets = order
    .filter((b) => bucketAcc.has(b))
    .map((bucket) => {
      const v = bucketAcc.get(bucket)!
      return {
        bucket,
        avgSeconds: v.n ? Math.round(v.ms / v.n / 1000) : 0,
        attempts: v.n,
        accuracy: v.graded ? Math.round((v.correct / v.graded) * 1000) / 10 : 0,
      }
    })

  return { points, buckets, languageMistakes, ukPracticeMistakes }
}

export type CoverageStatus =
  | 'new'
  | 'incorrect'
  | 'correct'
  | 'repeated_correct'
  | 'forgotten'

export const COVERAGE_STATUS_LABELS: Record<CoverageStatus, string> = {
  new: 'New',
  incorrect: 'Incorrect',
  correct: 'Correct',
  repeated_correct: 'Repeated Correct',
  forgotten: 'Forgotten',
}

export const COVERAGE_STATUS_COLORS: Record<CoverageStatus, string> = {
  new: '#a3a3a3',
  incorrect: '#b54a4a',
  correct: '#2f6f6a',
  repeated_correct: '#337d8a',
  forgotten: '#c47a3a',
}

export type CoverageStatusCounts = Record<CoverageStatus, number>

function isQuizAttempt(a: AttemptLogRow): boolean {
  const st = a.study_sessions?.session_type
  const fmt = a.study_sessions?.presentation_format
  if (st === 'flashcard' || fmt === 'flashcard') return false
  if (a.questions?.question_type === 'flashcard') return false
  return true
}

/** Status from last ≤3 quiz answers per question; New = never answered in quiz. */
export function computeCoverageStatuses(
  attempts: AttemptLogRow[],
  bankActive: number,
): CoverageStatusCounts {
  const quiz = attempts.filter(isQuizAttempt)
  const byQ = new Map<string, AttemptLogRow[]>()
  for (const a of quiz) {
    const list = byQ.get(a.question_id) ?? []
    list.push(a)
    byQ.set(a.question_id, list)
  }

  const counts: CoverageStatusCounts = {
    new: Math.max(0, bankActive - byQ.size),
    incorrect: 0,
    correct: 0,
    repeated_correct: 0,
    forgotten: 0,
  }

  for (const [, list] of byQ) {
    const sorted = [...list].sort(
      (a, b) => new Date(a.answered_at).getTime() - new Date(b.answered_at).getTime(),
    )
    const graded = sorted.filter((a) => a.result === 'correct' || a.result === 'incorrect')
    if (graded.length === 0) {
      counts.new += 1
      continue
    }
    const last3 = graded.slice(-3)
    const last = last3[last3.length - 1]!
    const everCorrect = graded.some((a) => a.result === 'correct')
    const threeCorrect =
      last3.length === 3 && last3.every((a) => a.result === 'correct')

    if (threeCorrect) {
      counts.repeated_correct += 1
    } else if (last.result === 'incorrect' && everCorrect && last3.some((a) => a.result === 'correct')) {
      counts.forgotten += 1
    } else if (last.result === 'incorrect') {
      counts.incorrect += 1
    } else {
      counts.correct += 1
    }
  }

  return counts
}

export type ActivitySeriesPoint = {
  date: string
  label: string
  total: number
  errors: number
  percentCorrect: number | null
  [topicKey: string]: string | number | null
}

export function computeActivityOverTime(
  attempts: AttemptLogRow[],
  topics: Topic[],
): { points: ActivitySeriesPoint[]; topicKeys: string[] } {
  const topicNames = topics.map((t) => t.name).slice(0, 8)
  const byDay = new Map<string, { total: number; errors: number; correct: number; graded: number; byTopic: Map<string, number> }>()

  for (const a of attempts) {
    const d = dayKey(a.answered_at)
    const row =
      byDay.get(d) ??
      ({ total: 0, errors: 0, correct: 0, graded: 0, byTopic: new Map() })
    row.total += 1
    if (a.result === 'incorrect') row.errors += 1
    if (a.result === 'correct' || a.result === 'incorrect') {
      row.graded += 1
      if (a.result === 'correct') row.correct += 1
    }
    const topic = a.topics?.name
    if (topic) row.byTopic.set(topic, (row.byTopic.get(topic) ?? 0) + 1)
    byDay.set(d, row)
  }

  const points = [...byDay.entries()]
    .sort(([a], [b]) => a.localeCompare(b))
    .map(([date, v]) => {
      const point: ActivitySeriesPoint = {
        date,
        label: date.slice(5),
        total: v.total,
        errors: v.errors,
        percentCorrect: v.graded ? Math.round((v.correct / v.graded) * 1000) / 10 : null,
      }
      for (const name of topicNames) {
        point[`t:${name}`] = v.byTopic.get(name) ?? 0
      }
      return point
    })

  return { points, topicKeys: topicNames.map((n) => `t:${n}`) }
}

export type HourActivity = { hour: string; total: number; errors: number }
export type DowActivity = { day: string; total: number; errors: number }

export function computeTimeOfDayActivity(attempts: AttemptLogRow[]): HourActivity[] {
  const buckets = Array.from({ length: 24 }, (_, h) => ({
    hour: `${String(h).padStart(2, '0')}:00`,
    total: 0,
    errors: 0,
  }))
  for (const a of attempts) {
    const h = new Date(a.answered_at).getHours()
    buckets[h]!.total += 1
    if (a.result === 'incorrect') buckets[h]!.errors += 1
  }
  return buckets
}

export function computeDayOfWeekActivity(attempts: AttemptLogRow[]): DowActivity[] {
  const order = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
  const map = new Map(order.map((d) => [d, { day: d, total: 0, errors: 0 }]))
  for (const a of attempts) {
    const raw = weekday(a.answered_at)
    const day = raw === 'Sun' ? 'Sun' : raw
    const row = map.get(day)
    if (!row) continue
    row.total += 1
    if (a.result === 'incorrect') row.errors += 1
  }
  return order.map((d) => map.get(d)!)
}

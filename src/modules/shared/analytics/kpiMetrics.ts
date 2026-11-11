import type { AttemptLogRow } from '@/modules/shared/analytics/attemptQueries'
import type { StudySession, Topic } from '@/types/database'
import { MISTAKE_TAG_LABELS } from '@/features/mistakes'

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

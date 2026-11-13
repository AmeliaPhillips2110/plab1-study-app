/** Consecutive calendar days ending on the latest activity day (or today if active today). */
export function computeStudyStreak(answeredAtIsos: string[], now = new Date()): number {
  if (answeredAtIsos.length === 0) return 0

  const days = new Set(answeredAtIsos.map((iso) => iso.slice(0, 10)))
  const today = toDayKey(now)
  const yesterday = toDayKey(new Date(now.getTime() - 86_400_000))

  // Streak must include today or yesterday (grace if not yet studied today)
  let cursor = days.has(today) ? today : days.has(yesterday) ? yesterday : null
  if (!cursor) return 0

  let streak = 0
  while (days.has(cursor)) {
    streak += 1
    cursor = prevDayKey(cursor)
  }
  return streak
}

function toDayKey(d: Date): string {
  return d.toISOString().slice(0, 10)
}

function prevDayKey(dayKey: string): string {
  const d = new Date(`${dayKey}T12:00:00.000Z`)
  d.setUTCDate(d.getUTCDate() - 1)
  return d.toISOString().slice(0, 10)
}

/** Next upcoming 11 February from `from` (defaults to now). */
export function nextExamDate(from: Date = new Date()): Date {
  const year = from.getFullYear()
  const candidate = new Date(year, 1, 11, 0, 0, 0, 0) // 11 Feb local
  if (candidate.getTime() > from.getTime()) return candidate
  return new Date(year + 1, 1, 11, 0, 0, 0, 0)
}

export type CountdownParts = {
  target: Date
  totalMs: number
  days: number
  hours: number
  minutes: number
  seconds: number
  past: boolean
}

export function countdownTo(target: Date, now: Date = new Date()): CountdownParts {
  const totalMs = target.getTime() - now.getTime()
  if (totalMs <= 0) {
    return { target, totalMs: 0, days: 0, hours: 0, minutes: 0, seconds: 0, past: true }
  }
  const seconds = Math.floor(totalMs / 1000)
  const days = Math.floor(seconds / 86400)
  const hours = Math.floor((seconds % 86400) / 3600)
  const minutes = Math.floor((seconds % 3600) / 60)
  const secs = seconds % 60
  return { target, totalMs, days, hours, minutes, seconds: secs, past: false }
}

/** Pass-band colour stops for % correct gradient fill. */
export function accuracyBandColor(percent: number | null): string {
  if (percent == null) return '#a3a3a3'
  if (percent > 65) return '#2f6f6a' // green
  if (percent >= 50) return '#c4a035' // yellow
  if (percent >= 40) return '#c47a3a' // orange
  return '#b54a4a' // red
}

export function accuracyGradient(percent: number | null): string {
  if (percent == null) {
    return 'linear-gradient(90deg, #e5e5e5 0%, #d4d4d4 100%)'
  }
  const color = accuracyBandColor(percent)
  const soft =
    percent > 65
      ? '#7eb8a8'
      : percent >= 50
        ? '#e4d28a'
        : percent >= 40
          ? '#e0b07a'
          : '#d48a8a'
  return `linear-gradient(90deg, ${soft} 0%, ${color} 100%)`
}

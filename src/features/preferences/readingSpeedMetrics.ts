import { countWords } from '@/features/glossary/glossaryApi'
import type { AttemptLogRow } from '@/modules/shared/analytics/attemptQueries'

export type ReadingSpeedPoint = {
  date: string
  label: string
  wpm: number
  attempts: number
}

function dayKey(iso: string): string {
  return iso.slice(0, 10)
}

/** Per-attempt WPM from stem words ÷ time spent (minutes). */
export function attemptWpm(a: AttemptLogRow): number | null {
  if (a.time_spent_ms == null || a.time_spent_ms <= 0) return null
  const stem = a.questions?.stem
  if (!stem) return null
  const words = countWords(stem)
  if (words <= 0) return null
  const minutes = a.time_spent_ms / 60_000
  if (minutes <= 0) return null
  const wpm = words / minutes
  if (!Number.isFinite(wpm) || wpm < 40 || wpm > 800) return null
  return Math.round(wpm)
}

/** Overall reading speed from timed attempts with stems. */
export function computeOverallReadingWpm(attempts: AttemptLogRow[]): number | null {
  let words = 0
  let ms = 0
  for (const a of attempts) {
    if (a.time_spent_ms == null || a.time_spent_ms <= 0 || !a.questions?.stem) continue
    const w = countWords(a.questions.stem)
    if (w <= 0) continue
    const sample = attemptWpm(a)
    if (sample == null) continue
    words += w
    ms += a.time_spent_ms
  }
  if (ms <= 0 || words <= 0) return null
  const wpm = Math.round(words / (ms / 60_000))
  return Math.min(600, Math.max(80, wpm))
}

/** Daily average WPM series for Account reading-speed chart. */
export function computeReadingSpeedSeries(attempts: AttemptLogRow[]): ReadingSpeedPoint[] {
  const byDay = new Map<string, { words: number; ms: number; n: number }>()
  for (const a of attempts) {
    if (attemptWpm(a) == null || !a.questions?.stem || a.time_spent_ms == null) continue
    const d = dayKey(a.answered_at)
    const row = byDay.get(d) ?? { words: 0, ms: 0, n: 0 }
    row.words += countWords(a.questions.stem)
    row.ms += a.time_spent_ms
    row.n += 1
    byDay.set(d, row)
  }
  return [...byDay.entries()]
    .sort(([a], [b]) => a.localeCompare(b))
    .map(([date, v]) => {
      const wpm = v.ms > 0 ? Math.round(v.words / (v.ms / 60_000)) : 0
      const m = /^(\d{4})-(\d{2})-(\d{2})/.exec(date)
      const label = m ? `${m[3]}/${m[2]}` : date.slice(5)
      return {
        date,
        label,
        wpm: Math.min(600, Math.max(0, wpm)),
        attempts: v.n,
      }
    })
    .filter((p) => p.wpm > 0)
}

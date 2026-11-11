import type { AttemptResult } from '@/types/database'
import type { FlashcardGrade, LocalAttempt } from '@/types/quiz'

export function scorePercent(correct: number, total: number): number {
  if (total <= 0) return 0
  return Math.round((correct / total) * 10000) / 100
}

export function gradeToResult(grade: FlashcardGrade): AttemptResult {
  if (grade === 'again' || grade === 'hard') return 'incorrect'
  if (grade === 'good' || grade === 'easy') return 'correct'
  return 'partial'
}

export function summariseAttempts(attempts: LocalAttempt[]) {
  const correct = attempts.filter((a) => a.result === 'correct').length
  const incorrect = attempts.filter((a) => a.result === 'incorrect').length
  const skipped = attempts.filter((a) => a.result === 'skipped').length
  const partial = attempts.filter((a) => a.result === 'partial').length
  const answered = attempts.length
  return {
    correct,
    incorrect,
    skipped,
    partial,
    answered,
    percent: scorePercent(correct, Math.max(answered - skipped, 0) || answered),
  }
}

export function shuffleInPlace<T>(items: T[], seed?: string): T[] {
  const arr = [...items]
  let s = seed ? hashSeed(seed) : Date.now() % 2147483647
  if (s <= 0) s = 1
  for (let i = arr.length - 1; i > 0; i -= 1) {
    s = (s * 48271) % 2147483647
    const j = s % (i + 1)
    ;[arr[i], arr[j]] = [arr[j], arr[i]]
  }
  return arr
}

function hashSeed(seed: string): number {
  let h = 2166136261
  for (let i = 0; i < seed.length; i += 1) {
    h ^= seed.charCodeAt(i)
    h = Math.imul(h, 16777619)
  }
  return Math.abs(h) || 1
}

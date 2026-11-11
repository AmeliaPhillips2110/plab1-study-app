import type { AttemptResult } from '@/types/database'
import type { FlashcardGrade } from '@/types/quiz'

export type SrState = {
  ease_factor: number
  interval_days: number
  repetitions: number
  due_at: string
}

/** Simplified SM-2 style update for Stage b. */
export function nextSrState(
  prev: SrState | null,
  input: { grade?: FlashcardGrade; result?: AttemptResult },
  now = new Date(),
): SrState {
  const ease = prev?.ease_factor ?? 2.5
  const reps = prev?.repetitions ?? 0
  const interval = prev?.interval_days ?? 0

  const quality = gradeQuality(input)
  let nextEase = ease + (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02))
  if (nextEase < 1.3) nextEase = 1.3

  let nextReps = reps
  let nextInterval = interval

  if (quality < 3) {
    nextReps = 0
    nextInterval = quality === 0 ? 0.01 : 0.25 // ~15 min or 6 hours
  } else if (reps === 0) {
    nextReps = 1
    nextInterval = quality === 5 ? 4 : 1
  } else if (reps === 1) {
    nextReps = 2
    nextInterval = quality === 5 ? 10 : 6
  } else {
    nextReps = reps + 1
    nextInterval = Math.round(interval * nextEase * 100) / 100
    if (quality === 5) nextInterval *= 1.15
    if (quality === 3) nextInterval *= 0.85
  }

  const due = new Date(now.getTime() + nextInterval * 24 * 60 * 60 * 1000)
  return {
    ease_factor: Math.round(nextEase * 100) / 100,
    interval_days: Math.round(nextInterval * 100) / 100,
    repetitions: nextReps,
    due_at: due.toISOString(),
  }
}

function gradeQuality(input: { grade?: FlashcardGrade; result?: AttemptResult }): number {
  if (input.grade === 'again') return 0
  if (input.grade === 'hard') return 2
  if (input.grade === 'good') return 4
  if (input.grade === 'easy') return 5
  if (input.result === 'correct') return 4
  if (input.result === 'incorrect') return 1
  if (input.result === 'skipped') return 0
  return 2
}

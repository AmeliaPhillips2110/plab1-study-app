import type { PaceSample } from '@/types/quiz'

export function formatDuration(totalSec: number): string {
  const s = Math.max(0, Math.floor(totalSec))
  const h = Math.floor(s / 3600)
  const m = Math.floor((s % 3600) / 60)
  const r = s % 60
  if (h > 0) return `${h}:${String(m).padStart(2, '0')}:${String(r).padStart(2, '0')}`
  return `${m}:${String(r).padStart(2, '0')}`
}

/** Ideal seconds per question for the whole paper. */
export function idealSecondsPerQuestion(timeLimitSec: number, questionCount: number): number {
  if (questionCount <= 0) return 0
  return timeLimitSec / questionCount
}

/** Expected answered count at elapsed time if pacing evenly. */
export function expectedAnswered(
  elapsedSec: number,
  timeLimitSec: number,
  questionCount: number,
): number {
  if (timeLimitSec <= 0 || questionCount <= 0) return 0
  const ratio = Math.min(1, Math.max(0, elapsedSec / timeLimitSec))
  return ratio * questionCount
}

export type PaceSnapshot = {
  elapsedSec: number
  remainingSec: number
  answeredCount: number
  totalQuestions: number
  expectedCount: number
  deltaVsPace: number
  secondsPerAnswered: number | null
  idealSecPerQ: number
  projectedFinishSec: number | null
  status: 'ahead' | 'on_pace' | 'behind'
}

export function computePace(params: {
  elapsedSec: number
  timeLimitSec: number
  answeredCount: number
  totalQuestions: number
}): PaceSnapshot {
  const { elapsedSec, timeLimitSec, answeredCount, totalQuestions } = params
  const remainingSec = Math.max(0, timeLimitSec - elapsedSec)
  const expectedCount = expectedAnswered(elapsedSec, timeLimitSec, totalQuestions)
  const deltaVsPace = answeredCount - expectedCount
  const idealSecPerQ = idealSecondsPerQuestion(timeLimitSec, totalQuestions)
  const secondsPerAnswered = answeredCount > 0 ? elapsedSec / answeredCount : null
  const remainingQ = Math.max(0, totalQuestions - answeredCount)
  const projectedFinishSec =
    secondsPerAnswered != null ? elapsedSec + remainingQ * secondsPerAnswered : null

  let status: PaceSnapshot['status'] = 'on_pace'
  if (deltaVsPace >= 1) status = 'ahead'
  else if (deltaVsPace <= -1) status = 'behind'

  return {
    elapsedSec,
    remainingSec,
    answeredCount,
    totalQuestions,
    expectedCount,
    deltaVsPace,
    secondsPerAnswered,
    idealSecPerQ,
    projectedFinishSec,
    status,
  }
}

export function maybeRecordPaceSample(
  samples: PaceSample[],
  elapsedSec: number,
  answeredCount: number,
  minGapSec = 30,
): PaceSample[] {
  const last = samples[samples.length - 1]
  if (last && elapsedSec - last.elapsedSec < minGapSec && last.answeredCount === answeredCount) {
    return samples
  }
  return [...samples, { elapsedSec, answeredCount }]
}

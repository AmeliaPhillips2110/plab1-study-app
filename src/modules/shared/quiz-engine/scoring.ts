/** Scoring helpers — Stage b. */
export function scorePercent(correct: number, total: number): number {
  if (total <= 0) return 0
  return Math.round((correct / total) * 10000) / 100
}

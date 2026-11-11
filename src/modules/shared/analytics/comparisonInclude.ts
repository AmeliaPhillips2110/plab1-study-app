/** Peer comparison helpers — must respect comparison_opt_out. */
export function isIncludedInComparison(comparisonOptOut: boolean): boolean {
  return !comparisonOptOut
}

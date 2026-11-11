/** Peer comparison helpers — must respect comparison_opt_out. Stage e. */
export function isIncludedInComparison(comparisonOptOut: boolean): boolean {
  return !comparisonOptOut
}

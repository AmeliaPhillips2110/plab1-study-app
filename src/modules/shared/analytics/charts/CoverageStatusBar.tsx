import {
  COVERAGE_STATUS_COLORS,
  COVERAGE_STATUS_LABELS,
  type CoverageStatus,
  type CoverageStatusCounts,
} from '@/modules/shared/analytics/kpiMetrics'

type Props = { counts: CoverageStatusCounts }

const ORDER: CoverageStatus[] = [
  'new',
  'incorrect',
  'correct',
  'repeated_correct',
  'forgotten',
]

export function CoverageStatusBar({ counts }: Props) {
  const total = ORDER.reduce((sum, k) => sum + counts[k], 0)

  return (
    <div className="flex flex-col gap-3 py-1 sm:flex-row sm:items-center sm:gap-4">
      <div className="flex h-3.5 min-w-0 flex-1 overflow-hidden rounded-full bg-[#ece7df]">
        {total === 0
          ? null
          : ORDER.map((status) => {
              const n = counts[status]
              if (n <= 0) return null
              const pct = (n / total) * 100
              return (
                <div
                  key={status}
                  title={`${COVERAGE_STATUS_LABELS[status]}: ${n}`}
                  style={{ width: `${pct}%`, backgroundColor: COVERAGE_STATUS_COLORS[status] }}
                />
              )
            })}
      </div>
      <ul className="flex shrink-0 flex-col gap-1.5 text-xs text-muted sm:min-w-[9.5rem]">
        {ORDER.map((status) => (
          <li key={status} className="inline-flex items-center gap-1.5">
            <span
              className="inline-block h-2.5 w-2.5 rounded-sm"
              style={{ backgroundColor: COVERAGE_STATUS_COLORS[status] }}
              aria-hidden
            />
            {COVERAGE_STATUS_LABELS[status]}
            {total > 0 ? (
              <span className="text-fg">({counts[status]})</span>
            ) : null}
          </li>
        ))}
      </ul>
    </div>
  )
}

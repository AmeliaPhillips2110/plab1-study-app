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
    <div className="flex flex-col gap-3 py-2">
      <div className="flex h-4 w-full overflow-hidden rounded-full bg-[#d7ebee]">
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
      <ul className="flex flex-wrap justify-center gap-x-4 gap-y-1 text-xs text-muted">
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

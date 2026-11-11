import { useMemo } from 'react'
import { CHART } from '@/modules/shared/analytics/chartTheme'
import type { DayActivity } from '@/modules/shared/analytics/kpiMetrics'
import { cn } from '@/lib/cn'

type Props = { data: DayActivity[] }

function intensity(count: number, max: number): string {
  if (count <= 0) return 'bg-border/40'
  const t = max <= 0 ? 0 : count / max
  if (t > 0.75) return 'bg-accent'
  if (t > 0.5) return 'bg-accent/80'
  if (t > 0.25) return 'bg-accent/50'
  return 'bg-accent/25'
}

export function ActivityHeatmap({ data }: Props) {
  const max = useMemo(() => Math.max(0, ...data.map((d) => d.count)), [data])
  if (data.every((d) => d.count === 0)) {
    return <p className="py-8 text-center text-sm text-muted">No activity in the last 12 weeks.</p>
  }

  // Pad to weeks starting Monday-ish for a github-style grid (columns = weeks)
  const weeks: DayActivity[][] = []
  let week: DayActivity[] = []
  // Align first day to weekday
  const firstDow = new Date(data[0]!.date + 'T12:00:00').getDay()
  for (let i = 0; i < firstDow; i += 1) week.push({ date: `pad-${i}`, count: -1 })
  for (const day of data) {
    week.push(day)
    if (week.length === 7) {
      weeks.push(week)
      week = []
    }
  }
  if (week.length) {
    while (week.length < 7) week.push({ date: `pad-end-${week.length}`, count: -1 })
    weeks.push(week)
  }

  return (
    <div className="overflow-x-auto">
      <div className="inline-flex gap-1">
        {weeks.map((w, wi) => (
          <div key={wi} className="flex flex-col gap-1">
            {w.map((d) =>
              d.count < 0 ? (
                <div key={d.date} className="h-3 w-3 rounded-sm bg-transparent" />
              ) : (
                <div
                  key={d.date}
                  title={`${d.date}: ${d.count} attempt${d.count === 1 ? '' : 's'}`}
                  className={cn('h-3 w-3 rounded-sm', intensity(d.count, max))}
                />
              ),
            )}
          </div>
        ))}
      </div>
      <div className="mt-2 flex items-center gap-2 text-xs text-muted">
        <span>Less</span>
        <span className="h-3 w-3 rounded-sm bg-border/40" />
        <span className="h-3 w-3 rounded-sm bg-accent/25" />
        <span className="h-3 w-3 rounded-sm bg-accent/50" />
        <span className="h-3 w-3 rounded-sm bg-accent/80" />
        <span className="h-3 w-3 rounded-sm bg-accent" style={{ background: CHART.accent }} />
        <span>More</span>
      </div>
    </div>
  )
}

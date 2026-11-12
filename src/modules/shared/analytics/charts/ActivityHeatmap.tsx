import { useMemo } from 'react'
import type { DayActivity } from '@/modules/shared/analytics/kpiMetrics'
import { cn } from '@/lib/cn'

type Props = { data: DayActivity[] }

/** Teal family — darker cells for higher activity. */
function intensity(count: number, max: number): string {
  if (count <= 0) return 'bg-[#d7ebee]'
  const t = max <= 0 ? 0 : count / max
  if (t > 0.8) return 'bg-[#0f353c]'
  if (t > 0.6) return 'bg-[#17444d]'
  if (t > 0.4) return 'bg-[#1e5560]'
  if (t > 0.25) return 'bg-[#2a6873]'
  if (t > 0.12) return 'bg-[#5fa8b4]'
  return 'bg-[#a8d4db]'
}

export function ActivityHeatmap({ data }: Props) {
  const max = useMemo(() => Math.max(0, ...data.map((d) => d.count)), [data])

  const weeks: DayActivity[][] = []
  let week: DayActivity[] = []
  const source =
    data.length > 0
      ? data
      : Array.from({ length: 84 }, (_, i) => ({ date: `empty-${i}`, count: 0 }))
  const firstDow = new Date(
    (source[0]!.date.includes('empty') ? '2026-01-01' : source[0]!.date) + 'T12:00:00',
  ).getDay()
  for (let i = 0; i < firstDow; i += 1) week.push({ date: `pad-${i}`, count: -1 })
  for (const day of source) {
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
      <div className="flex flex-col items-center gap-3">
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
        <div className="flex w-full max-w-xs items-center gap-2 text-xs text-muted">
          <span>Less</span>
          <div
            className="h-3 flex-1 rounded-sm"
            style={{
              background:
                'linear-gradient(90deg, #d7ebee 0%, #a8d4db 20%, #5fa8b4 40%, #2a6873 60%, #1e5560 80%, #0f353c 100%)',
            }}
            aria-hidden
          />
          <span>More</span>
        </div>
      </div>
    </div>
  )
}

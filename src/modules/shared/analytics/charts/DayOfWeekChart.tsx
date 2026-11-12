import {
  CartesianGrid,
  Legend,
  Line,
  LineChart,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from 'recharts'
import { EmptyChartShell } from '@/modules/shared/analytics/charts/EmptyChartShell'
import { CHART, tooltipStyle } from '@/modules/shared/analytics/chartTheme'
import type { DowActivity } from '@/modules/shared/analytics/kpiMetrics'

type Props = { data: DowActivity[] }

export function DayOfWeekChart({ data }: Props) {
  const has = data.some((d) => d.total > 0)
  if (!has) {
    return <EmptyChartShell heightClass="h-56" yDomain={[0, 5]} />
  }
  return (
    <div className="h-56 w-full">
      <ResponsiveContainer width="100%" height="100%">
        <LineChart data={data} margin={{ top: 8, right: 12, left: 0, bottom: 0 }}>
          <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
          <XAxis dataKey="day" tick={{ fill: CHART.muted, fontSize: 11 }} />
          <YAxis tick={{ fill: CHART.muted, fontSize: 11 }} allowDecimals={false} />
          <Tooltip contentStyle={tooltipStyle} />
          <Legend />
          <Line
            type="monotone"
            dataKey="total"
            name="Activity"
            stroke={CHART.accent}
            strokeWidth={2}
            dot={{ r: 3 }}
            isAnimationActive
          />
          <Line
            type="monotone"
            dataKey="errors"
            name="Mistakes"
            stroke={CHART.incorrect}
            strokeWidth={2}
            strokeDasharray="4 3"
            dot={{ r: 3 }}
            isAnimationActive
          />
        </LineChart>
      </ResponsiveContainer>
    </div>
  )
}
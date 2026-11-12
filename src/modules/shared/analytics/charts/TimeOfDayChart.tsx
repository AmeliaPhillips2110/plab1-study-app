import {
  Bar,
  BarChart,
  CartesianGrid,
  Legend,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from 'recharts'
import { EmptyChartShell } from '@/modules/shared/analytics/charts/EmptyChartShell'
import { CHART, tooltipStyle } from '@/modules/shared/analytics/chartTheme'
import type { HourActivity } from '@/modules/shared/analytics/kpiMetrics'

type Props = { data: HourActivity[] }

export function TimeOfDayChart({ data }: Props) {
  const has = data.some((d) => d.total > 0)
  if (!has) {
    return <EmptyChartShell kind="bar" heightClass="h-56" yDomain={[0, 5]} />
  }
  return (
    <div className="h-56 w-full">
      <ResponsiveContainer width="100%" height="100%">
        <BarChart data={data} margin={{ top: 8, right: 12, left: 0, bottom: 0 }}>
          <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
          <XAxis dataKey="hour" tick={{ fill: CHART.muted, fontSize: 9 }} interval={2} />
          <YAxis tick={{ fill: CHART.muted, fontSize: 11 }} allowDecimals={false} />
          <Tooltip contentStyle={tooltipStyle} />
          <Legend />
          <Bar dataKey="total" name="Activity" fill={CHART.accent} radius={[2, 2, 0, 0]} />
          <Bar dataKey="errors" name="Errors" fill={CHART.incorrect} radius={[2, 2, 0, 0]} />
        </BarChart>
      </ResponsiveContainer>
    </div>
  )
}

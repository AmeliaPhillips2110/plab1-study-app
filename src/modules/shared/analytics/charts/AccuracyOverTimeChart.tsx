import {
  CartesianGrid,
  Line,
  LineChart,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from 'recharts'
import { EmptyChartShell } from '@/modules/shared/analytics/charts/EmptyChartShell'
import { CHART, tooltipStyle } from '@/modules/shared/analytics/chartTheme'
import type { ActivitySeriesPoint } from '@/modules/shared/analytics/kpiMetrics'

type Props = { points: ActivitySeriesPoint[] }

export function AccuracyOverTimeChart({ points }: Props) {
  const data = points.filter((p) => p.percentCorrect != null)
  if (data.length === 0) {
    return <EmptyChartShell heightClass="h-56" yDomain={[0, 100]} yUnit="%" />
  }
  return (
    <div className="h-56 w-full">
      <ResponsiveContainer width="100%" height="100%">
        <LineChart data={data} margin={{ top: 8, right: 12, left: 0, bottom: 0 }}>
          <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
          <XAxis dataKey="label" tick={{ fill: CHART.muted, fontSize: 11 }} />
          <YAxis domain={[0, 100]} tick={{ fill: CHART.muted, fontSize: 11 }} unit="%" />
          <Tooltip contentStyle={tooltipStyle} />
          <Line
            type="monotone"
            dataKey="percentCorrect"
            name="% Correct"
            stroke={CHART.correct}
            strokeWidth={2}
            dot={{ r: 2, fill: CHART.correct }}
          />
        </LineChart>
      </ResponsiveContainer>
    </div>
  )
}

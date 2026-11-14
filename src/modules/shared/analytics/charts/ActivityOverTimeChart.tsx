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
import type { ActivitySeriesPoint } from '@/modules/shared/analytics/kpiMetrics'
import { SKIPPED_YELLOW } from '@/types/quiz'

type Props = {
  points: ActivitySeriesPoint[]
}

export function ActivityOverTimeChart({ points }: Props) {
  if (points.length === 0) {
    return <EmptyChartShell heightClass="h-72" yDomain={[0, 10]} />
  }
  return (
    <div className="h-72 w-full">
      <ResponsiveContainer width="100%" height="100%">
        <LineChart data={points} margin={{ top: 8, right: 12, left: 0, bottom: 0 }}>
          <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
          <XAxis dataKey="label" tick={{ fill: CHART.muted, fontSize: 11 }} />
          <YAxis tick={{ fill: CHART.muted, fontSize: 11 }} allowDecimals={false} />
          <Tooltip contentStyle={tooltipStyle} />
          <Legend />
          <Line
            type="monotone"
            dataKey="total"
            name="Total"
            stroke={CHART.accent}
            strokeWidth={2}
            dot={false}
          />
          <Line
            type="monotone"
            dataKey="errors"
            name="Errors"
            stroke={CHART.incorrect}
            strokeWidth={2}
            strokeDasharray="4 3"
            dot={false}
          />
          <Line
            type="monotone"
            dataKey="correct"
            name="Correct"
            stroke={CHART.correct}
            strokeWidth={2}
            dot={false}
          />
          <Line
            type="monotone"
            dataKey="skipped"
            name="Skipped"
            stroke={SKIPPED_YELLOW}
            strokeWidth={2}
            dot={false}
          />
        </LineChart>
      </ResponsiveContainer>
    </div>
  )
}

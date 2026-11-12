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

type Props = {
  points: ActivitySeriesPoint[]
  topicKeys: string[]
}

const TOPIC_COLORS = ['#7eb8c2', '#5fa8b4', '#a8d4db', '#2a6873', '#2f6f6a', '#337d8a', '#6fadb8', '#4a9aa6']

export function ActivityOverTimeChart({ points, topicKeys }: Props) {
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
          {topicKeys.slice(0, 5).map((key, i) => (
            <Line
              key={key}
              type="monotone"
              dataKey={key}
              name={key.replace(/^t:/, '')}
              stroke={TOPIC_COLORS[i % TOPIC_COLORS.length]}
              strokeWidth={1.5}
              strokeOpacity={0.85}
              dot={false}
            />
          ))}
        </LineChart>
      </ResponsiveContainer>
    </div>
  )
}

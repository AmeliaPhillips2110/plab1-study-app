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
import type { TopicAccuracy } from '@/modules/shared/analytics/kpiMetrics'

type Props = { data: TopicAccuracy[]; passMark: number }

export function TopicAccuracyChart({ data }: Props) {
  if (data.length === 0) {
    return <EmptyChartShell kind="bar" yDomain={[0, 100]} yUnit="%" heightClass="h-72" />
  }
  const chartData = [...data].sort((a, b) => b.total - a.total)
  return (
    <div className="h-72 w-full">
      <ResponsiveContainer width="100%" height="100%">
        <BarChart
          data={chartData}
          layout="vertical"
          margin={{ top: 8, right: 12, left: 8, bottom: 0 }}
        >
          <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
          <XAxis
            type="number"
            domain={[0, 100]}
            tick={{ fill: CHART.muted, fontSize: 11 }}
            unit="%"
          />
          <YAxis
            type="category"
            dataKey="topic"
            width={110}
            tick={{ fill: CHART.muted, fontSize: 11 }}
          />
          <Tooltip
            contentStyle={tooltipStyle}
            cursor={false}
            formatter={(value, name) => [`${value}%`, String(name)]}
          />
          <Legend />
          <Bar
            dataKey="correctPct"
            name="% Correct"
            stackId="stack"
            fill={CHART.correct}
            activeBar={false}
          />
          <Bar
            dataKey="incorrectPct"
            name="% Incorrect"
            stackId="stack"
            fill={CHART.incorrect}
            activeBar={false}
          />
          <Bar
            dataKey="skippedPct"
            name="% Skipped"
            stackId="stack"
            fill="#a3a3a3"
            radius={[0, 4, 4, 0]}
            activeBar={false}
          />
        </BarChart>
      </ResponsiveContainer>
    </div>
  )
}

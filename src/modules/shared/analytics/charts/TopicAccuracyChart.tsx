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

/** Distinct stack colours (bottom → top matches legend order). Skipped = yellow (#eab308). */
const STACK = {
  correct: '#3d8b5a',
  incorrect: '#b54a4a',
  skipped: '#eab308',
} as const

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
          margin={{ top: 8, right: 110, left: 8, bottom: 0 }}
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
          <Legend
            layout="vertical"
            verticalAlign="middle"
            align="right"
            wrapperStyle={{ paddingLeft: 8 }}
          />
          <Bar
            dataKey="correctPct"
            name="% Correct"
            stackId="stack"
            fill={STACK.correct}
            activeBar={false}
          />
          <Bar
            dataKey="incorrectPct"
            name="% Incorrect"
            stackId="stack"
            fill={STACK.incorrect}
            activeBar={false}
          />
          <Bar
            dataKey="skippedPct"
            name="% Skipped"
            stackId="stack"
            fill={STACK.skipped}
            radius={[0, 4, 4, 0]}
            activeBar={false}
          />
        </BarChart>
      </ResponsiveContainer>
    </div>
  )
}

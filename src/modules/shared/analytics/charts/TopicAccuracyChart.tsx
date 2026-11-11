import {
  Bar,
  BarChart,
  CartesianGrid,
  Cell,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from 'recharts'
import { CHART, tooltipStyle } from '@/modules/shared/analytics/chartTheme'
import type { TopicAccuracy } from '@/modules/shared/analytics/kpiMetrics'

type Props = { data: TopicAccuracy[]; passMark: number }

export function TopicAccuracyChart({ data, passMark }: Props) {
  if (data.length === 0) {
    return <p className="py-8 text-center text-sm text-muted">No topic attempts yet.</p>
  }
  const chartData = [...data].sort((a, b) => b.accuracy - a.accuracy)
  return (
    <div className="h-72 w-full">
      <ResponsiveContainer width="100%" height="100%">
        <BarChart
          data={chartData}
          layout="vertical"
          margin={{ top: 8, right: 12, left: 8, bottom: 0 }}
        >
          <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
          <XAxis type="number" domain={[0, 100]} tick={{ fill: CHART.muted, fontSize: 11 }} unit="%" />
          <YAxis
            type="category"
            dataKey="topic"
            width={110}
            tick={{ fill: CHART.muted, fontSize: 11 }}
          />
          <Tooltip
            contentStyle={tooltipStyle}
            formatter={(value) => [`${value}%`, 'Accuracy']}
          />
          <Bar dataKey="accuracy" name="Accuracy" radius={[0, 4, 4, 0]}>
            {chartData.map((row) => (
              <Cell
                key={row.topicId}
                fill={row.accuracy >= passMark ? CHART.correct : CHART.incorrect}
              />
            ))}
          </Bar>
        </BarChart>
      </ResponsiveContainer>
    </div>
  )
}

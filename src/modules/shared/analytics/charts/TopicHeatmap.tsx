import { useMemo } from 'react'
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
import type { TopicDayCell } from '@/modules/shared/analytics/kpiMetrics'

const DAYS = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
const TOPIC_COLORS = ['#337d8a', '#7eb8c2', '#2f6f6a', '#5fa8b4', '#2a6873', '#a8d4db', '#b54a4a', '#c47a3a']

type Props = { data: TopicDayCell[] }

/** Topic × weekday activity as multi-line chart (replaces heat boxes). */
export function TopicHeatmap({ data }: Props) {
  const { chartData, topics } = useMemo(() => {
    const topicSet = [...new Set(data.map((d) => d.topic))].sort().slice(0, 8)
    const map = new Map(data.map((d) => [`${d.topic}||${d.day}`, d.count]))
    const rows = DAYS.map((day) => {
      const row: Record<string, string | number> = { day }
      for (const topic of topicSet) {
        row[topic] = map.get(`${topic}||${day}`) ?? 0
      }
      return row
    })
    return { chartData: rows, topics: topicSet }
  }, [data])

  if (topics.length === 0) {
    return <EmptyChartShell heightClass="h-64" yDomain={[0, 5]} />
  }

  return (
    <div className="h-72 w-full">
      <ResponsiveContainer width="100%" height="100%">
        <LineChart data={chartData} margin={{ top: 8, right: 12, left: 0, bottom: 0 }}>
          <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
          <XAxis dataKey="day" tick={{ fill: CHART.muted, fontSize: 11 }} />
          <YAxis tick={{ fill: CHART.muted, fontSize: 11 }} allowDecimals={false} />
          <Tooltip contentStyle={tooltipStyle} />
          <Legend />
          {topics.map((topic, i) => (
            <Line
              key={topic}
              type="monotone"
              dataKey={topic}
              name={topic}
              stroke={TOPIC_COLORS[i % TOPIC_COLORS.length]}
              strokeWidth={2}
              dot={{ r: 2 }}
              isAnimationActive
            />
          ))}
        </LineChart>
      </ResponsiveContainer>
    </div>
  )
}

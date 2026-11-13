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
import type { ReadingSpeedPoint } from '@/features/preferences/readingSpeedMetrics'

type Props = { data: ReadingSpeedPoint[] }

export function ReadingSpeedChart({ data }: Props) {
  if (data.length === 0) {
    return <EmptyChartShell yDomain={[0, 300]} heightClass="h-48" />
  }
  const max = Math.max(...data.map((d) => d.wpm), 200)
  const yMax = Math.ceil((max * 1.15) / 50) * 50
  return (
    <div className="h-48 w-full">
      <ResponsiveContainer width="100%" height="100%">
        <LineChart data={data} margin={{ top: 8, right: 12, left: 0, bottom: 0 }}>
          <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
          <XAxis dataKey="label" tick={{ fill: CHART.muted, fontSize: 11 }} />
          <YAxis
            domain={[0, yMax]}
            tick={{ fill: CHART.muted, fontSize: 11 }}
            unit=" WPM"
            width={48}
          />
          <Tooltip contentStyle={tooltipStyle} />
          <Line
            type="monotone"
            dataKey="wpm"
            name="Reading speed"
            stroke={CHART.accent}
            strokeWidth={2}
            dot={{ r: 3, fill: CHART.accent }}
          />
        </LineChart>
      </ResponsiveContainer>
    </div>
  )
}

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
import type { QpmPoint } from '@/modules/shared/analytics/kpiMetrics'

type Props = { data: QpmPoint[] }

export function QpmChart({ data }: Props) {
  if (data.length === 0) {
    return <EmptyChartShell yDomain={[0, 2]} heightClass="h-28" />
  }
  const max = Math.max(...data.map((d) => d.qpm), 0.5)
  const yMax = Math.ceil(max * 1.15 * 10) / 10
  return (
    <div className="h-28 w-full">
      <ResponsiveContainer width="100%" height="100%">
        <LineChart data={data} margin={{ top: 4, right: 8, left: 0, bottom: 0 }}>
          <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
          <XAxis dataKey="label" tick={{ fill: CHART.muted, fontSize: 10 }} />
          <YAxis
            domain={[0, yMax]}
            tick={{ fill: CHART.muted, fontSize: 10 }}
            width={28}
            tickCount={3}
          />
          <Tooltip contentStyle={tooltipStyle} />
          <Line
            type="monotone"
            dataKey="qpm"
            name="Q / Min"
            stroke={CHART.accentHover}
            strokeWidth={2}
            dot={{ r: 2, fill: CHART.accentHover }}
          />
        </LineChart>
      </ResponsiveContainer>
    </div>
  )
}

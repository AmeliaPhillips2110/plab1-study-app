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
    return (
      <EmptyChartShell
        message="No timed attempts for QPM yet."
        yDomain={[0, 4]}
        heightClass="h-56"
      />
    )
  }
  return (
    <div className="h-56 w-full">
      <ResponsiveContainer width="100%" height="100%">
        <LineChart data={data} margin={{ top: 8, right: 12, left: 0, bottom: 0 }}>
          <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
          <XAxis dataKey="label" tick={{ fill: CHART.muted, fontSize: 11 }} />
          <YAxis tick={{ fill: CHART.muted, fontSize: 11 }} />
          <Tooltip contentStyle={tooltipStyle} />
          <Line
            type="monotone"
            dataKey="qpm"
            name="Q / min"
            stroke={CHART.accentHover}
            strokeWidth={2}
            dot={{ r: 2, fill: CHART.accentHover }}
          />
        </LineChart>
      </ResponsiveContainer>
    </div>
  )
}

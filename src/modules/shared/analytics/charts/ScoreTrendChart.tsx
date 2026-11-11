import {
  CartesianGrid,
  Line,
  LineChart,
  ReferenceLine,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from 'recharts'
import { CHART, tooltipStyle } from '@/modules/shared/analytics/chartTheme'
import type { ScorePoint } from '@/modules/shared/analytics/kpiMetrics'

type Props = { data: ScorePoint[]; passMark: number }

export function ScoreTrendChart({ data, passMark }: Props) {
  if (data.length === 0) {
    return <Empty>No finished sessions with scores yet.</Empty>
  }
  return (
    <div className="h-64 w-full">
      <ResponsiveContainer width="100%" height="100%">
        <LineChart data={data} margin={{ top: 8, right: 12, left: 0, bottom: 0 }}>
          <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
          <XAxis dataKey="label" tick={{ fill: CHART.muted, fontSize: 11 }} />
          <YAxis domain={[0, 100]} tick={{ fill: CHART.muted, fontSize: 11 }} unit="%" />
          <Tooltip contentStyle={tooltipStyle} />
          <ReferenceLine
            y={passMark}
            stroke={CHART.pass}
            strokeDasharray="4 4"
            label={{ value: `Pass ${passMark}%`, fill: CHART.muted, fontSize: 11 }}
          />
          <Line
            type="monotone"
            dataKey="score"
            stroke={CHART.accent}
            strokeWidth={2}
            dot={{ r: 3, fill: CHART.accent }}
            name="Score %"
          />
        </LineChart>
      </ResponsiveContainer>
    </div>
  )
}

function Empty({ children }: { children: string }) {
  return <p className="py-8 text-center text-sm text-muted">{children}</p>
}

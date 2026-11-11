import { Cell, Pie, PieChart, ResponsiveContainer, Tooltip, Legend } from 'recharts'
import { CHART, tooltipStyle } from '@/modules/shared/analytics/chartTheme'
import type { MistakeSlice } from '@/modules/shared/analytics/kpiMetrics'

type Props = { data: MistakeSlice[] }

export function MistakeBreakdownChart({ data }: Props) {
  if (data.length === 0) {
    return (
      <p className="py-8 text-center text-sm text-muted">
        No mistake tags yet — tag wrong answers in Quiz or Mock review.
      </p>
    )
  }
  return (
    <div className="h-64 w-full">
      <ResponsiveContainer width="100%" height="100%">
        <PieChart>
          <Pie
            data={data}
            dataKey="count"
            nameKey="label"
            cx="50%"
            cy="50%"
            outerRadius={80}
            label={(props) => {
              const name = String(props.name ?? '')
              const pct = Math.round((Number(props.percent) || 0) * 100)
              return `${name} ${pct}%`
            }}
          >
            {data.map((row, i) => (
              <Cell key={row.tag} fill={CHART.series[i % CHART.series.length]} />
            ))}
          </Pie>
          <Tooltip contentStyle={tooltipStyle} />
          <Legend />
        </PieChart>
      </ResponsiveContainer>
    </div>
  )
}

import { Cell, Pie, PieChart, ResponsiveContainer, Tooltip, Legend } from 'recharts'
import { CHART, tooltipStyle } from '@/modules/shared/analytics/chartTheme'
import type { MistakeSlice } from '@/modules/shared/analytics/kpiMetrics'

type Props = { data: MistakeSlice[] }

export function MistakeBreakdownChart({ data }: Props) {
  if (data.length === 0) {
    const placeholder = [
      { tag: '—', label: 'No tags', count: 1 },
      { tag: '--', label: '—', count: 1 },
      { tag: '---', label: '—', count: 1 },
    ]
    return (
      <div className="relative h-64 w-full">
        <ResponsiveContainer width="100%" height="100%">
          <PieChart>
            <Pie
              data={placeholder}
              dataKey="count"
              nameKey="label"
              cx="50%"
              cy="50%"
              outerRadius={80}
              fillOpacity={0.2}
            >
              {placeholder.map((row, i) => (
                <Cell key={row.tag} fill={CHART.series[i % CHART.series.length]} />
              ))}
            </Pie>
          </PieChart>
        </ResponsiveContainer>
        <p className="pointer-events-none absolute inset-0 flex items-center justify-center px-4 text-center text-sm text-muted">
          No mistake tags yet — tag wrong answers in Quiz or Mock review.
        </p>
      </div>
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

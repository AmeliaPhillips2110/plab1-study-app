import { Cell, Pie, PieChart, ResponsiveContainer, Tooltip, Legend } from 'recharts'
import { CHART, tooltipStyle } from '@/modules/shared/analytics/chartTheme'
import type { MistakeSlice } from '@/modules/shared/analytics/kpiMetrics'

type Props = { data: MistakeSlice[] }

export function MistakeBreakdownChart({ data }: Props) {
  if (data.length === 0) {
    const placeholder = [
      { tag: '—', label: 'No Tags', count: 1 },
      { tag: '--', label: '—', count: 1 },
      { tag: '---', label: '—', count: 1 },
    ]
    return (
      <div className="mx-auto flex h-72 w-full max-w-md items-center justify-center">
        <ResponsiveContainer width="100%" height="100%">
          <PieChart>
            <Pie
              data={placeholder}
              dataKey="count"
              nameKey="label"
              cx="50%"
              cy="50%"
              outerRadius={90}
              fillOpacity={0.2}
              isAnimationActive
            >
              {placeholder.map((row, i) => (
                <Cell key={row.tag} fill={CHART.series[i % CHART.series.length]} />
              ))}
            </Pie>
          </PieChart>
        </ResponsiveContainer>
      </div>
    )
  }
  return (
    <div className="mx-auto h-72 w-full max-w-lg">
      <ResponsiveContainer width="100%" height="100%">
        <PieChart>
          <Pie
            data={data}
            dataKey="count"
            nameKey="label"
            cx="50%"
            cy="46%"
            outerRadius={90}
            label={false}
            isAnimationActive
          >
            {data.map((row, i) => (
              <Cell key={row.tag} fill={CHART.series[i % CHART.series.length]} />
            ))}
          </Pie>
          <Tooltip contentStyle={tooltipStyle} />
          <Legend verticalAlign="bottom" align="center" />
        </PieChart>
      </ResponsiveContainer>
    </div>
  )
}

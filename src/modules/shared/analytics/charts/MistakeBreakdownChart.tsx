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
      <div className="flex h-64 w-full items-center gap-2">
        <div className="h-full min-w-0 flex-1">
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
        </div>
        <div className="w-28 shrink-0 text-xs text-muted" />
      </div>
    )
  }
  return (
    <div className="flex h-64 w-full items-center">
      <div className="h-full min-w-0 flex-1">
        <ResponsiveContainer width="100%" height="100%">
          <PieChart>
            <Pie
              data={data}
              dataKey="count"
              nameKey="label"
              cx="50%"
              cy="50%"
              outerRadius={80}
              label={false}
            >
              {data.map((row, i) => (
                <Cell key={row.tag} fill={CHART.series[i % CHART.series.length]} />
              ))}
            </Pie>
            <Tooltip contentStyle={tooltipStyle} />
            <Legend
              layout="vertical"
              align="right"
              verticalAlign="middle"
              wrapperStyle={{ paddingLeft: 8 }}
            />
          </PieChart>
        </ResponsiveContainer>
      </div>
    </div>
  )
}

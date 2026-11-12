import {
  Bar,
  BarChart,
  CartesianGrid,
  Line,
  LineChart,
  ResponsiveContainer,
  XAxis,
  YAxis,
} from 'recharts'
import { CHART } from '@/modules/shared/analytics/chartTheme'

const PLACEHOLDER = [
  { label: '—', value: 0 },
  { label: '—', value: 0 },
  { label: '—', value: 0 },
  { label: '—', value: 0 },
]

type Props = {
  /** Optional; omit to leave blank axes with no copy. */
  message?: string
  kind?: 'line' | 'bar'
  yDomain?: [number, number]
  yUnit?: string
  heightClass?: string
}

/** Empty axes shell — blank by default (no empty-state copy). */
export function EmptyChartShell({
  message,
  kind = 'line',
  yDomain = [0, 100],
  yUnit,
  heightClass = 'h-64',
}: Props) {
  return (
    <div className={`relative w-full ${heightClass}`}>
      <ResponsiveContainer width="100%" height="100%">
        {kind === 'bar' ? (
          <BarChart data={PLACEHOLDER} margin={{ top: 8, right: 12, left: 0, bottom: 0 }}>
            <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
            <XAxis dataKey="label" tick={{ fill: CHART.muted, fontSize: 11 }} />
            <YAxis
              domain={yDomain}
              tick={{ fill: CHART.muted, fontSize: 11 }}
              unit={yUnit}
            />
            <Bar dataKey="value" fill={CHART.accent} fillOpacity={0.15} radius={[4, 4, 0, 0]} />
          </BarChart>
        ) : (
          <LineChart data={PLACEHOLDER} margin={{ top: 8, right: 12, left: 0, bottom: 0 }}>
            <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
            <XAxis dataKey="label" tick={{ fill: CHART.muted, fontSize: 11 }} />
            <YAxis
              domain={yDomain}
              tick={{ fill: CHART.muted, fontSize: 11 }}
              unit={yUnit}
            />
            <Line
              type="monotone"
              dataKey="value"
              stroke={CHART.accent}
              strokeOpacity={0.25}
              strokeWidth={2}
              dot={false}
            />
          </LineChart>
        )}
      </ResponsiveContainer>
      {message ? (
        <p className="pointer-events-none absolute inset-0 flex items-center justify-center px-4 text-center text-sm text-muted">
          {message}
        </p>
      ) : null}
    </div>
  )
}

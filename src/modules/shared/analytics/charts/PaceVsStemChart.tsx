import {
  Bar,
  BarChart,
  CartesianGrid,
  ResponsiveContainer,
  Scatter,
  ScatterChart,
  Tooltip,
  XAxis,
  YAxis,
} from 'recharts'
import { CHART, tooltipStyle } from '@/modules/shared/analytics/chartTheme'
import type { PaceVsStemBucket, PaceVsStemPoint } from '@/modules/shared/analytics/kpiMetrics'

type Props = {
  points: PaceVsStemPoint[]
  buckets: PaceVsStemBucket[]
}

export function PaceVsStemChart({ points, buckets }: Props) {
  if (points.length === 0 && buckets.length === 0) {
    const emptyBuckets = [
      { bucket: 'Short', avgSeconds: 0 },
      { bucket: 'Medium', avgSeconds: 0 },
      { bucket: 'Long', avgSeconds: 0 },
    ]
    return (
      <div className="relative grid gap-6 lg:grid-cols-2">
        <div className="h-56 w-full">
          <p className="mb-2 text-xs text-muted">Avg seconds by stem length</p>
          <ResponsiveContainer width="100%" height="100%">
            <BarChart data={emptyBuckets} margin={{ top: 8, right: 12, left: 0, bottom: 0 }}>
              <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
              <XAxis dataKey="bucket" tick={{ fill: CHART.muted, fontSize: 10 }} />
              <YAxis tick={{ fill: CHART.muted, fontSize: 11 }} domain={[0, 60]} />
              <Bar dataKey="avgSeconds" fill={CHART.accent} fillOpacity={0.15} radius={[4, 4, 0, 0]} />
            </BarChart>
          </ResponsiveContainer>
        </div>
        <div className="h-56 w-full">
          <p className="mb-2 text-xs text-muted">Scatter: words vs seconds (sample)</p>
          <ResponsiveContainer width="100%" height="100%">
            <ScatterChart margin={{ top: 8, right: 12, left: 0, bottom: 0 }}>
              <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
              <XAxis type="number" dataKey="words" name="Words" domain={[0, 100]} tick={{ fill: CHART.muted, fontSize: 11 }} />
              <YAxis type="number" dataKey="seconds" name="Seconds" domain={[0, 60]} tick={{ fill: CHART.muted, fontSize: 11 }} />
              <Scatter name="Attempts" data={[]} fill={CHART.accentHover} />
            </ScatterChart>
          </ResponsiveContainer>
        </div>
        <p className="pointer-events-none absolute inset-0 flex items-center justify-center px-4 text-center text-sm text-muted">
          No timed attempts yet — pace vs stem length appears after you answer with time tracked.
        </p>
      </div>
    )
  }

  return (
    <div className="grid gap-6 lg:grid-cols-2">
      <div className="h-56 w-full">
        <p className="mb-2 text-xs text-muted">Avg seconds by stem length</p>
        <ResponsiveContainer width="100%" height="100%">
          <BarChart data={buckets} margin={{ top: 8, right: 12, left: 0, bottom: 0 }}>
            <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
            <XAxis dataKey="bucket" tick={{ fill: CHART.muted, fontSize: 10 }} />
            <YAxis tick={{ fill: CHART.muted, fontSize: 11 }} />
            <Tooltip contentStyle={tooltipStyle} />
            <Bar dataKey="avgSeconds" name="Avg seconds" fill={CHART.accent} radius={[4, 4, 0, 0]} />
          </BarChart>
        </ResponsiveContainer>
      </div>
      <div className="h-56 w-full">
        <p className="mb-2 text-xs text-muted">Scatter: words vs seconds (sample)</p>
        <ResponsiveContainer width="100%" height="100%">
          <ScatterChart margin={{ top: 8, right: 12, left: 0, bottom: 0 }}>
            <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
            <XAxis
              type="number"
              dataKey="words"
              name="Words"
              tick={{ fill: CHART.muted, fontSize: 11 }}
            />
            <YAxis
              type="number"
              dataKey="seconds"
              name="Seconds"
              tick={{ fill: CHART.muted, fontSize: 11 }}
            />
            <Tooltip contentStyle={tooltipStyle} cursor={{ strokeDasharray: '3 3' }} />
            <Scatter
              name="Attempts"
              data={points.slice(0, 200)}
              fill={CHART.accentHover}
              fillOpacity={0.7}
            />
          </ScatterChart>
        </ResponsiveContainer>
      </div>
    </div>
  )
}

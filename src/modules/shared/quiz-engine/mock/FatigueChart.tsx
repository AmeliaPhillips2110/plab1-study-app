import { useMemo } from 'react'
import {
  CartesianGrid,
  ComposedChart,
  Line,
  ResponsiveContainer,
  Scatter,
  Tooltip,
  XAxis,
  YAxis,
} from 'recharts'
import { CHART, tooltipStyle } from '@/modules/shared/analytics/chartTheme'
import { formatDuration } from '@/modules/shared/quiz-engine/pace'
import type { PaceSample } from '@/types/quiz'

type Props = {
  totalQuestions: number
  elapsedSec: number
  paceSamples: PaceSample[]
  /** 0-based indices of unanswered questions (black dots). */
  unansweredIndices: number[]
}

function interpolateRemaining(
  samples: Array<{ elapsedSec: number; remaining: number }>,
  t: number,
): number {
  if (samples.length === 0) return 0
  if (t <= samples[0]!.elapsedSec) return samples[0]!.remaining
  for (let i = 1; i < samples.length; i += 1) {
    const a = samples[i - 1]!
    const b = samples[i]!
    if (t <= b.elapsedSec) {
      const span = Math.max(1, b.elapsedSec - a.elapsedSec)
      const w = (t - a.elapsedSec) / span
      return a.remaining + (b.remaining - a.remaining) * w
    }
  }
  return samples[samples.length - 1]!.remaining
}

/** Questions remaining over time (fatigue) — blue line; black dots for unanswered. */
export function FatigueChart({
  totalQuestions,
  elapsedSec,
  paceSamples,
  unansweredIndices,
}: Props) {
  const { lineData, dots } = useMemo(() => {
    const samples =
      paceSamples.length > 0
        ? paceSamples
        : [{ elapsedSec: 0, answeredCount: 0 }, { elapsedSec: elapsedSec, answeredCount: 0 }]
    const last = samples[samples.length - 1]!
    const withEnd =
      last.elapsedSec < elapsedSec
        ? [...samples, { elapsedSec, answeredCount: last.answeredCount }]
        : samples

    const line = withEnd.map((s) => ({
      elapsedSec: s.elapsedSec,
      remaining: Math.max(0, totalQuestions - s.answeredCount),
      label: formatDuration(s.elapsedSec),
    }))

    const endT = Math.max(elapsedSec, line[line.length - 1]?.elapsedSec ?? 0, 1)
    const black = unansweredIndices.map((idx) => {
      const t =
        totalQuestions <= 1 ? endT : Math.min(endT, (idx / Math.max(totalQuestions - 1, 1)) * endT)
      return {
        elapsedSec: Math.round(t),
        unansweredAt: interpolateRemaining(line, t),
        q: idx + 1,
      }
    })

    return { lineData: line, dots: black }
  }, [paceSamples, elapsedSec, totalQuestions, unansweredIndices])

  if (totalQuestions <= 0) return null

  return (
    <div className="mt-4">
      <h3 className="mb-2 text-center font-display text-sm font-semibold">
        Questions Remaining Over Time
      </h3>
      <div className="h-48 w-full">
        <ResponsiveContainer width="100%" height="100%">
          <ComposedChart margin={{ top: 8, right: 12, left: 0, bottom: 0 }}>
            <CartesianGrid stroke={CHART.grid} strokeDasharray="3 3" />
            <XAxis
              type="number"
              dataKey="elapsedSec"
              tick={{ fill: CHART.muted, fontSize: 11 }}
              tickFormatter={(v) => formatDuration(Number(v))}
              domain={[0, 'dataMax']}
            />
            <YAxis
              type="number"
              tick={{ fill: CHART.muted, fontSize: 11 }}
              allowDecimals={false}
              domain={[0, totalQuestions]}
            />
            <Tooltip
              contentStyle={tooltipStyle}
              labelFormatter={(v) => `Time ${formatDuration(Number(v))}`}
            />
            <Line
              data={lineData}
              type="monotone"
              dataKey="remaining"
              name="Remaining"
              stroke="#2563eb"
              strokeWidth={2}
              dot={false}
              isAnimationActive={false}
            />
            <Scatter
              data={dots}
              dataKey="unansweredAt"
              name="Unanswered"
              fill="#111111"
              line={false}
            />
          </ComposedChart>
        </ResponsiveContainer>
      </div>
      <p className="mt-1 text-center text-xs text-muted">
        Blue = remaining · Black dots = unanswered
      </p>
    </div>
  )
}

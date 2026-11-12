import { useEffect, useMemo, useState, type ReactNode } from 'react'
import { Link } from 'react-router-dom'
import { Badge } from '@/components/ui/Badge'
import { ActivityHeatmap } from '@/modules/shared/analytics/charts/ActivityHeatmap'
import { MistakeBreakdownChart } from '@/modules/shared/analytics/charts/MistakeBreakdownChart'
import { PaceVsStemChart } from '@/modules/shared/analytics/charts/PaceVsStemChart'
import { QpmChart } from '@/modules/shared/analytics/charts/QpmChart'
import { ScoreTrendChart } from '@/modules/shared/analytics/charts/ScoreTrendChart'
import { TopicAccuracyChart } from '@/modules/shared/analytics/charts/TopicAccuracyChart'
import { TopicHeatmap } from '@/modules/shared/analytics/charts/TopicHeatmap'
import { fetchKpiBundle } from '@/modules/shared/analytics/kpiData'
import {
  computeCalendarHeatmap,
  computeHeadlineKpis,
  computeMistakeBreakdown,
  computePaceVsStem,
  computeQpmSeries,
  computeScoreTrend,
  computeTopicAccuracy,
  computeTopicWeekdayHeatmap,
  computeWeaknesses,
} from '@/modules/shared/analytics/kpiMetrics'
import { WeaknessChart } from '@/modules/shared/analytics/WeaknessChart'

type Props = {
  userId: string
  examId: string
  passMarkPercent: number
  isAdmin?: boolean
}

export function KpiDashboard({ userId, examId, passMarkPercent, isAdmin }: Props) {
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [bundle, setBundle] = useState<Awaited<ReturnType<typeof fetchKpiBundle>> | null>(null)

  useEffect(() => {
    void (async () => {
      setLoading(true)
      const data = await fetchKpiBundle({ userId, examId })
      setBundle(data)
      setError(data.error)
      setLoading(false)
    })()
  }, [userId, examId])

  const derived = useMemo(() => {
    if (!bundle) return null
    const headlines = computeHeadlineKpis({
      attempts: bundle.attempts,
      sessions: bundle.sessions,
      bankActive: bundle.bankActive,
    })
    const topicAccuracy = computeTopicAccuracy(bundle.attempts, bundle.topics)
    return {
      headlines,
      scoreTrend: computeScoreTrend(bundle.sessions),
      topicAccuracy,
      mistakes: computeMistakeBreakdown(bundle.attempts),
      qpm: computeQpmSeries(bundle.attempts),
      paceStem: computePaceVsStem(bundle.attempts),
      calendar: computeCalendarHeatmap(bundle.attempts),
      topicHeat: computeTopicWeekdayHeatmap(bundle.attempts),
      weaknesses: computeWeaknesses(topicAccuracy),
    }
  }, [bundle])

  if (loading) return <p className="text-sm text-muted">Loading KPIs…</p>
  if (error) return <p className="text-sm text-incorrect">{error}</p>
  if (!derived) return null

  const h = derived.headlines

  return (
    <div className="flex flex-col gap-8">
      <section className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
        <Tile
          label="Accuracy"
          value={`${h.accuracyPercent}%`}
          hint={`${h.correctCount}/${h.gradedCount} graded`}
          tone={h.accuracyPercent >= passMarkPercent ? 'good' : 'warn'}
        />
        <Tile label="Attempts" value={String(h.attemptCount)} hint={`${h.finishedSessionCount} finished sessions`} />
        <Tile
          label="Coverage"
          value={`${h.coveragePercent}%`}
          hint={`${h.uniqueAttempted}/${h.bankActive} active questions`}
        />
        <Tile
          label="Pace"
          value={`${h.qpm}`}
          hint={`Q/min avg · ${h.activeDays30} active days (30d)`}
        />
      </section>

      {h.latestMockPercent != null ? (
        <p className="text-sm text-muted">
          Latest timed test score:{' '}
          <Badge tone={h.latestMockPercent >= passMarkPercent ? 'correct' : 'incorrect'}>
            {h.latestMockPercent}%
          </Badge>{' '}
          (pass mark {passMarkPercent}%)
        </p>
      ) : null}

      <Panel title="Score over time" subtitle={`Pass mark line at ${passMarkPercent}%`}>
        <ScoreTrendChart data={derived.scoreTrend} passMark={passMarkPercent} />
      </Panel>

      <div className="grid gap-6 lg:grid-cols-2">
        <Panel title="Accuracy by specialty" subtitle="Topics with graded attempts">
          <TopicAccuracyChart data={derived.topicAccuracy} passMark={passMarkPercent} />
        </Panel>
        <Panel title="Mistake breakdown" subtitle="From tagged incorrect attempts">
          <MistakeBreakdownChart data={derived.mistakes} />
        </Panel>
      </div>

      <div className="grid gap-6 lg:grid-cols-2">
        <Panel title="Questions per minute" subtitle="Daily average from timed attempts">
          <QpmChart data={derived.qpm} />
        </Panel>
        <Panel title="Coverage" subtitle="Unique questions touched vs active bank">
          <div className="flex flex-col gap-3 py-2">
            <div className="h-3 overflow-hidden rounded-full bg-border">
              <div
                className="h-full bg-accent transition-all"
                style={{ width: `${Math.min(100, h.coveragePercent)}%` }}
              />
            </div>
            <p className="text-sm text-muted">
              {h.uniqueAttempted} of {h.bankActive} active items ({h.coveragePercent}%). Grow the bank
              in Admin as you author more questions.
            </p>
          </div>
        </Panel>
      </div>

      <Panel
        title="Pace vs stem length"
        subtitle={`Language tags: ${derived.paceStem.languageMistakes} · UK-practice tags: ${derived.paceStem.ukPracticeMistakes}`}
      >
        <PaceVsStemChart points={derived.paceStem.points} buckets={derived.paceStem.buckets} />
      </Panel>

      <Panel title="Activity calendar" subtitle="Last ~12 weeks">
        <ActivityHeatmap data={derived.calendar} />
      </Panel>

      <Panel title="Topic × weekday heatmap" subtitle="Where you practise during the week">
        <TopicHeatmap data={derived.topicHeat} />
      </Panel>

      <Panel title="Weakness analysis" subtitle="Focus next + one-click drills">
        <WeaknessChart items={derived.weaknesses} />
      </Panel>

      {isAdmin ? (
        <p className="text-sm">
          Admin group comparison (opt-out respected):{' '}
          <Link className="text-accent hover:underline" to="/admin/comparison">
            Open comparison →
          </Link>
        </p>
      ) : null}
    </div>
  )
}

function Tile({
  label,
  value,
  hint,
  tone,
}: {
  label: string
  value: string
  hint: string
  tone?: 'good' | 'warn'
}) {
  return (
    <div className="rounded-md border border-border bg-surface px-4 py-3">
      <p className="text-center text-xs font-medium uppercase tracking-wide text-muted">{label}</p>
      <p
        className={
          tone === 'good'
            ? 'mt-1 text-center font-display text-2xl font-bold text-correct'
            : tone === 'warn'
              ? 'mt-1 text-center font-display text-2xl font-bold text-incorrect'
              : 'mt-1 text-center font-display text-2xl font-bold text-fg'
        }
      >
        {value}
      </p>
      <p className="mt-1 text-center text-xs text-muted">{hint}</p>
    </div>
  )
}

function Panel({
  title,
  subtitle,
  children,
}: {
  title: string
  subtitle?: string
  children: ReactNode
}) {
  return (
    <section className="rounded-md border border-border bg-surface p-4">
      <div className="mb-3 text-center">
        <h2 className="font-display text-lg font-semibold">{title}</h2>
        {subtitle ? <p className="text-xs text-muted">{subtitle}</p> : null}
      </div>
      {children}
    </section>
  )
}

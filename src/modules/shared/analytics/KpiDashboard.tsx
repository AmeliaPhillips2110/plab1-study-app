import { useEffect, useMemo, useState, type ReactNode } from 'react'
import { Link } from 'react-router-dom'
import { Badge } from '@/components/ui/Badge'
import { Select } from '@/components/ui/Select'
import { isMissingSchemaError } from '@/lib/schemaErrors'
import {
  isMockSessionType,
  isStudySessionType,
} from '@/modules/shared/analytics/attemptQueries'
import { AccuracyOverTimeChart } from '@/modules/shared/analytics/charts/AccuracyOverTimeChart'
import { ActivityHeatmap } from '@/modules/shared/analytics/charts/ActivityHeatmap'
import { ActivityOverTimeChart } from '@/modules/shared/analytics/charts/ActivityOverTimeChart'
import { CoverageStatusBar } from '@/modules/shared/analytics/charts/CoverageStatusBar'
import { DayOfWeekChart } from '@/modules/shared/analytics/charts/DayOfWeekChart'
import { MistakeBreakdownChart } from '@/modules/shared/analytics/charts/MistakeBreakdownChart'
import { PaceVsStemChart } from '@/modules/shared/analytics/charts/PaceVsStemChart'
import { QpmChart } from '@/modules/shared/analytics/charts/QpmChart'
import { ScoreTrendChart } from '@/modules/shared/analytics/charts/ScoreTrendChart'
import { TimeOfDayChart } from '@/modules/shared/analytics/charts/TimeOfDayChart'
import { TopicAccuracyChart } from '@/modules/shared/analytics/charts/TopicAccuracyChart'
import { TopicHeatmap } from '@/modules/shared/analytics/charts/TopicHeatmap'
import { fetchKpiBundle } from '@/modules/shared/analytics/kpiData'
import {
  computeActivityOverTime,
  computeCalendarHeatmap,
  computeCoverageStatuses,
  computeDayOfWeekActivity,
  computeHeadlineKpis,
  computeMistakeBreakdown,
  computePaceVsStem,
  computeQpmSeries,
  computeScoreTrend,
  computeTimeOfDayActivity,
  computeTimeSpentBreakdown,
  computeTopicAccuracy,
  computeTopicWeekdayHeatmap,
  computeWeaknesses,
  formatDurationHours,
  type CoverageStatusCounts,
  type HeadlineKpis,
  type TimeSpentBreakdown,
} from '@/modules/shared/analytics/kpiMetrics'
import { TopicMasteryRings } from '@/modules/shared/analytics/TopicMasteryRings'
import { computeTopicMastery } from '@/modules/shared/analytics/topicMastery'
import { WeaknessChart } from '@/modules/shared/analytics/WeaknessChart'

type Props = {
  userId?: string | null
  examId?: string | null
  passMarkPercent: number
  isAdmin?: boolean
  /** Force blank shells (e.g. exam not loaded yet). */
  forceEmpty?: boolean
}

const EMPTY_HEADLINES: HeadlineKpis = {
  accuracyPercent: 0,
  attemptCount: 0,
  gradedCount: 0,
  correctCount: 0,
  sessionCount: 0,
  finishedSessionCount: 0,
  coveragePercent: 0,
  uniqueAttempted: 0,
  bankActive: 0,
  qpm: 0,
  activeDays30: 0,
  latestMockPercent: null,
}

const EMPTY_COVERAGE: CoverageStatusCounts = {
  new: 0,
  incorrect: 0,
  correct: 0,
  repeated_correct: 0,
  forgotten: 0,
}

const EMPTY_TIME: TimeSpentBreakdown = {
  totalMs: 0,
  practiceMs: 0,
  testingMs: 0,
  avgMsPerActiveDay: 0,
  activeDays: 0,
}

type TimeScope = 'all' | 'practice' | 'tests'

const TIME_SCOPE_OPTIONS: Array<{ value: TimeScope; label: string }> = [
  { value: 'all', label: 'All' },
  { value: 'practice', label: 'Practice' },
  { value: 'tests', label: 'Tests' },
]

function filterAttemptsByTimeScope<T extends { study_sessions?: { session_type?: string | null } | null }>(
  attempts: T[],
  scope: TimeScope,
): T[] {
  if (scope === 'all') return attempts
  if (scope === 'tests') {
    return attempts.filter((a) => isMockSessionType(a.study_sessions?.session_type))
  }
  return attempts.filter((a) => isStudySessionType(a.study_sessions?.session_type))
}

export function KpiDashboard({
  userId,
  examId,
  passMarkPercent,
  isAdmin,
  forceEmpty,
}: Props) {
  const [loading, setLoading] = useState(Boolean(userId && examId && !forceEmpty))
  const [error, setError] = useState<string | null>(null)
  const [bundle, setBundle] = useState<Awaited<ReturnType<typeof fetchKpiBundle>> | null>(null)
  const [timeScope, setTimeScope] = useState<TimeScope>('all')

  useEffect(() => {
    if (!userId || !examId || forceEmpty) {
      setBundle(null)
      setError(null)
      setLoading(false)
      return
    }
    void (async () => {
      setLoading(true)
      const data = await fetchKpiBundle({ userId, examId })
      setBundle(data)
      setError(data.error)
      setLoading(false)
    })()
  }, [userId, examId, forceEmpty])

  const derived = useMemo(() => {
    if (!bundle) {
      return {
        headlines: EMPTY_HEADLINES,
        scoreTrend: [],
        topicAccuracy: [],
        mistakes: [],
        qpm: [],
        paceStem: { points: [], buckets: [], languageMistakes: 0, ukPracticeMistakes: 0 },
        calendar: [],
        topicHeat: [],
        weaknesses: [],
        topicMastery: [],
        coverageStatuses: EMPTY_COVERAGE,
        activityOverTime: { points: [], topicKeys: [] as string[] },
        timeOfDay: computeTimeOfDayActivity([]),
        dayOfWeek: computeDayOfWeekActivity([]),
        timedHeadlines: EMPTY_HEADLINES,
        timeSpent: EMPTY_TIME,
      }
    }
    const timeAttempts = filterAttemptsByTimeScope(bundle.attempts, timeScope)
    const headlines = computeHeadlineKpis({
      attempts: bundle.attempts,
      sessions: bundle.sessions,
      bankActive: bundle.bankActive,
    })
    const timedHeadlines = computeHeadlineKpis({
      attempts: timeAttempts,
      sessions: bundle.sessions,
      bankActive: bundle.bankActive,
    })
    const topicAccuracy = computeTopicAccuracy(bundle.attempts, bundle.topics)
    const timeSpent = computeTimeSpentBreakdown(
      bundle.attempts,
      isStudySessionType,
      isMockSessionType,
    )
    return {
      headlines,
      timedHeadlines,
      timeSpent,
      scoreTrend: computeScoreTrend(bundle.sessions),
      topicAccuracy,
      mistakes: computeMistakeBreakdown(bundle.attempts),
      qpm: computeQpmSeries(timeAttempts),
      paceStem: computePaceVsStem(timeAttempts),
      calendar: computeCalendarHeatmap(bundle.attempts),
      topicHeat: computeTopicWeekdayHeatmap(bundle.attempts),
      weaknesses: computeWeaknesses(topicAccuracy),
      topicMastery: computeTopicMastery({
        attempts: bundle.attempts,
        topics: bundle.topics,
        bankByTopic: bundle.bankByTopic,
        passMarkPercent,
      }),
      coverageStatuses: computeCoverageStatuses(bundle.attempts, bundle.bankActive),
      activityOverTime: computeActivityOverTime(bundle.attempts, bundle.topics),
      timeOfDay: computeTimeOfDayActivity(timeAttempts),
      dayOfWeek: computeDayOfWeekActivity(timeAttempts),
    }
  }, [bundle, timeScope, passMarkPercent])

  const h = derived.headlines
  const softError = error && isMissingSchemaError(error) ? null : error

  return (
    <div className="flex flex-col gap-8">
      {loading ? <p className="text-center text-sm text-muted">Loading KPIs…</p> : null}
      {softError ? <p className="text-center text-sm text-incorrect">{softError}</p> : null}

      <section className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
        <Tile
          label="Accuracy"
          value={`${h.accuracyPercent}%`}
          hint={`${h.correctCount}/${h.gradedCount} Graded`}
          tone={
            h.gradedCount === 0
              ? undefined
              : h.accuracyPercent >= passMarkPercent
                ? 'good'
                : 'warn'
          }
        />
        <Tile
          label="Attempts"
          value={String(h.attemptCount)}
          hint={`${h.finishedSessionCount} Finished Sessions`}
        />
        <Tile
          label="Coverage"
          value={`${h.coveragePercent}%`}
          hint={`${h.uniqueAttempted}/${h.bankActive} Active Questions`}
        />
        <Tile
          label="Pace"
          value={`${derived.timedHeadlines.qpm}`}
          hint={`Q/Min Avg · ${derived.timedHeadlines.activeDays30} Active Days (30d)`}
        />
      </section>

      <section className="grid gap-3 sm:grid-cols-3">
        <Tile
          label="Time Spent (Practice)"
          value={formatDurationHours(derived.timeSpent.practiceMs)}
          hint="Study / practice sessions"
        />
        <Tile
          label="Time Spent (Testing)"
          value={formatDurationHours(derived.timeSpent.testingMs)}
          hint="Full Test / Unlimited"
        />
        <Tile
          label="Average Time per Day"
          value={formatDurationHours(derived.timeSpent.avgMsPerActiveDay)}
          hint={
            derived.timeSpent.activeDays > 0
              ? `Across ${derived.timeSpent.activeDays} active days`
              : 'No timed attempts yet'
          }
        />
      </section>

      <div className="mx-auto w-full max-w-xs">
        <Select
          label="Time KPIs scope"
          name="time-kpi-scope"
          value={timeScope}
          onChange={(e) => setTimeScope(e.target.value as TimeScope)}
          options={TIME_SCOPE_OPTIONS}
        />
      </div>

      {h.latestMockPercent != null ? (
        <p className="text-center text-sm text-muted">
          Latest Timed Test Score:{' '}
          <Badge tone={h.latestMockPercent >= passMarkPercent ? 'correct' : 'incorrect'}>
            {h.latestMockPercent}%
          </Badge>{' '}
          (Pass Mark {passMarkPercent}%)
        </p>
      ) : null}

      <Panel title="Score Over Time" subtitle={`Daily mean · Pass Mark Line At ${passMarkPercent}%`}>
        <ScoreTrendChart data={derived.scoreTrend} passMark={passMarkPercent} />
      </Panel>

      <div className="grid gap-6 lg:grid-cols-2">
        <Panel title="Accuracy By Specialty">
          <TopicAccuracyChart data={derived.topicAccuracy} passMark={passMarkPercent} />
        </Panel>
        <Panel title="Mistake Breakdown" subtitle="From Tagged Incorrect Attempts">
          <MistakeBreakdownChart data={derived.mistakes} />
        </Panel>
      </div>

      <Panel
        title="Topic Mastery"
        subtitle={`Ready / close / weak vs ${passMarkPercent}% pass · tap a ring to practise`}
      >
        <TopicMasteryRings
          items={derived.topicMastery}
          loading={loading}
          size="md"
          emptyHint="Answer a few SBAs to populate mastery rings."
        />
      </Panel>

      <div className="grid items-stretch gap-6 lg:grid-cols-2">
        <Panel title="Questions Per Minute" subtitle="By Date">
          <QpmChart data={derived.qpm} />
        </Panel>
        <Panel title="Coverage Status">
          <CoverageStatusBar counts={derived.coverageStatuses} />
        </Panel>
      </div>

      <Panel title="Pace Vs Stem Length">
        <PaceVsStemChart points={derived.paceStem.points} buckets={derived.paceStem.buckets} />
      </Panel>

      <Panel title="Activity Over Time">
        <ActivityOverTimeChart
          points={derived.activityOverTime.points}
          topicKeys={derived.activityOverTime.topicKeys}
        />
      </Panel>

      <div className="grid gap-6 lg:grid-cols-2">
        <Panel title="Time Of Day Activity" subtitle="Attempts And Errors By Hour">
          <TimeOfDayChart data={derived.timeOfDay} />
        </Panel>
        <Panel title="Day Of Week Activity" subtitle="Attempts And Errors By Weekday">
          <DayOfWeekChart data={derived.dayOfWeek} />
        </Panel>
      </div>

      <Panel title="% Correct Over Time">
        <AccuracyOverTimeChart points={derived.activityOverTime.points} />
      </Panel>

      <div className="grid gap-6 lg:grid-cols-2">
        <Panel title="Activity Calendar" subtitle="Last ~12 Weeks">
          <ActivityHeatmap data={derived.calendar} />
        </Panel>
        <Panel title="Topic Activity By Weekday">
          <TopicHeatmap data={derived.topicHeat} />
        </Panel>
      </div>

      <Panel title="Weakness Analysis" subtitle="Focus Next + One-Click Drills">
        <WeaknessChart items={derived.weaknesses} />
      </Panel>

      {isAdmin ? (
        <p className="text-center text-sm">
          Admin Group Comparison (Opt-Out Respected):{' '}
          <Link className="text-accent hover:underline" to="/admin/comparison">
            Open Comparison →
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

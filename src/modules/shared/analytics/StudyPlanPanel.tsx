import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { Badge } from '@/components/ui/Badge'
import { Button } from '@/components/ui/Button'
import { supabase } from '@/lib/supabase'
import { fetchAttemptLog } from '@/modules/shared/analytics/attemptQueries'
import {
  buildStudyPlanFromAttempts,
  type StudyPlan,
  type StudySuggestion,
} from '@/modules/shared/analytics/studyPlan'
import type { Topic } from '@/types/database'

type Props = {
  userId: string
  examId: string
  topics: Topic[]
  /** Compact strip for Practice hub; fuller block for Home. */
  variant?: 'home' | 'practice'
  passMarkPercent?: number
}

async function fetchBankByTopic(examId: string): Promise<Record<string, number>> {
  const { data } = await supabase
    .from('questions')
    .select('topic_id')
    .eq('exam_id', examId)
    .eq('is_active', true)
    .eq('question_type', 'sba')

  const bank: Record<string, number> = {}
  for (const row of data ?? []) {
    const tid = (row as { topic_id: string | null }).topic_id
    if (!tid) continue
    bank[tid] = (bank[tid] ?? 0) + 1
  }
  return bank
}

function SuggestionRow({
  item,
  emphasis,
}: {
  item: StudySuggestion
  emphasis?: 'primary' | 'secondary'
}) {
  return (
    <li
      className={[
        'study-plan-row flex flex-col gap-2 border-b border-border/70 py-3 last:border-b-0 sm:flex-row sm:items-center sm:justify-between',
        emphasis === 'primary' ? 'sm:items-start' : '',
      ].join(' ')}
    >
      <div className="min-w-0">
        <div className="mb-1 flex flex-wrap items-center gap-2">
          {emphasis === 'primary' ? <Badge tone="accent">Today</Badge> : null}
          {emphasis === 'secondary' ? <Badge tone="neutral">Also</Badge> : null}
          <span className="font-display text-sm font-semibold text-fg">{item.title}</span>
        </div>
        <p className="text-xs text-muted">{item.reason}</p>
        <p className="mt-0.5 text-xs text-muted">{item.modeLabel}</p>
      </div>
      <Link to={item.href} className="shrink-0">
        <Button variant={emphasis === 'primary' ? 'primary' : 'secondary'}>Start</Button>
      </Link>
    </li>
  )
}

export function StudyPlanPanel({
  userId,
  examId,
  topics,
  variant = 'home',
  passMarkPercent = 65,
}: Props) {
  const [plan, setPlan] = useState<StudyPlan | null>(null)
  const [loading, setLoading] = useState(true)

  const topicKey = topics.map((t) => t.id).join(',')

  useEffect(() => {
    let cancelled = false
    setLoading(true)
    void (async () => {
      const [{ rows }, bankByTopic] = await Promise.all([
        fetchAttemptLog({ userId, examId, limit: 1000 }),
        fetchBankByTopic(examId),
      ])
      if (cancelled) return
      setPlan(
        buildStudyPlanFromAttempts({
          attempts: rows,
          topics,
          bankByTopic,
          passMarkPercent,
          limit: variant === 'practice' ? 4 : 5,
        }),
      )
      setLoading(false)
    })()
    return () => {
      cancelled = true
    }
  }, [userId, examId, topicKey, topics, passMarkPercent, variant])

  if (loading) {
    return (
      <section
        className="w-full max-w-5xl rounded-md border border-border bg-surface px-4 py-5"
        aria-label="Study plan"
      >
        <p className="text-sm text-muted">Building your next session…</p>
      </section>
    )
  }

  if (!plan || plan.suggestions.length === 0) return null

  const showToday = variant === 'home' && plan.today.primary

  return (
    <section
      className="study-plan-panel w-full max-w-5xl rounded-md border border-accent/25 bg-surface px-4 py-5"
      aria-label={showToday ? "Today's plan" : 'Suggested next'}
    >
      <header className="mb-1">
        <h2 className="font-display text-lg font-semibold text-accent">
          {showToday ? "Today's plan" : 'Suggested next'}
        </h2>
        <p className="mt-1 text-sm text-muted">
          {plan.isEmptyState
            ? 'Not much history yet — start with under-covered high-yield topics.'
            : 'Ranked from your accuracy, mistakes, and coverage gaps.'}
        </p>
      </header>

      {showToday ? (
        <ol className="mt-2">
          <SuggestionRow item={plan.today.primary!} emphasis="primary" />
          {plan.today.secondary.map((s) => (
            <SuggestionRow key={s.id} item={s} emphasis="secondary" />
          ))}
        </ol>
      ) : (
        <ol className="mt-2">
          {plan.suggestions.map((s) => (
            <SuggestionRow key={s.id} item={s} />
          ))}
        </ol>
      )}

      {variant === 'home' && plan.suggestions.length > (showToday ? 3 : 0) ? (
        <p className="mt-3 text-xs text-muted">
          More drills live under{' '}
          <Link to="/study" className="text-accent hover:underline">
            Practice
          </Link>
          {' · '}
          <Link to="/kpis" className="text-accent hover:underline">
            KPIs
          </Link>
          .
        </p>
      ) : null}
    </section>
  )
}

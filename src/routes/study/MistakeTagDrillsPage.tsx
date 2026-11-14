import { useEffect, useRef, useState } from 'react'
import { Link, Navigate, useSearchParams } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { EmptyBankHint } from '@/components/EmptyBankHint'
import { Button } from '@/components/ui/Button'
import {
  fetchMistakeTagDrillStats,
  type MistakeTagDrillStat,
} from '@/features/mistakes'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { SessionRunner } from '@/modules/shared/quiz-engine/SessionRunner'
import type { SessionSetupConfig } from '@/types/quiz'

export function MistakeTagDrillsPage() {
  const { user } = useAuth()
  const { loading, exam, error, schemaMissing } = useExam()
  const [searchParams, setSearchParams] = useSearchParams()
  const [stats, setStats] = useState<MistakeTagDrillStat[]>([])
  const [totalQuestions, setTotalQuestions] = useState(0)
  const [statsError, setStatsError] = useState<string | null>(null)
  const [statsLoading, setStatsLoading] = useState(true)
  const [run, setRun] = useState<{ id: string; config: SessionSetupConfig; title: string } | null>(
    null,
  )
  const autostartConsumed = useRef(false)

  useEffect(() => {
    if (!user || !exam) {
      setStatsLoading(Boolean(loading))
      return
    }
    let cancelled = false
    setStatsLoading(true)
    void fetchMistakeTagDrillStats({ examId: exam.id, userId: user.id }).then((res) => {
      if (cancelled) return
      setStats(res.stats)
      setTotalQuestions(res.totalQuestions)
      setStatsError(res.error)
      setStatsLoading(false)
    })
    return () => {
      cancelled = true
    }
  }, [user, exam, loading, run?.id])

  useEffect(() => {
    if (run || statsLoading || !exam || autostartConsumed.current) return
    const tag = searchParams.get('tag')
    const autostart = searchParams.get('autostart') === '1'
    if (!tag || !autostart) return
    const stat = stats.find((s) => s.tag === tag && s.questionCount > 0)
    if (!stat) return
    autostartConsumed.current = true
    setSearchParams({}, { replace: true })
    setRun({
      id: crypto.randomUUID(),
      title: `Drill · ${stat.label}`,
      config: {
        examId: exam.id,
        sessionType: 'random',
        presentationFormat: 'sba',
        questionIds: stat.questionIds,
        questionLimit: stat.questionIds.length,
      },
    })
  }, [run, statsLoading, exam, searchParams, stats, setSearchParams])

  if (!user) return <Navigate to="/login" replace />

  if (run && exam) {
    return (
      <AppShell title={run.title}>
        <SessionRunner
          key={run.id}
          userId={user.id}
          config={run.config}
          onExit={() => setRun(null)}
        />
      </AppShell>
    )
  }

  function startDrill(stat: MistakeTagDrillStat) {
    if (!exam || stat.questionCount === 0) return
    setRun({
      id: crypto.randomUUID(),
      title: `Drill · ${stat.label}`,
      config: {
        examId: exam.id,
        sessionType: 'random',
        presentationFormat: 'sba',
        questionIds: stat.questionIds,
        questionLimit: stat.questionIds.length,
      },
    })
  }

  const taggedStats = stats.filter((s) => s.questionCount > 0)

  return (
    <AppShell title="Mistake-Tag Drills">
      {loading || statsLoading ? <p className="text-sm text-muted">Loading tagged misses…</p> : null}
      {!schemaMissing && error ? <p className="mb-4 text-sm text-incorrect">{error}</p> : null}
      {statsError ? <p className="mb-4 text-sm text-incorrect">{statsError}</p> : null}
      <div className="mb-4">
        <EmptyBankHint examMissing={!loading && (!exam || schemaMissing)} />
      </div>

      {exam && !statsLoading ? (
        totalQuestions === 0 ? (
          <div className="mx-auto flex w-full max-w-xl flex-col gap-3 rounded-md border border-accent/25 bg-accent-subtle px-5 py-6 text-center">
            <p className="font-display text-lg font-semibold text-accent">No tagged misses yet</p>
            <p className="text-sm text-muted">
              After a wrong answer in Practice or Tests, pick a Mistake tag (for example Did not
              read correctly or NICE Guideline), then return here to drill those questions.
            </p>
            <Link
              to="/study"
              className="mx-auto mt-1 text-sm font-medium text-accent underline-offset-2 hover:underline"
            >
              Back to Practice
            </Link>
          </div>
        ) : (
          <div className="mx-auto flex w-full max-w-xl flex-col gap-3">
            <p className="text-center text-sm text-muted">
              Pick a mistake tag to start an SBA session of questions you previously tagged that
              way.
            </p>
            <ul className="flex flex-col gap-2">
              {taggedStats.map((stat) => (
                <li key={stat.tag}>
                  <div className="flex items-center justify-between gap-3 rounded-md border border-border bg-surface px-4 py-3 transition hover:border-accent hover:bg-accent-subtle">
                    <div className="min-w-0">
                      <p className="font-display text-base font-semibold text-accent">{stat.label}</p>
                      <p className="text-sm tabular-nums text-muted">
                        {stat.questionCount}{' '}
                        {stat.questionCount === 1 ? 'question' : 'questions'}
                      </p>
                    </div>
                    <Button
                      type="button"
                      data-testid={`mistake-drill-start-${stat.tag}`}
                      onClick={() => startDrill(stat)}
                    >
                      Start
                    </Button>
                  </div>
                </li>
              ))}
            </ul>
          </div>
        )
      ) : !loading && !exam && !statsLoading ? (
        <p className="text-sm text-muted">No exam loaded yet.</p>
      ) : null}
    </AppShell>
  )
}

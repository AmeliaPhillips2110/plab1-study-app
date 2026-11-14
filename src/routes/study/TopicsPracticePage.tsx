import { useEffect, useMemo, useRef, useState, type FormEvent } from 'react'
import { Navigate, useSearchParams } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { EmptyBankHint } from '@/components/EmptyBankHint'
import { Button } from '@/components/ui/Button'
import { Select } from '@/components/ui/Select'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { SessionRunner } from '@/modules/shared/quiz-engine/SessionRunner'
import type { SessionSetupConfig } from '@/types/quiz'

function parseLimit(raw: string | null): number {
  const n = Number(raw ?? 20)
  if (!Number.isFinite(n)) return 20
  return Math.min(40, Math.max(5, Math.round(n)))
}

export function TopicsPracticePage() {
  const { user } = useAuth()
  const { loading, exam, topics, error, schemaMissing } = useExam()
  const [searchParams] = useSearchParams()
  const paramTopicId = searchParams.get('topicId') ?? ''
  const autostart = searchParams.get('autostart') === '1'
  const questionLimit = parseLimit(searchParams.get('limit'))

  const [topicOverride, setTopicOverride] = useState<string | null>(null)
  const [run, setRun] = useState<{ id: string; config: SessionSetupConfig } | null>(null)
  const autostarted = useRef(false)

  const topicOptions = useMemo(
    () => topics.map((t) => ({ value: t.id, label: t.name })),
    [topics],
  )

  const knownTopic =
    (topicOverride && topics.some((t) => t.id === topicOverride) ? topicOverride : null) ||
    (paramTopicId && topics.some((t) => t.id === paramTopicId) ? paramTopicId : null) ||
    topics[0]?.id ||
    ''

  useEffect(() => {
    if (!autostart || autostarted.current || !exam || !knownTopic || !user) return
    autostarted.current = true
    setRun({
      id: crypto.randomUUID(),
      config: {
        examId: exam.id,
        sessionType: 'topic',
        presentationFormat: 'sba',
        topicId: knownTopic,
        questionLimit,
      },
    })
  }, [autostart, exam, knownTopic, questionLimit, user])

  if (!user) return <Navigate to="/login" replace />

  if (run && exam) {
    return (
      <AppShell title="Topics">
        <SessionRunner
          key={run.id}
          userId={user.id}
          config={run.config}
          onExit={() => {
            autostarted.current = true
            setRun(null)
          }}
        />
      </AppShell>
    )
  }

  function onStart(e: FormEvent) {
    e.preventDefault()
    if (!exam || !knownTopic) return
    setRun({
      id: crypto.randomUUID(),
      config: {
        examId: exam.id,
        sessionType: 'topic',
        presentationFormat: 'sba',
        topicId: knownTopic,
        questionLimit,
      },
    })
  }

  return (
    <AppShell title="Topics">
      {loading ? <p className="text-sm text-muted">Loading exam…</p> : null}
      {!schemaMissing && error ? <p className="mb-4 text-sm text-incorrect">{error}</p> : null}
      <div className="mb-4">
        <EmptyBankHint examMissing={!loading && (!exam || schemaMissing)} />
      </div>
      {exam ? (
        <form
          onSubmit={onStart}
          className="flex w-full flex-col gap-4 rounded-md border border-border bg-surface p-4"
        >
          {topicOptions.length > 0 ? (
            <Select
              label="Topic"
              name="topic"
              value={knownTopic}
              onChange={(e) => setTopicOverride(e.target.value)}
              options={topicOptions}
            />
          ) : (
            <p className="text-sm text-muted">No topics loaded yet.</p>
          )}
          <Button type="submit" disabled={!knownTopic}>
            Start
          </Button>
        </form>
      ) : !loading ? (
        <p className="text-sm text-muted">No exam loaded yet.</p>
      ) : null}
    </AppShell>
  )
}

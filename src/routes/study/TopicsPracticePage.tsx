import { useMemo, useState, type FormEvent } from 'react'
import { Navigate } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { EmptyBankHint } from '@/components/EmptyBankHint'
import { Button } from '@/components/ui/Button'
import { Select } from '@/components/ui/Select'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { SessionRunner } from '@/modules/shared/quiz-engine/SessionRunner'
import type { SessionSetupConfig } from '@/types/quiz'

export function TopicsPracticePage() {
  const { user } = useAuth()
  const { loading, exam, topics, error, schemaMissing } = useExam()
  const [topicId, setTopicId] = useState('')
  const [run, setRun] = useState<{ id: string; config: SessionSetupConfig } | null>(null)

  const topicOptions = useMemo(
    () => topics.map((t) => ({ value: t.id, label: t.name })),
    [topics],
  )

  const effectiveTopic = topicId || topics[0]?.id || ''

  if (!user) return <Navigate to="/login" replace />

  if (run && exam) {
    return (
      <AppShell title="Topics">
        <SessionRunner
          key={run.id}
          userId={user.id}
          config={run.config}
          onExit={() => setRun(null)}
        />
      </AppShell>
    )
  }

  function onStart(e: FormEvent) {
    e.preventDefault()
    if (!exam || !effectiveTopic) return
    setRun({
      id: crypto.randomUUID(),
      config: {
        examId: exam.id,
        sessionType: 'topic',
        presentationFormat: 'sba',
        topicId: effectiveTopic,
        questionLimit: 20,
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
              value={effectiveTopic}
              onChange={(e) => setTopicId(e.target.value)}
              options={topicOptions}
            />
          ) : (
            <p className="text-sm text-muted">No topics loaded yet.</p>
          )}
          <Button type="submit" disabled={!effectiveTopic}>
            Start
          </Button>
        </form>
      ) : !loading ? (
        <p className="text-sm text-muted">No exam loaded yet.</p>
      ) : null}
    </AppShell>
  )
}

import { useEffect, useState } from 'react'
import { Badge } from '@/components/ui/Badge'
import {
  fetchGroupComparison,
  type GroupComparison as GroupComparisonData,
} from '@/modules/shared/analytics/comparison'

type Props = {
  examId: string
  currentUserId: string
}

export function GroupComparison({ examId, currentUserId }: Props) {
  const [data, setData] = useState<GroupComparisonData | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    void (async () => {
      setLoading(true)
      const res = await fetchGroupComparison({ examId, currentUserId })
      setData(res.data)
      setError(res.error)
      setLoading(false)
    })()
  }, [examId, currentUserId])

  if (loading) return <p className="text-sm text-muted">Loading comparison…</p>
  if (error) return <p className="text-sm text-incorrect">{error}</p>
  if (!data) return null

  const delta =
    data.currentUserAccuracy != null
      ? Math.round((data.currentUserAccuracy - data.groupAverageAccuracy) * 10) / 10
      : null

  return (
    <div className="flex flex-col gap-4">
      <p className="text-sm text-muted">
        Peer comparison includes only students who have not opted out (
        <code className="text-fg">comparison_opt_out = false</code>). Opted-out accounts are excluded
        from the group average.
      </p>

      <div className="grid gap-3 sm:grid-cols-3">
        <Stat label="Opted in" value={String(data.optedInCount)} />
        <Stat label="Opted out" value={String(data.optedOutCount)} />
        <Stat label="Group avg accuracy" value={`${data.groupAverageAccuracy}%`} />
      </div>

      {data.currentUserAccuracy != null ? (
        <p className="text-sm">
          Your accuracy: <Badge tone="accent">{data.currentUserAccuracy}%</Badge>
          {delta != null ? (
            <>
              {' '}
              · vs group{' '}
              <Badge tone={delta >= 0 ? 'correct' : 'incorrect'}>
                {delta >= 0 ? '+' : ''}
                {delta} pts
              </Badge>
            </>
          ) : null}
        </p>
      ) : (
        <p className="text-sm text-muted">You have no graded attempts in this exam yet.</p>
      )}

      {data.peers.length === 0 ? (
        <p className="text-sm text-muted">No opted-in students to compare yet.</p>
      ) : (
        <ul className="flex flex-col gap-2">
          {data.peers.map((p) => (
            <li
              key={p.userId}
              className="flex flex-wrap items-center justify-between gap-2 rounded-md border border-border bg-surface px-3 py-2 text-sm"
            >
              <span className="font-medium">
                {p.displayName}
                {p.isCurrentUser ? <Badge tone="accent">You</Badge> : null}
              </span>
              <span className="text-muted">
                {p.accuracyPercent}% · {p.correctCount}/{p.gradedCount} graded · {p.attemptCount}{' '}
                attempts
              </span>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}

function Stat({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-md border border-border bg-surface px-3 py-2">
      <p className="text-xs text-muted">{label}</p>
      <p className="text-lg font-semibold">{value}</p>
    </div>
  )
}

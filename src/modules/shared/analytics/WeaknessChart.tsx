import { Link } from 'react-router-dom'
import { Badge } from '@/components/ui/Badge'
import { Button } from '@/components/ui/Button'
import type { WeaknessItem } from '@/modules/shared/analytics/kpiMetrics'

type Props = {
  items: WeaknessItem[]
}

export function WeaknessChart({ items }: Props) {
  if (items.length === 0) {
    return (
      <div className="rounded border border-dashed border-border bg-bg px-4 py-8 text-center">
        <div className="mx-auto mb-3 h-2 w-full max-w-md rounded-full bg-border">
          <div className="h-full w-1/3 rounded-full bg-accent/30" />
        </div>
      </div>
    )
  }

  return (
    <div className="flex flex-col gap-4">
      <ol className="flex flex-col gap-3">
        {items.map((item, i) => (
          <li
            key={item.topicId}
            className="flex flex-col gap-2 rounded border border-border bg-bg px-3 py-3 sm:flex-row sm:items-center sm:justify-between"
          >
            <div>
              <div className="mb-1 flex flex-wrap items-center gap-2">
                <Badge tone="accent">#{i + 1}</Badge>
                <span className="font-medium">{item.topic}</span>
                <Badge tone={item.accuracy < 65 ? 'incorrect' : 'neutral'}>{item.accuracy}%</Badge>
                <span className="text-xs text-muted">
                  {item.correct}/{item.total} Graded
                </span>
              </div>
              <p className="text-xs text-muted">{item.focusReason}</p>
            </div>
            <Link
              to={`/study/topics?topicId=${encodeURIComponent(item.topicId)}&limit=15&autostart=1`}
            >
              <Button variant="secondary">Drill This Topic</Button>
            </Link>
          </li>
        ))}
      </ol>

      <div className="flex flex-wrap gap-2">
        <Link to="/study/error-tests">
          <Button>Error Tests</Button>
        </Link>
        <Link to="/study/most-missed">
          <Button variant="secondary">Most Missed</Button>
        </Link>
        <Link to="/study/topics">
          <Button variant="ghost">Topics</Button>
        </Link>
      </div>
    </div>
  )
}

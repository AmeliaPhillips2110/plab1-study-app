import { useMemo } from 'react'
import type { TopicDayCell } from '@/modules/shared/analytics/kpiMetrics'
import { cn } from '@/lib/cn'

const DAYS = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']

type Props = { data: TopicDayCell[] }

export function TopicHeatmap({ data }: Props) {
  const { topics, max, matrix } = useMemo(() => {
    const topicSet = [...new Set(data.map((d) => d.topic))].sort()
    const map = new Map(data.map((d) => [`${d.topic}||${d.day}`, d.count]))
    // Remap Sun-start weekday labels from kpiMetrics to Mon-first display
    const remapped = new Map<string, number>()
    for (const [key, count] of map) {
      remapped.set(key, count)
    }
    const m = Math.max(0, ...data.map((d) => d.count))
    return { topics: topicSet.slice(0, 12), max: m, matrix: remapped }
  }, [data])

  if (topics.length === 0) {
    const placeholderTopics = ['Cardiology', 'Respiratory', 'Ethics']
    return (
      <div className="relative overflow-x-auto">
        <table className="w-full min-w-[28rem] border-collapse text-xs">
          <thead>
            <tr>
              <th className="p-1 text-left font-medium text-muted">Topic</th>
              {DAYS.map((d) => (
                <th key={d} className="p-1 text-center font-medium text-muted">
                  {d}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {placeholderTopics.map((topic) => (
              <tr key={topic}>
                <td className="max-w-[8rem] truncate p-1 text-muted">{topic}</td>
                {DAYS.map((day) => (
                  <td key={day} className="p-1">
                    <div className="mx-auto h-5 w-full max-w-[2rem] rounded-sm bg-border/30" />
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
        <p className="mt-3 text-center text-sm text-muted">No topic×day activity yet.</p>
      </div>
    )
  }

  function cell(topic: string, day: string) {
    // kpiMetrics uses Sun..Sat abbreviations matching DAYS except order
    const count = matrix.get(`${topic}||${day}`) ?? 0
    const t = max <= 0 ? 0 : count / max
    return { count, cls: count === 0 ? 'bg-border/30' : t > 0.66 ? 'bg-accent' : t > 0.33 ? 'bg-accent/60' : 'bg-accent/30' }
  }

  return (
    <div className="overflow-x-auto">
      <table className="w-full min-w-[28rem] border-collapse text-xs">
        <thead>
          <tr>
            <th className="p-1 text-left font-medium text-muted">Topic</th>
            {DAYS.map((d) => (
              <th key={d} className="p-1 text-center font-medium text-muted">
                {d}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {topics.map((topic) => (
            <tr key={topic}>
              <td className="max-w-[8rem] truncate p-1 text-muted" title={topic}>
                {topic}
              </td>
              {DAYS.map((day) => {
                const { count, cls } = cell(topic, day)
                return (
                  <td key={day} className="p-1">
                    <div
                      title={`${topic} · ${day}: ${count}`}
                      className={cn('mx-auto h-5 w-full max-w-[2rem] rounded-sm', cls)}
                    />
                  </td>
                )
              })}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}

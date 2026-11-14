import { Link } from 'react-router-dom'
import { cn } from '@/lib/cn'
import {
  MASTERY_RING_TRACK,
  MASTERY_STATUS_COLORS,
  MASTERY_STATUS_LABELS,
  masteryPracticeHref,
  type MasteryStatus,
  type TopicMastery,
} from '@/modules/shared/analytics/topicMastery'

type Props = {
  items: TopicMastery[]
  loading?: boolean
  /** Compact home density vs slightly larger KPI density. */
  size?: 'sm' | 'md'
  className?: string
  emptyHint?: string
}

const SIZE = {
  sm: { box: 64, stroke: 5, label: 'text-[10px] leading-tight', pct: 'text-[11px]' },
  md: { box: 76, stroke: 6, label: 'text-[11px] leading-tight', pct: 'text-xs' },
} as const

function shortLabel(name: string): string {
  const parts = name.trim().split(/\s+/)
  if (parts.length === 1) return name.length <= 10 ? name : `${name.slice(0, 8)}…`
  if (name.length <= 12) return name
  const initials = parts
    .filter((p) => !/^(and|of|the|&)$/i.test(p))
    .slice(0, 3)
    .map((p) => p[0]?.toUpperCase() ?? '')
    .join('')
  return initials || name.slice(0, 8)
}

function MasteryRingButton({
  item,
  size,
}: {
  item: TopicMastery
  size: 'sm' | 'md'
}) {
  const s = SIZE[size]
  const r = (s.box - s.stroke) / 2
  const c = 2 * Math.PI * r
  const fill = Math.min(100, Math.max(0, item.ringPercent))
  const offset = c * (1 - fill / 100)
  const color = MASTERY_STATUS_COLORS[item.status]
  const href = masteryPracticeHref(item.topicId)
  const accLabel = item.accuracy == null ? '—' : `${Math.round(item.accuracy)}%`
  const covPct = Math.round(item.coverage * 100)
  const title = `${item.topic}: ${MASTERY_STATUS_LABELS[item.status]} · ${accLabel} accuracy · ${covPct}% coverage — tap to practise`

  return (
    <Link
      to={href}
      title={title}
      aria-label={`Practise ${item.topic}, ${MASTERY_STATUS_LABELS[item.status]}, ${accLabel} accuracy`}
      className={cn(
        'group flex w-[4.85rem] flex-col items-center gap-1 rounded-md outline-offset-2',
        'transition-[transform,opacity] duration-200 ease-out',
        'hover:-translate-y-0.5 hover:opacity-95 focus-visible:outline focus-visible:outline-2 focus-visible:outline-accent',
        'motion-reduce:transition-none motion-reduce:hover:translate-y-0',
      )}
    >
      <span className="relative inline-flex" style={{ width: s.box, height: s.box }}>
        <svg
          width={s.box}
          height={s.box}
          viewBox={`0 0 ${s.box} ${s.box}`}
          className="shrink-0 -rotate-90"
          aria-hidden
        >
          <circle
            cx={s.box / 2}
            cy={s.box / 2}
            r={r}
            fill="none"
            stroke={MASTERY_RING_TRACK}
            strokeWidth={s.stroke}
            className="dark:opacity-40"
          />
          <circle
            cx={s.box / 2}
            cy={s.box / 2}
            r={r}
            fill="none"
            stroke={color}
            strokeWidth={s.stroke}
            strokeLinecap="round"
            strokeDasharray={c}
            strokeDashoffset={offset}
            className="transition-[stroke-dashoffset] duration-500 ease-out motion-reduce:transition-none"
          />
        </svg>
        <span
          className={cn(
            'pointer-events-none absolute inset-0 flex items-center justify-center font-display font-semibold tabular-nums text-fg',
            s.pct,
          )}
        >
          {accLabel}
        </span>
      </span>
      <span
        className={cn(
          'max-w-full truncate text-center font-display font-medium text-fg',
          s.label,
        )}
      >
        {shortLabel(item.topic)}
      </span>
      <span className="text-[9px] font-medium uppercase tracking-wide" style={{ color }}>
        {MASTERY_STATUS_LABELS[item.status]}
      </span>
    </Link>
  )
}

function LegendDot({ status }: { status: MasteryStatus }) {
  return (
    <li className="inline-flex items-center gap-1.5">
      <span
        className="inline-block h-2.5 w-2.5 rounded-full"
        style={{ backgroundColor: MASTERY_STATUS_COLORS[status] }}
        aria-hidden
      />
      {MASTERY_STATUS_LABELS[status]}
    </li>
  )
}

export function TopicMasteryRings({
  items,
  loading,
  size = 'sm',
  className,
  emptyHint = 'No topics yet.',
}: Props) {
  if (loading) {
    return <p className="text-sm text-muted">Loading mastery…</p>
  }
  if (items.length === 0) {
    return <p className="text-sm text-muted">{emptyHint}</p>
  }

  return (
    <div className={cn('flex flex-col gap-3', className)}>
      <ul className="flex flex-wrap items-start justify-center gap-x-2 gap-y-4 sm:justify-start">
        {items.map((item, i) => (
          <li
            key={item.topicId}
            className="animate-[mastery-fade_0.45s_ease-out_both] motion-reduce:animate-none"
            style={{ animationDelay: `${Math.min(i, 24) * 28}ms` }}
          >
            <MasteryRingButton item={item} size={size} />
          </li>
        ))}
      </ul>
      <ul className="flex flex-wrap justify-center gap-x-4 gap-y-1 text-xs text-muted sm:justify-start">
        <LegendDot status="ready" />
        <LegendDot status="close" />
        <LegendDot status="weak" />
        <li className="text-muted/80">Tap a ring to practise</li>
      </ul>
    </div>
  )
}

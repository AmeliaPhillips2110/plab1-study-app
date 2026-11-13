import { computePace, formatDuration } from '@/modules/shared/quiz-engine/pace'
import { cn } from '@/lib/cn'

type Props = {
  elapsedSec: number
  timeLimitSec: number
  answeredCount: number
  totalQuestions: number
  compact?: boolean
}

export function PaceWidget({
  elapsedSec,
  timeLimitSec,
  answeredCount,
  totalQuestions,
  compact,
}: Props) {
  const pace = computePace({ elapsedSec, timeLimitSec, answeredCount, totalQuestions })
  const label =
    pace.status === 'ahead' ? 'Ahead Of Pace' : pace.status === 'behind' ? 'Behind Pace' : 'On Pace'

  return (
    <div
      className={cn(
        'rounded-md border border-border bg-surface px-3 py-2 text-sm',
        pace.status === 'ahead' && 'border-correct/40',
        pace.status === 'behind' && 'border-incorrect/40',
      )}
      aria-live="polite"
    >
      <div className="flex flex-wrap items-center justify-between gap-2">
        <span className="font-medium">{label}</span>
        <span className="text-muted">
          {answeredCount}/{totalQuestions} Answered
        </span>
      </div>
      {!compact ? (
        <dl className="mt-2 grid grid-cols-2 gap-2 text-xs text-muted sm:grid-cols-3">
          <div>
            <dt>Elapsed</dt>
            <dd className="font-medium text-fg">{formatDuration(pace.elapsedSec)}</dd>
          </div>
          <div>
            <dt>Remaining</dt>
            <dd className="font-medium text-fg">{formatDuration(pace.remainingSec)}</dd>
          </div>
          <div>
            <dt>Your Avg / Q</dt>
            <dd className="font-medium text-fg">
              {pace.secondsPerAnswered != null
                ? formatDuration(Math.round(pace.secondsPerAnswered))
                : '—'}
            </dd>
          </div>
        </dl>
      ) : (
        <p className="mt-1 text-xs text-muted">
          Δ {pace.deltaVsPace >= 0 ? '+' : ''}
          {pace.deltaVsPace.toFixed(1)} vs expected · left {formatDuration(pace.remainingSec)}
        </p>
      )}
    </div>
  )
}

import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { countGuidelineHotspots } from '@/features/guidelines/hotspots'
import { countMissFlashcards } from '@/features/mistakes/missFlashcards'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { STUDY_MODES } from '@/modules/plab1/modeRoutes'

type ModeCounts = {
  'guideline-hotspots'?: number | null
  'active-recall'?: number | null
}

export function StudyHubPage() {
  const { user } = useAuth()
  const { exam } = useExam()
  const [counts, setCounts] = useState<ModeCounts>({})

  useEffect(() => {
    if (!exam?.id) return
    let cancelled = false

    void (async () => {
      const next: ModeCounts = {}
      const hotspots = await countGuidelineHotspots(exam.id)
      if (!cancelled) next['guideline-hotspots'] = hotspots.error ? null : hotspots.count

      if (user?.id) {
        const misses = await countMissFlashcards(exam.id, user.id)
        if (!cancelled) next['active-recall'] = misses.error ? null : misses.count
      } else if (!cancelled) {
        next['active-recall'] = 0
      }

      if (!cancelled) setCounts(next)
    })()

    return () => {
      cancelled = true
    }
  }, [exam?.id, user?.id])

  return (
    <AppShell title="Practice">
      <div className="mx-auto flex w-full max-w-4xl flex-col gap-4">
        <p className="text-center text-sm text-muted">
          Choose a practice mode. Each option opens ready to start.
        </p>
        <ul className="grid grid-cols-1 gap-3 sm:grid-cols-2">
          {STUDY_MODES.map((m) => {
            const count =
              m.slug === 'guideline-hotspots'
                ? counts['guideline-hotspots']
                : m.slug === 'active-recall'
                  ? counts['active-recall']
                  : undefined
            const countLabel =
              count === undefined
                ? null
                : count === null
                  ? null
                  : m.slug === 'active-recall'
                    ? `${count} card${count === 1 ? '' : 's'} from misses`
                    : `${count} hotspot${count === 1 ? '' : 's'} in bank`

            return (
              <li key={m.slug} className="min-h-0">
                <Link
                  to={`/study/${m.slug}`}
                  className="flex h-full w-full flex-col gap-1 rounded-md border border-border bg-surface px-4 py-3 text-left transition hover:border-accent hover:bg-accent-subtle"
                >
                  <span className="flex flex-wrap items-baseline justify-between gap-2">
                    <span className="font-display text-base font-semibold text-accent">{m.title}</span>
                    {countLabel ? (
                      <span className="text-xs font-medium tabular-nums text-muted">{countLabel}</span>
                    ) : null}
                  </span>
                  <span className="text-sm text-muted">{m.description}</span>
                </Link>
              </li>
            )
          })}
        </ul>
      </div>
    </AppShell>
  )
}

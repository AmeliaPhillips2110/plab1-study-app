import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { fetchGlossaryTerms } from '@/features/glossary/glossaryApi'
import { DEFAULT_READING_WPM, saveReadingSpeedWpm } from '@/features/preferences/readingSpeed'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import type { GlossaryTerm } from '@/types/database'

export function GlossaryPage() {
  const { user, profile, preferences, refreshProfile, isAdmin } = useAuth()
  const { exam, loading: examLoading, error: examError } = useExam()
  const [terms, setTerms] = useState<GlossaryTerm[]>([])
  const [q, setQ] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [wpm, setWpm] = useState(String(preferences?.reading_speed_wpm ?? DEFAULT_READING_WPM))
  const [wpmMsg, setWpmMsg] = useState<string | null>(null)

  useEffect(() => {
    setWpm(String(preferences?.reading_speed_wpm ?? DEFAULT_READING_WPM))
  }, [preferences?.reading_speed_wpm])

  useEffect(() => {
    if (!exam) return
    void (async () => {
      const { terms: rows, error: err } = await fetchGlossaryTerms(exam.id)
      if (err) setError(err)
      else setTerms(rows)
    })()
  }, [exam])

  const filtered = useMemo(() => {
    const needle = q.trim().toLowerCase()
    if (!needle) return terms
    return terms.filter(
      (t) =>
        t.term.toLowerCase().includes(needle) ||
        t.definition.toLowerCase().includes(needle) ||
        (t.aliases ?? []).some((a) => a.toLowerCase().includes(needle)),
    )
  }, [terms, q])

  async function saveWpm() {
    if (!user) return
    setWpmMsg(null)
    const { error: err } = await saveReadingSpeedWpm(user.id, Number(wpm) || DEFAULT_READING_WPM)
    if (err) setWpmMsg(err)
    else {
      setWpmMsg('Saved reading speed.')
      await refreshProfile()
    }
  }

  return (
    <AppShell title="Glossary">
      <div className="mx-auto max-w-3xl space-y-6">
        <div className="flex flex-wrap items-end justify-between gap-3">
          <div>
            <p className="text-sm text-muted">
              English PLAB terms — tap or hover underlined words in stems for the same definitions.
            </p>
          </div>
          {isAdmin ? (
            <Link to="/admin/glossary" className="text-sm font-medium text-accent hover:underline">
              Edit glossary
            </Link>
          ) : null}
        </div>

        <section className="rounded-md border border-border bg-surface p-4">
          <h2 className="mb-2 text-sm font-semibold">Reading speed (WPM)</h2>
          <p className="mb-3 text-xs text-muted">
            Used for long-stem reading tips and pace-vs-length analytics. Typical study reading is
            150–250 WPM.
          </p>
          <div className="flex flex-wrap items-end gap-2">
            <Input
              label="Words per minute"
              name="wpm"
              type="number"
              min={80}
              max={600}
              value={wpm}
              onChange={(e) => setWpm(e.target.value)}
              className="max-w-[10rem]"
            />
            <Button type="button" variant="secondary" onClick={() => void saveWpm()}>
              Save
            </Button>
          </div>
          {wpmMsg ? <p className="mt-2 text-xs text-muted">{wpmMsg}</p> : null}
          {profile ? null : (
            <p className="mt-2 text-xs text-muted">Sign in to persist reading speed.</p>
          )}
        </section>

        <Input
          value={q}
          onChange={(e) => setQ(e.target.value)}
          placeholder="Search terms…"
          aria-label="Search glossary"
        />

        {examLoading ? <p className="text-sm text-muted">Loading…</p> : null}
        {examError || error ? (
          <p className="text-sm text-incorrect">{examError || error}</p>
        ) : null}

        <ul className="divide-y divide-border rounded-lg border border-border bg-surface">
          {filtered.length === 0 ? (
            <li className="px-4 py-8 text-center text-sm text-muted">No matching terms.</li>
          ) : (
            filtered.map((t) => (
              <li key={t.id} className="px-4 py-3">
                <p className="font-semibold text-fg">{t.term}</p>
                <p className="mt-1 text-sm text-muted">{t.definition}</p>
                {t.aliases?.length ? (
                  <p className="mt-1 text-xs text-muted">Also: {t.aliases.join(', ')}</p>
                ) : null}
              </li>
            ))
          )}
        </ul>
      </div>
    </AppShell>
  )
}

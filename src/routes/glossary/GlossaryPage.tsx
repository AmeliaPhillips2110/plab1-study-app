import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { SetupMissingNotice } from '@/components/layout/SetupMissingNotice'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { fetchGlossaryTerms } from '@/features/glossary/glossaryApi'
import { DEFAULT_READING_WPM, saveReadingSpeedWpm } from '@/features/preferences/readingSpeed'
import { useAuth } from '@/hooks/useAuth'
import { useExam } from '@/hooks/useExam'
import { isMissingSchemaError } from '@/lib/schemaErrors'
import type { GlossaryTerm } from '@/types/database'
import { cn } from '@/lib/cn'

const SECTION_ORDER = [
  'Exam & PLAB',
  'UK systems',
  'Acute care',
  'Cardiology',
  'Respiratory',
  'Endocrine',
  'Renal',
  'Neurology',
  'Paediatrics',
  'Ethics & law',
  'General',
]

function sectionRank(section: string): number {
  const i = SECTION_ORDER.indexOf(section)
  return i >= 0 ? i : SECTION_ORDER.length
}

export function GlossaryPage() {
  const { user, preferences, refreshProfile, isAdmin } = useAuth()
  const { exam, loading: examLoading, error: examError, schemaMissing } = useExam()
  const [terms, setTerms] = useState<GlossaryTerm[]>([])
  const [q, setQ] = useState('')
  const [theme, setTheme] = useState<string>('All')
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

  const themes = useMemo(() => {
    const set = new Set<string>()
    for (const t of terms) set.add(t.section?.trim() || 'General')
    return ['All', ...[...set].sort((a, b) => sectionRank(a) - sectionRank(b) || a.localeCompare(b))]
  }, [terms])

  const filtered = useMemo(() => {
    const needle = q.trim().toLowerCase()
    return terms.filter((t) => {
      const section = t.section?.trim() || 'General'
      if (theme !== 'All' && section !== theme) return false
      if (!needle) return true
      return (
        t.term.toLowerCase().includes(needle) ||
        t.definition.toLowerCase().includes(needle) ||
        section.toLowerCase().includes(needle) ||
        (t.aliases ?? []).some((a) => a.toLowerCase().includes(needle))
      )
    })
  }, [terms, q, theme])

  const bySection = useMemo(() => {
    const map = new Map<string, GlossaryTerm[]>()
    for (const t of filtered) {
      const key = t.section?.trim() || 'General'
      const list = map.get(key) ?? []
      list.push(t)
      map.set(key, list)
    }
    return [...map.entries()].sort((a, b) => {
      const rank = sectionRank(a[0]) - sectionRank(b[0])
      if (rank !== 0) return rank
      return a[0].localeCompare(b[0])
    })
  }, [filtered])

  const alphabetical = useMemo(
    () => [...filtered].sort((a, b) => a.term.localeCompare(b.term, undefined, { sensitivity: 'base' })),
    [filtered],
  )

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

  const softGlossaryError = error && isMissingSchemaError(error) ? null : error

  return (
    <AppShell title="Glossary">
      <div className="mx-auto flex max-w-3xl flex-col gap-6">
        {schemaMissing ? <SetupMissingNotice /> : null}

        <div className="flex flex-wrap items-end justify-center gap-3 text-center sm:justify-between sm:text-left">
          <p className="text-sm text-muted">
            PLAB and UK clinical practice terms — tap or hover underlined words in stems for the
            same definitions.
          </p>
          {isAdmin ? (
            <Link to="/admin/glossary" className="text-sm font-medium text-accent hover:underline">
              Edit glossary
            </Link>
          ) : null}
        </div>

        <Input
          value={q}
          onChange={(e) => setQ(e.target.value)}
          placeholder="Search terms, sections, aliases…"
          aria-label="Search glossary"
        />

        <div className="flex flex-wrap items-center justify-center gap-2">
          {themes.map((name) => (
            <Button
              key={name}
              type="button"
              variant={theme === name ? 'primary' : 'ghost'}
              className={cn(theme === name ? '' : 'border border-border')}
              onClick={() => setTheme(name)}
            >
              {name}
            </Button>
          ))}
        </div>

        <section className="rounded-md border border-border bg-surface p-4">
          <h2 className="mb-2 text-center font-display text-sm font-semibold">Reading Speed (WPM)</h2>
          <p className="mb-3 text-center text-xs text-muted">
            Used for long-stem reading tips and pace-vs-length analytics. Typical study reading is
            150–250 WPM.
          </p>
          <div className="flex flex-wrap items-end justify-center gap-2">
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
            <Button
              type="button"
              variant="secondary"
              onClick={() => void saveWpm()}
              disabled={!user}
            >
              Save
            </Button>
          </div>
          {wpmMsg ? <p className="mt-2 text-center text-xs text-muted">{wpmMsg}</p> : null}
          {!user ? (
            <p className="mt-2 text-center text-xs text-muted">Sign in to persist reading speed.</p>
          ) : null}
        </section>

        {examLoading ? <p className="text-center text-sm text-muted">Loading…</p> : null}
        {!schemaMissing && (examError || softGlossaryError) ? (
          <p className="text-center text-sm text-incorrect">{examError || softGlossaryError}</p>
        ) : null}

        {bySection.map(([section, rows]) => (
          <section key={section} className="space-y-2">
            <h2 className="text-center font-display text-lg font-semibold">{section}</h2>
            <ul className="divide-y divide-border rounded-lg border border-border bg-surface">
              {rows.map((t) => (
                <li key={t.id} className="px-4 py-3">
                  <p className="font-display font-semibold text-fg">{t.term}</p>
                  <p className="mt-1 text-sm text-muted">{t.definition}</p>
                  {t.aliases?.length ? (
                    <p className="mt-1 text-xs text-muted">Also: {t.aliases.join(', ')}</p>
                  ) : null}
                </li>
              ))}
            </ul>
          </section>
        ))}

        <section className="space-y-2">
          <h2 className="text-center font-display text-lg font-semibold">All Terms (A–Z)</h2>
          <ul className="divide-y divide-border rounded-lg border border-border bg-surface">
            {alphabetical.length === 0 ? (
              <li className="px-4 py-8 text-center text-sm text-muted">No matching terms.</li>
            ) : (
              alphabetical.map((t) => (
                <li key={`az-${t.id}`} className="px-4 py-3">
                  <p className="font-display font-semibold text-fg">
                    {t.term}
                    <span className="ml-2 text-xs font-normal text-muted">
                      {t.section || 'General'}
                    </span>
                  </p>
                  <p className="mt-1 text-sm text-muted">{t.definition}</p>
                </li>
              ))
            )}
          </ul>
        </section>
      </div>
    </AppShell>
  )
}

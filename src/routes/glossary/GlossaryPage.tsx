import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { AppShell } from '@/components/layout/AppShell'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { fetchGlossaryTerms } from '@/features/glossary/glossaryApi'
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
  const { isAdmin } = useAuth()
  const { exam, loading: examLoading, error: examError, schemaMissing } = useExam()
  const [terms, setTerms] = useState<GlossaryTerm[]>([])
  const [q, setQ] = useState('')
  const [theme, setTheme] = useState<string>('All')
  const [error, setError] = useState<string | null>(null)

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

  const softGlossaryError = error && isMissingSchemaError(error) ? null : error

  return (
    <AppShell title="Glossary">
      <div className="mx-auto flex max-w-3xl flex-col gap-6">
        <div className="flex flex-wrap items-end justify-center gap-3 text-center sm:justify-between sm:text-left">
          <p className="text-sm text-muted">
            PLAB and UK clinical practice terms — tap or hover underlined words in stems for the
            same definitions. Reading speed lives under Account.
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

        {examLoading ? <p className="text-center text-sm text-muted">Loading…</p> : null}
        {!schemaMissing && (examError || softGlossaryError) ? (
          <p className="text-center text-sm text-incorrect">{examError || softGlossaryError}</p>
        ) : null}
        {!exam && !examLoading ? (
          <p className="text-center text-sm text-muted">Glossary not available yet.</p>
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

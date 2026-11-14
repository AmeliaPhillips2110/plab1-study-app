import { useMemo, useState, type ChangeEvent } from 'react'
import { Link } from 'react-router-dom'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { TOPIC_CATALOG } from '@/features/question-import/topicAliases'
import {
  applyTopicIds,
  buildImportItems,
  importQuestionBatches,
  specsForMissingSlugs,
  type ImportBatchResult,
} from '@/features/question-import/importQuestions'
import {
  parseQuestionBankXlsx,
  suggestSourceTag,
  type ParsePreview,
} from '@/features/question-import/parseQuestionBankXlsx'
import type { Topic } from '@/types/database'

type Props = {
  examId: string
  topics: Topic[]
  onImported?: () => void
}

type Phase = 'pick' | 'preview' | 'importing' | 'done'

export function QuestionBankImport({ examId, topics, onImported }: Props) {
  const [phase, setPhase] = useState<Phase>('pick')
  const [preview, setPreview] = useState<ParsePreview | null>(null)
  const [sourceTag, setSourceTag] = useState('plab1-xlsx')
  const [createMissingTopics, setCreateMissingTopics] = useState(false)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [progress, setProgress] = useState<{ done: number; total: number } | null>(null)
  const [result, setResult] = useState<ImportBatchResult | null>(null)
  const [importErrors, setImportErrors] = useState<string[]>([])

  const topicsBySlug = useMemo(() => {
    const map = new Map<string, Topic>()
    for (const t of topics) map.set(t.slug, t)
    return map
  }, [topics])

  const missingSlugs = useMemo(() => {
    if (!preview) return []
    const { missingSlugs: miss } = buildImportItems(preview.questions, sourceTag, topicsBySlug)
    return miss
  }, [preview, sourceTag, topicsBySlug])

  const unmappedRawEntries = useMemo(() => {
    if (!preview) return []
    return Object.entries(preview.unmappedTopics).sort((a, b) => b[1] - a[1])
  }, [preview])

  const topicCountEntries = useMemo(() => {
    if (!preview) return []
    return Object.entries(preview.topicCounts)
      .map(([slug, n]) => ({
        slug,
        n,
        name: topicsBySlug.get(slug)?.name ?? TOPIC_CATALOG[slug]?.name ?? slug,
        inDb: topicsBySlug.has(slug),
      }))
      .sort((a, b) => b.n - a.n)
  }, [preview, topicsBySlug])

  async function onFile(e: ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    e.target.value = ''
    if (!file) return
    setError(null)
    setResult(null)
    setImportErrors([])
    setBusy(true)
    try {
      const buffer = await file.arrayBuffer()
      const tag = suggestSourceTag(file.name)
      const parsed = await parseQuestionBankXlsx(buffer, file.name, tag)
      setPreview(parsed)
      setSourceTag(parsed.suggestedSourceTag)
      setPhase('preview')
      setCreateMissingTopics(false)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to parse workbook.')
      setPreview(null)
      setPhase('pick')
    } finally {
      setBusy(false)
    }
  }

  async function onConfirmImport() {
    if (!preview) return
    setError(null)
    setImportErrors([])
    setBusy(true)
    setPhase('importing')
    setProgress({ done: 0, total: preview.questions.length })

    try {
      let map = new Map(topicsBySlug)
      const newTopics = createMissingTopics ? specsForMissingSlugs(missingSlugs) : []

      // Optimistic map for newly created topics so items get topic_id
      for (const t of newTopics) {
        map.set(t.slug, {
          id: t.id,
          exam_id: examId,
          parent_id: null,
          slug: t.slug,
          name: t.name,
          sort_order: t.sort_order,
          is_active: true,
          created_at: new Date().toISOString(),
        })
      }

      const built = buildImportItems(preview.questions, sourceTag.trim() || 'plab1-xlsx', map)
      const items = applyTopicIds(built.items, preview.questions, map)

      const { totals, errors } = await importQuestionBatches({
        examId,
        items,
        newTopics,
        onProgress: (p) => setProgress({ done: p.done, total: p.total }),
      })

      setResult(totals)
      setImportErrors(errors)
      setPhase('done')
      if (errors.length === 0) onImported?.()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Import failed.')
      setPhase('preview')
    } finally {
      setBusy(false)
    }
  }

  function reset() {
    setPhase('pick')
    setPreview(null)
    setError(null)
    setResult(null)
    setImportErrors([])
    setProgress(null)
    setCreateMissingTopics(false)
  }

  return (
    <div className="flex max-w-2xl flex-col gap-5">
      <div>
        <p className="text-sm text-muted">
          Upload a PLAB question bank <code className="text-fg">.xlsx</code>. Questions are added for
          this exam (additive — existing banks are not wiped). Stable IDs match the offline seed
          script so re-imports upsert safely.
        </p>
        <p className="mt-2 text-sm">
          <Link to="/admin/questions" className="text-accent hover:underline">
            ← Back to questions
          </Link>
        </p>
      </div>

      {phase === 'pick' || phase === 'preview' ? (
        <label className="flex flex-col gap-2 text-sm">
          <span className="font-medium">Workbook (.xlsx)</span>
          <input
            type="file"
            accept=".xlsx,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
            onChange={(e) => void onFile(e)}
            disabled={busy}
            className="text-sm file:mr-3 file:rounded-md file:border-0 file:bg-accent file:px-3 file:py-2 file:text-sm file:font-medium file:text-white hover:file:bg-accent-hover"
          />
        </label>
      ) : null}

      {error ? <p className="text-sm text-incorrect">{error}</p> : null}

      {busy && phase === 'pick' ? <p className="text-sm text-muted">Parsing workbook…</p> : null}

      {preview && (phase === 'preview' || phase === 'importing' || phase === 'done') ? (
        <div className="flex flex-col gap-4 border-t border-border pt-4">
          <div>
            <h2 className="font-display text-lg font-semibold text-fg">Preview</h2>
            <p className="mt-1 text-sm text-muted">
              {preview.fileName} · sheet “{preview.sheetName}”
            </p>
          </div>

          <ul className="grid gap-1 text-sm sm:grid-cols-2">
            <li>
              <span className="text-muted">Ready to import:</span> {preview.questions.length}
            </li>
            <li>
              <span className="text-muted">Skipped rows:</span> {preview.skipped}
            </li>
            <li>
              <span className="text-muted">Parse errors:</span> {preview.errors.length}
            </li>
            <li>
              <span className="text-muted">With images:</span> {preview.imageCount}
            </li>
            <li>
              <span className="text-muted">Mapped topics:</span> {topicCountEntries.length}
            </li>
            <li>
              <span className="text-muted">Unmapped categories:</span> {unmappedRawEntries.length}
            </li>
          </ul>

          <Input
            label="Source tag (stored in payload.source)"
            name="sourceTag"
            value={sourceTag}
            onChange={(e) => setSourceTag(e.target.value)}
            disabled={phase !== 'preview'}
          />

          {topicCountEntries.length > 0 ? (
            <div>
              <p className="mb-1 text-sm font-medium">Topics in this file</p>
              <ul className="max-h-40 overflow-y-auto text-sm text-muted">
                {topicCountEntries.map((t) => (
                  <li key={t.slug}>
                    {t.name}: {t.n}
                    {!t.inDb ? ' (not in DB yet)' : ''}
                  </li>
                ))}
              </ul>
            </div>
          ) : null}

          {unmappedRawEntries.length > 0 ? (
            <div>
              <p className="mb-1 text-sm font-medium text-incorrect">Unmapped categories</p>
              <p className="mb-1 text-xs text-muted">
                These rows import with no topic unless you create topics below (only for known
                catalog slugs that are missing from the DB).
              </p>
              <ul className="max-h-32 overflow-y-auto text-sm text-muted">
                {unmappedRawEntries.map(([label, n]) => (
                  <li key={label}>
                    {label}: {n}
                  </li>
                ))}
              </ul>
            </div>
          ) : null}

          {missingSlugs.length > 0 ? (
            <label className="flex items-start gap-2 text-sm">
              <input
                type="checkbox"
                className="mt-1"
                checked={createMissingTopics}
                disabled={phase !== 'preview'}
                onChange={(e) => setCreateMissingTopics(e.target.checked)}
              />
              <span>
                Create {missingSlugs.length} missing topic
                {missingSlugs.length === 1 ? '' : 's'} in Supabase (
                {missingSlugs
                  .map((s) => TOPIC_CATALOG[s]?.name ?? s)
                  .join(', ')}
                )
              </span>
            </label>
          ) : null}

          {preview.errors.length > 0 ? (
            <details className="text-sm">
              <summary className="cursor-pointer font-medium">
                Row errors ({preview.errors.length})
              </summary>
              <ul className="mt-2 max-h-40 overflow-y-auto text-muted">
                {preview.errors.slice(0, 50).map((err) => (
                  <li key={`${err.row}-${err.message}`}>
                    Row {err.row}: {err.message}
                  </li>
                ))}
              </ul>
            </details>
          ) : null}

          {phase === 'preview' ? (
            <div className="flex flex-wrap gap-2">
              <Button
                onClick={() => void onConfirmImport()}
                disabled={busy || preview.questions.length === 0 || !sourceTag.trim()}
              >
                Confirm import
              </Button>
              <Button variant="ghost" onClick={reset} disabled={busy}>
                Clear
              </Button>
            </div>
          ) : null}

          {phase === 'importing' && progress ? (
            <p className="text-sm text-muted">
              Importing… {progress.done} / {progress.total}
            </p>
          ) : null}

          {phase === 'done' && result ? (
            <div className="flex flex-col gap-2">
              <p className="text-sm font-medium text-fg">Import finished</p>
              <ul className="text-sm text-muted">
                <li>Inserted: {result.inserted}</li>
                <li>Updated: {result.updated}</li>
                <li>Options written: {result.options}</li>
                <li>Topics created: {result.topics_created}</li>
                <li>Source tag: {sourceTag}</li>
              </ul>
              {importErrors.length > 0 ? (
                <div>
                  <p className="text-sm text-incorrect">Errors</p>
                  <ul className="text-sm text-incorrect">
                    {importErrors.map((msg) => (
                      <li key={msg}>{msg}</li>
                    ))}
                  </ul>
                  <p className="mt-2 text-xs text-muted">
                    If you see “function import_questions does not exist”, paste{' '}
                    <code className="text-fg">supabase/import_questions_rpc.sql</code> in the
                    Supabase SQL editor first.
                  </p>
                </div>
              ) : null}
              <Button variant="secondary" onClick={reset}>
                Import another file
              </Button>
            </div>
          ) : null}
        </div>
      ) : null}
    </div>
  )
}

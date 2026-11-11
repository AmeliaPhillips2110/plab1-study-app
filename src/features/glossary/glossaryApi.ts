import { supabase } from '@/lib/supabase'
import type { GlossaryTerm } from '@/types/database'

export async function fetchGlossaryTerms(examId: string): Promise<{
  terms: GlossaryTerm[]
  error: string | null
}> {
  const { data, error } = await supabase
    .from('glossary_terms')
    .select('*')
    .eq('exam_id', examId)
    .eq('is_active', true)
    .order('term', { ascending: true })
  if (error) return { terms: [], error: error.message }
  return { terms: (data as GlossaryTerm[] | null) ?? [], error: null }
}

export async function fetchAllGlossaryTermsAdmin(examId: string): Promise<{
  terms: GlossaryTerm[]
  error: string | null
}> {
  const { data, error } = await supabase
    .from('glossary_terms')
    .select('*')
    .eq('exam_id', examId)
    .order('term', { ascending: true })
  if (error) return { terms: [], error: error.message }
  return { terms: (data as GlossaryTerm[] | null) ?? [], error: null }
}

export async function upsertGlossaryTerm(
  row: Partial<GlossaryTerm> & Pick<GlossaryTerm, 'exam_id' | 'term' | 'definition'>,
): Promise<{ error: string | null }> {
  const payload = {
    ...row,
    aliases: row.aliases ?? [],
    is_active: row.is_active ?? true,
    updated_at: new Date().toISOString(),
  }
  if (row.id) {
    const { error } = await supabase.from('glossary_terms').update(payload).eq('id', row.id)
    return { error: error?.message ?? null }
  }
  const { error } = await supabase.from('glossary_terms').insert(payload)
  return { error: error?.message ?? null }
}

export async function deleteGlossaryTerm(id: string): Promise<{ error: string | null }> {
  const { error } = await supabase.from('glossary_terms').delete().eq('id', id)
  return { error: error?.message ?? null }
}

export type GlossaryMatch = {
  start: number
  end: number
  term: GlossaryTerm
  matched: string
}

/** Find glossary terms/aliases in text (longest match first, case-insensitive, word-ish boundaries). */
export function findGlossaryMatches(text: string, terms: GlossaryTerm[]): GlossaryMatch[] {
  if (!text || terms.length === 0) return []
  const needles: Array<{ needle: string; term: GlossaryTerm }> = []
  for (const term of terms) {
    needles.push({ needle: term.term, term })
    for (const alias of term.aliases ?? []) {
      if (alias.trim()) needles.push({ needle: alias.trim(), term })
    }
  }
  needles.sort((a, b) => b.needle.length - a.needle.length)

  const occupied: boolean[] = Array.from({ length: text.length }, () => false)
  const matches: GlossaryMatch[] = []
  const lower = text.toLowerCase()

  for (const { needle, term } of needles) {
    const n = needle.toLowerCase()
    if (n.length < 2) continue
    let from = 0
    while (from <= lower.length - n.length) {
      const idx = lower.indexOf(n, from)
      if (idx < 0) break
      const end = idx + n.length
      const beforeOk = idx === 0 || !/[A-Za-z0-9]/.test(text[idx - 1]!)
      const afterOk = end >= text.length || !/[A-Za-z0-9]/.test(text[end]!)
      let overlap = false
      for (let i = idx; i < end; i += 1) {
        if (occupied[i]) {
          overlap = true
          break
        }
      }
      if (beforeOk && afterOk && !overlap) {
        for (let i = idx; i < end; i += 1) occupied[i] = true
        matches.push({ start: idx, end, term, matched: text.slice(idx, end) })
      }
      from = idx + 1
    }
  }

  return matches.sort((a, b) => a.start - b.start)
}

export function countWords(text: string): number {
  return text.trim().split(/\s+/).filter(Boolean).length
}

export function estimatedReadSeconds(wordCount: number, wpm: number | null | undefined): number {
  const rate = wpm && wpm > 0 ? wpm : 200
  return Math.max(1, Math.round((wordCount / rate) * 60))
}

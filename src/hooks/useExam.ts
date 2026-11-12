import { useCallback, useEffect, useState } from 'react'
import { isMissingSchemaError } from '@/lib/schemaErrors'
import { supabase, supabaseConfigured } from '@/lib/supabase'
import type { Exam, ExamSettings, Topic } from '@/types/database'
import { PLAB1_SLUG } from '@/modules/plab1/config'

type ExamState = {
  loading: boolean
  exam: Exam | null
  settings: ExamSettings | null
  topics: Topic[]
  error: string | null
  /** True when public.exams (or related schema) is missing — show setup CTA, not raw PostgREST text. */
  schemaMissing: boolean
  refresh: () => Promise<void>
}

export function useExam(slug: string = PLAB1_SLUG): ExamState {
  const [loading, setLoading] = useState(true)
  const [exam, setExam] = useState<Exam | null>(null)
  const [settings, setSettings] = useState<ExamSettings | null>(null)
  const [topics, setTopics] = useState<Topic[]>([])
  const [error, setError] = useState<string | null>(null)
  const [schemaMissing, setSchemaMissing] = useState(false)

  const refresh = useCallback(async () => {
    if (!supabaseConfigured) {
      setError('Supabase is not configured. Add VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY.')
      setSchemaMissing(false)
      setLoading(false)
      return
    }
    setLoading(true)
    setError(null)
    setSchemaMissing(false)

    const { data: examRow, error: examError } = await supabase
      .from('exams')
      .select('*')
      .eq('slug', slug)
      .maybeSingle()

    if (examError) {
      const missing = isMissingSchemaError(examError.message)
      setSchemaMissing(missing)
      // Soft empty — never surface raw PostgREST / SETUP paths in the UI.
      setError(missing ? null : examError.message)
      setExam(null)
      setSettings(null)
      setTopics([])
      setLoading(false)
      return
    }

    if (!examRow) {
      setSchemaMissing(false)
      setError(null)
      setExam(null)
      setSettings(null)
      setTopics([])
      setLoading(false)
      return
    }

    const examData = examRow as Exam
    const [{ data: settingsRow }, { data: topicRows }] = await Promise.all([
      supabase.from('exam_settings').select('*').eq('exam_id', examData.id).maybeSingle(),
      supabase
        .from('topics')
        .select('*')
        .eq('exam_id', examData.id)
        .eq('is_active', true)
        .order('sort_order', { ascending: true }),
    ])

    setExam(examData)
    setSettings((settingsRow as ExamSettings | null) ?? null)
    setTopics((topicRows as Topic[]) ?? [])
    setSchemaMissing(false)
    setLoading(false)
  }, [slug])

  useEffect(() => {
    void refresh()
  }, [refresh])

  return { loading, exam, settings, topics, error, schemaMissing, refresh }
}

import { useCallback, useEffect, useState } from 'react'
import { supabase, supabaseConfigured } from '@/lib/supabase'
import type { Exam, ExamSettings, Topic } from '@/types/database'
import { PLAB1_SLUG } from '@/modules/plab1/config'

type ExamState = {
  loading: boolean
  exam: Exam | null
  settings: ExamSettings | null
  topics: Topic[]
  error: string | null
  refresh: () => Promise<void>
}

export function useExam(slug: string = PLAB1_SLUG): ExamState {
  const [loading, setLoading] = useState(true)
  const [exam, setExam] = useState<Exam | null>(null)
  const [settings, setSettings] = useState<ExamSettings | null>(null)
  const [topics, setTopics] = useState<Topic[]>([])
  const [error, setError] = useState<string | null>(null)

  const refresh = useCallback(async () => {
    if (!supabaseConfigured) {
      setError('Supabase is not configured. Add VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY.')
      setLoading(false)
      return
    }
    setLoading(true)
    setError(null)

    const { data: examRow, error: examError } = await supabase
      .from('exams')
      .select('*')
      .eq('slug', slug)
      .maybeSingle()

    if (examError) {
      setError(examError.message)
      setExam(null)
      setSettings(null)
      setTopics([])
      setLoading(false)
      return
    }

    if (!examRow) {
      setError(`Exam "${slug}" was not found. Run the seed SQL in Supabase.`)
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
    setLoading(false)
  }, [slug])

  useEffect(() => {
    void refresh()
  }, [refresh])

  return { loading, exam, settings, topics, error, refresh }
}

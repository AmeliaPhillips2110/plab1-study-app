import { supabase, supabaseConfigured } from '@/lib/supabase'
import { PLAB1_SLUG } from '@/modules/plab1/config'
import type { Exam } from '@/types/database'

export async function fetchDefaultExam(slug: string = PLAB1_SLUG): Promise<Exam | null> {
  if (!supabaseConfigured) return null
  const { data, error } = await supabase.from('exams').select('*').eq('slug', slug).maybeSingle()
  if (error || !data) return null
  return data as Exam
}

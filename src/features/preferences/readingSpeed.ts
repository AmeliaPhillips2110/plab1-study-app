import { supabase } from '@/lib/supabase'

export const DEFAULT_READING_WPM = 200

export async function saveReadingSpeedWpm(
  userId: string,
  wpm: number,
): Promise<{ error: string | null }> {
  const clamped = Math.min(600, Math.max(80, Math.round(wpm)))
  const { error } = await supabase.from('user_preferences').upsert({
    user_id: userId,
    reading_speed_wpm: clamped,
    updated_at: new Date().toISOString(),
  })
  return { error: error?.message ?? null }
}

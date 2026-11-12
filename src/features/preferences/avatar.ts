import { supabase } from '@/lib/supabase'

export async function saveAvatarUrl(
  userId: string,
  avatarUrl: string,
  existingExtra: Record<string, unknown> = {},
): Promise<{ error: string | null }> {
  const trimmed = avatarUrl.trim()
  const extra = { ...existingExtra }
  if (trimmed) extra.avatar_url = trimmed
  else delete extra.avatar_url

  const { error } = await supabase.from('user_preferences').upsert({
    user_id: userId,
    extra,
    updated_at: new Date().toISOString(),
  })
  return { error: error?.message ?? null }
}

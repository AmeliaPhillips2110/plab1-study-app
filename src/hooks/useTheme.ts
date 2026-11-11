import { useCallback, useEffect, useState } from 'react'
import type { ThemePreference } from '@/types/database'
import { supabase, supabaseConfigured } from '@/lib/supabase'
import { useAuth } from '@/hooks/useAuth'

const STORAGE_KEY = 'plaboratory-theme'

function resolveTheme(pref: ThemePreference): 'dark' | 'light' {
  if (pref === 'system') {
    return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
  }
  return pref
}

function applyTheme(pref: ThemePreference) {
  const resolved = resolveTheme(pref)
  document.documentElement.classList.toggle('dark', resolved === 'dark')
}

export function useTheme() {
  const { user, preferences, refreshProfile } = useAuth()
  const [theme, setThemeState] = useState<ThemePreference>(() => {
    const stored = localStorage.getItem(STORAGE_KEY) as ThemePreference | null
    return stored ?? 'dark'
  })

  useEffect(() => {
    if (preferences?.theme) {
      setThemeState(preferences.theme)
    }
  }, [preferences?.theme])

  useEffect(() => {
    applyTheme(theme)
    localStorage.setItem(STORAGE_KEY, theme)
  }, [theme])

  useEffect(() => {
    if (theme !== 'system') return
    const mq = window.matchMedia('(prefers-color-scheme: dark)')
    const onChange = () => applyTheme('system')
    mq.addEventListener('change', onChange)
    return () => mq.removeEventListener('change', onChange)
  }, [theme])

  const setTheme = useCallback(
    async (next: ThemePreference) => {
      setThemeState(next)
      applyTheme(next)
      localStorage.setItem(STORAGE_KEY, next)
      if (!user || !supabaseConfigured) return
      const { error } = await supabase.from('user_preferences').upsert({
        user_id: user.id,
        theme: next,
        updated_at: new Date().toISOString(),
      })
      if (!error) await refreshProfile()
    },
    [user, refreshProfile],
  )

  const toggleLightDark = useCallback(() => {
    const resolved = resolveTheme(theme)
    void setTheme(resolved === 'dark' ? 'light' : 'dark')
  }, [theme, setTheme])

  return { theme, setTheme, toggleLightDark, resolved: resolveTheme(theme) }
}

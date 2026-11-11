import {
  createContext,
  createElement,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useState,
  type ReactNode,
} from 'react'
import type { Session, User } from '@supabase/supabase-js'
import { usernameToEmail } from '@/features/auth/username'
import { supabase, supabaseConfigured } from '@/lib/supabase'
import type { Profile, UserPreferences } from '@/types/database'

type AuthState = {
  loading: boolean
  session: Session | null
  user: User | null
  profile: Profile | null
  preferences: UserPreferences | null
  isAdmin: boolean
  supabaseConfigured: boolean
  /** Username (not email) — mapped to a synthetic Supabase Auth email. */
  signIn: (username: string, password: string) => Promise<{ error: string | null }>
  signUp: (username: string, password: string) => Promise<{ error: string | null }>
  signOut: () => Promise<void>
  refreshProfile: () => Promise<void>
}

const AuthContext = createContext<AuthState | null>(null)

/** Map GoTrue / Supabase Auth errors to actionable copy for username-only signup. */
function mapAuthError(message: string): string {
  const m = message.toLowerCase()
  if (m.includes('rate limit') || m.includes('over_email_send_rate_limit')) {
    return (
      'Email rate limit exceeded. Supabase is still trying to send mail. ' +
      'Turn OFF Authentication → Providers → Email → Confirm email, wait ~1 hour for the free mail quota to reset (or add custom SMTP), then try Create account again.'
    )
  }
  if (m.includes('email address') && m.includes('invalid')) {
    return 'That user maps to an email Supabase rejected. Try a simpler username (letters/numbers).'
  }
  if (m.includes('not authorized') || m.includes('email_address_not_authorized')) {
    return (
      'Supabase blocked sending mail to this address. Turn OFF Confirm email so signup does not send mail.'
    )
  }
  return message
}

async function loadProfileBundle(userId: string): Promise<{
  profile: Profile | null
  preferences: UserPreferences | null
}> {
  const [{ data: profile }, { data: preferences }] = await Promise.all([
    supabase.from('profiles').select('*').eq('id', userId).maybeSingle(),
    supabase.from('user_preferences').select('*').eq('user_id', userId).maybeSingle(),
  ])
  return {
    profile: (profile as Profile | null) ?? null,
    preferences: (preferences as UserPreferences | null) ?? null,
  }
}

export function AuthProvider({ children }: { children: ReactNode }) {
  const [loading, setLoading] = useState(true)
  const [session, setSession] = useState<Session | null>(null)
  const [user, setUser] = useState<User | null>(null)
  const [profile, setProfile] = useState<Profile | null>(null)
  const [preferences, setPreferences] = useState<UserPreferences | null>(null)

  const refreshProfile = useCallback(async () => {
    if (!user) {
      setProfile(null)
      setPreferences(null)
      return
    }
    const bundle = await loadProfileBundle(user.id)
    setProfile(bundle.profile)
    setPreferences(bundle.preferences)
  }, [user])

  useEffect(() => {
    let mounted = true

    async function init() {
      if (!supabaseConfigured) {
        if (mounted) setLoading(false)
        return
      }
      const { data } = await supabase.auth.getSession()
      if (!mounted) return
      setSession(data.session)
      setUser(data.session?.user ?? null)
      if (data.session?.user) {
        const bundle = await loadProfileBundle(data.session.user.id)
        if (!mounted) return
        setProfile(bundle.profile)
        setPreferences(bundle.preferences)
      }
      setLoading(false)
    }

    void init()

    const { data: sub } = supabase.auth.onAuthStateChange((_event, next) => {
      setSession(next)
      setUser(next?.user ?? null)
      if (next?.user) {
        void loadProfileBundle(next.user.id).then((bundle) => {
          setProfile(bundle.profile)
          setPreferences(bundle.preferences)
        })
      } else {
        setProfile(null)
        setPreferences(null)
      }
      setLoading(false)
    })

    return () => {
      mounted = false
      sub.subscription.unsubscribe()
    }
  }, [])

  const signIn = useCallback(async (username: string, password: string) => {
    let email: string
    try {
      email = usernameToEmail(username)
    } catch (e) {
      return { error: e instanceof Error ? e.message : 'Invalid user' }
    }
    const { error } = await supabase.auth.signInWithPassword({ email, password })
    return { error: error ? mapAuthError(error.message) : null }
  }, [])

  const signUp = useCallback(async (username: string, password: string) => {
    let email: string
    let displayName: string
    try {
      email = usernameToEmail(username)
      displayName = email.slice(0, email.indexOf('@'))
    } catch (e) {
      return { error: e instanceof Error ? e.message : 'Invalid user' }
    }
    // Do not set emailRedirectTo — this app never sends confirmation mail.
    // Outbound email is controlled only by Supabase "Confirm email" (must be Off).
    const { data, error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: { display_name: displayName },
      },
    })
    if (error) return { error: mapAuthError(error.message) }

    // With Confirm email Off, Auth returns a session and no mail is sent.
    if (data.session) return { error: null }

    // Fallback: if the project still has confirmations on, sign-in usually fails
    // until confirm — surface a clear dashboard fix instead of a silent stall.
    const signedIn = await supabase.auth.signInWithPassword({ email, password })
    if (signedIn.error) {
      return {
        error:
          'Account may exist, but sign-in needs email confirmation. In Supabase turn OFF Authentication → Providers → Email → Confirm email, then try again.',
      }
    }
    return { error: null }
  }, [])

  const signOut = useCallback(async () => {
    await supabase.auth.signOut()
  }, [])

  const value = useMemo<AuthState>(
    () => ({
      loading,
      session,
      user,
      profile,
      preferences,
      isAdmin: profile?.role === 'admin',
      supabaseConfigured,
      signIn,
      signUp,
      signOut,
      refreshProfile,
    }),
    [
      loading,
      session,
      user,
      profile,
      preferences,
      signIn,
      signUp,
      signOut,
      refreshProfile,
    ],
  )

  return createElement(AuthContext.Provider, { value }, children)
}

export function useAuth(): AuthState {
  const ctx = useContext(AuthContext)
  if (!ctx) throw new Error('useAuth must be used within AuthProvider')
  return ctx
}

import { useState, type FormEvent } from 'react'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { useAuth } from '@/hooks/useAuth'

type Mode = 'signin' | 'signup'

export function LoginForm() {
  const { signIn, signUp, supabaseConfigured } = useAuth()
  const [mode, setMode] = useState<Mode>('signin')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [displayName, setDisplayName] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [info, setInfo] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  async function onSubmit(e: FormEvent) {
    e.preventDefault()
    setError(null)
    setInfo(null)
    setBusy(true)
    if (mode === 'signin') {
      const result = await signIn(email.trim(), password)
      if (result.error) setError(result.error)
    } else {
      const result = await signUp(email.trim(), password, displayName.trim() || undefined)
      if (result.error) setError(result.error)
      else {
        setInfo(
          'Account created. If email confirmation is enabled in Supabase, check your inbox before signing in.',
        )
        setMode('signin')
      }
    }
    setBusy(false)
  }

  return (
    <form onSubmit={onSubmit} className="mx-auto flex w-full max-w-md flex-col gap-4">
      {!supabaseConfigured ? (
        <p className="rounded-md border border-incorrect/40 bg-incorrect/10 px-3 py-2 text-sm text-incorrect">
          Supabase env vars are missing. Copy <code>.env.example</code> to <code>.env.local</code> and
          add your project URL and anon key. See SETUP.md.
        </p>
      ) : null}

      <div className="flex gap-2">
        <Button
          type="button"
          variant={mode === 'signin' ? 'primary' : 'secondary'}
          onClick={() => setMode('signin')}
        >
          Sign in
        </Button>
        <Button
          type="button"
          variant={mode === 'signup' ? 'primary' : 'secondary'}
          onClick={() => setMode('signup')}
        >
          Create account
        </Button>
      </div>

      {mode === 'signup' ? (
        <Input
          label="Display name"
          name="displayName"
          value={displayName}
          onChange={(e) => setDisplayName(e.target.value)}
          autoComplete="name"
        />
      ) : null}

      <Input
        label="Email"
        name="email"
        type="email"
        required
        value={email}
        onChange={(e) => setEmail(e.target.value)}
        autoComplete="email"
      />
      <Input
        label="Password"
        name="password"
        type="password"
        required
        minLength={6}
        value={password}
        onChange={(e) => setPassword(e.target.value)}
        autoComplete={mode === 'signin' ? 'current-password' : 'new-password'}
      />

      {error ? <p className="text-sm text-incorrect">{error}</p> : null}
      {info ? <p className="text-sm text-correct">{info}</p> : null}

      <Button type="submit" disabled={busy || !supabaseConfigured}>
        {busy ? 'Please wait…' : mode === 'signin' ? 'Sign in' : 'Create account'}
      </Button>
    </form>
  )
}

import { useState, type FormEvent } from 'react'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { sanitizeUsername } from '@/features/auth/username'
import { useAuth } from '@/hooks/useAuth'

type Mode = 'signin' | 'signup'

export function LoginForm() {
  const { signIn, signUp, supabaseConfigured } = useAuth()
  const [mode, setMode] = useState<Mode>('signin')
  const [username, setUsername] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [info, setInfo] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  async function onSubmit(e: FormEvent) {
    e.preventDefault()
    setError(null)
    setInfo(null)
    setBusy(true)

    const user = sanitizeUsername(username)
    if (user.length < 2) {
      setError('User must be at least 2 characters (letters, numbers, . _ -).')
      setBusy(false)
      return
    }

    if (mode === 'signin') {
      const result = await signIn(user, password)
      if (result.error) setError(result.error)
    } else {
      const result = await signUp(user, password)
      if (result.error) setError(result.error)
      else {
        setInfo('Account created. You can sign in now.')
        setMode('signin')
      }
    }
    setBusy(false)
  }

  return (
    <form
      onSubmit={onSubmit}
      className="mx-auto flex w-full max-w-md flex-col gap-4"
      noValidate
    >
      {!supabaseConfigured ? (
        <p className="rounded-md border border-incorrect/40 bg-incorrect/10 px-3 py-2 text-sm text-incorrect">
          Supabase env vars are missing. Copy <code>.env.example</code> to <code>.env.local</code> and
          add your project URL and anon key.
        </p>
      ) : null}

      <div className="flex flex-col gap-2 sm:flex-row">
        <Button
          type="button"
          className="w-full sm:w-auto"
          variant={mode === 'signin' ? 'primary' : 'secondary'}
          onClick={() => setMode('signin')}
        >
          Sign in
        </Button>
        <Button
          type="button"
          className="w-full sm:w-auto"
          variant={mode === 'signup' ? 'primary' : 'secondary'}
          onClick={() => setMode('signup')}
        >
          Create account
        </Button>
      </div>

      <Input
        label="User"
        name="username"
        type="text"
        required
        minLength={2}
        autoCapitalize="none"
        autoCorrect="off"
        spellCheck={false}
        inputMode="text"
        value={username}
        onChange={(e) => setUsername(e.target.value)}
        autoComplete="username"
        placeholder="e.g. amelia"
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

      <Button type="submit" className="w-full" disabled={busy || !supabaseConfigured}>
        {busy ? 'Please wait…' : mode === 'signin' ? 'Sign in' : 'Create account'}
      </Button>
    </form>
  )
}

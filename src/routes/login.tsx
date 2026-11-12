import { ThemeToggle } from '@/components/layout/ThemeToggle'
import { LoginForm } from '@/features/auth'

export function LoginPage() {
  return (
    <div className="min-h-screen bg-bg text-fg">
      <header className="border-b border-black/20 bg-brand-banner text-white">
        <div className="mx-auto flex w-full max-w-lg items-center justify-between gap-4 px-4 py-4">
          <p className="font-display text-3xl font-normal tracking-tight sm:text-4xl">PLABoratory</p>
          <ThemeToggle className="border border-white/30 text-white hover:bg-white/15 hover:text-white" />
        </div>
      </header>
      <div className="mx-auto flex w-full max-w-lg flex-col justify-center gap-6 px-4 py-8 sm:gap-8 sm:py-10">
        <p className="text-center text-sm text-muted">PLAB 1 study app — sign in to continue</p>
        <LoginForm />
      </div>
    </div>
  )
}

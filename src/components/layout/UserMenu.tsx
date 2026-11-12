import { useEffect, useId, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '@/hooks/useAuth'
import { cn } from '@/lib/cn'

type Props = {
  className?: string
}

export function UserMenu({ className }: Props) {
  const { user, profile, signOut, preferences } = useAuth()
  const [open, setOpen] = useState(false)
  const rootRef = useRef<HTMLDivElement>(null)
  const menuId = useId()

  const label =
    profile?.display_name ||
    profile?.email?.split('@')[0] ||
    user?.email?.split('@')[0] ||
    'Account'

  const avatarUrl =
    typeof preferences?.extra?.avatar_url === 'string' ? preferences.extra.avatar_url : null

  useEffect(() => {
    function onDoc(e: MouseEvent) {
      if (!rootRef.current?.contains(e.target as Node)) setOpen(false)
    }
    function onKey(e: KeyboardEvent) {
      if (e.key === 'Escape') setOpen(false)
    }
    document.addEventListener('mousedown', onDoc)
    document.addEventListener('keydown', onKey)
    return () => {
      document.removeEventListener('mousedown', onDoc)
      document.removeEventListener('keydown', onKey)
    }
  }, [])

  if (!user) return null

  return (
    <div
      ref={rootRef}
      className={cn('relative', className)}
      onMouseEnter={() => setOpen(true)}
      onMouseLeave={() => setOpen(false)}
    >
      <button
        type="button"
        className="inline-flex max-w-[10rem] items-center gap-2 rounded-md px-2 py-1.5 text-sm text-white/90 hover:bg-white/10 hover:text-white"
        aria-haspopup="menu"
        aria-expanded={open}
        aria-controls={menuId}
        onClick={() => setOpen((v) => !v)}
      >
        {avatarUrl ? (
          <img
            src={avatarUrl}
            alt=""
            className="h-7 w-7 rounded-full object-cover ring-1 ring-white/40"
          />
        ) : (
          <span className="inline-flex h-7 w-7 items-center justify-center rounded-full bg-white/20 text-xs font-medium uppercase">
            {label.slice(0, 1)}
          </span>
        )}
        <span className="truncate">{label}</span>
      </button>
      {open ? (
        <div
          id={menuId}
          role="menu"
          className="absolute right-0 top-full z-40 mt-1 min-w-[10rem] rounded-md border border-border bg-surface py-1 text-fg shadow-md"
        >
          <Link
            role="menuitem"
            to="/account"
            className="block px-3 py-2 text-sm hover:bg-accent-subtle"
            onClick={() => setOpen(false)}
          >
            Account
          </Link>
          <button
            role="menuitem"
            type="button"
            className="block w-full px-3 py-2 text-left text-sm hover:bg-accent-subtle"
            onClick={() => {
              setOpen(false)
              void signOut()
            }}
          >
            Sign out
          </button>
        </div>
      ) : null}
    </div>
  )
}

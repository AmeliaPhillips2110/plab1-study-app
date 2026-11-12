import { useEffect, useId, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { Avatar } from '@/components/ui/Avatar'
import { Badge } from '@/components/ui/Badge'
import { useAuth } from '@/hooks/useAuth'
import { cn } from '@/lib/cn'

type Props = {
  className?: string
}

const OPEN_DELAY_MS = 180
const CLOSE_DELAY_MS = 320

export function UserMenu({ className }: Props) {
  const { user, profile, signOut, preferences, isAdmin } = useAuth()
  const [open, setOpen] = useState(false)
  const rootRef = useRef<HTMLDivElement>(null)
  const menuId = useId()
  const openTimer = useRef<number | null>(null)
  const closeTimer = useRef<number | null>(null)

  const label =
    profile?.display_name ||
    profile?.email?.split('@')[0] ||
    user?.email?.split('@')[0] ||
    'Account'

  const avatarUrl =
    typeof preferences?.extra?.avatar_url === 'string' ? preferences.extra.avatar_url : null

  function clearTimers() {
    if (openTimer.current) window.clearTimeout(openTimer.current)
    if (closeTimer.current) window.clearTimeout(closeTimer.current)
    openTimer.current = null
    closeTimer.current = null
  }

  function scheduleOpen() {
    clearTimers()
    openTimer.current = window.setTimeout(() => setOpen(true), OPEN_DELAY_MS)
  }

  function scheduleClose() {
    clearTimers()
    closeTimer.current = window.setTimeout(() => setOpen(false), CLOSE_DELAY_MS)
  }

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
      clearTimers()
    }
  }, [])

  if (!user) return null

  return (
    <div
      ref={rootRef}
      className={cn('relative', className)}
      onMouseEnter={scheduleOpen}
      onMouseLeave={scheduleClose}
    >
      <button
        type="button"
        className="inline-flex max-w-[12rem] items-center gap-2 rounded-md px-2 py-1.5 text-sm text-white/90 hover:bg-white/10 hover:text-white"
        aria-haspopup="menu"
        aria-expanded={open}
        aria-controls={menuId}
        onClick={() => {
          clearTimers()
          setOpen((v) => !v)
        }}
      >
        <Avatar name={label} imageUrl={avatarUrl} size="sm" className="ring-1 ring-black" />
        <span className="truncate">{label}</span>
        {isAdmin ? (
          <Badge tone="accent" className="hidden !px-1.5 !py-0 text-[10px] sm:inline-flex">
            Admin
          </Badge>
        ) : null}
      </button>
      {open ? (
        <div
          id={menuId}
          role="menu"
          className="absolute right-0 top-full z-50 mt-1 min-w-[11rem] rounded-md border border-border bg-surface py-1 text-fg shadow-md before:absolute before:-top-2 before:left-0 before:h-2 before:w-full before:content-['']"
          onMouseEnter={() => {
            clearTimers()
            setOpen(true)
          }}
          onMouseLeave={scheduleClose}
        >
          <Link
            role="menuitem"
            to="/account"
            className="block px-3 py-2 text-sm hover:bg-accent-subtle"
            onClick={() => setOpen(false)}
          >
            Account
            {isAdmin ? <span className="mt-0.5 block text-xs text-muted">Administrator</span> : null}
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
            Sign Out
          </button>
        </div>
      ) : null}
    </div>
  )
}

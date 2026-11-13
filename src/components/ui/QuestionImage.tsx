import { useEffect, useState } from 'react'
import { cn } from '@/lib/cn'

type Props = {
  src: string
  alt?: string
  className?: string
}

/** Question figure with click-to-zoom lightbox (Esc / backdrop to close). */
export function QuestionImage({ src, alt = 'Question figure', className }: Props) {
  const [open, setOpen] = useState(false)

  useEffect(() => {
    if (!open) return
    function onKey(e: KeyboardEvent) {
      if (e.key === 'Escape') setOpen(false)
    }
    window.addEventListener('keydown', onKey)
    const prev = document.body.style.overflow
    document.body.style.overflow = 'hidden'
    return () => {
      window.removeEventListener('keydown', onKey)
      document.body.style.overflow = prev
    }
  }, [open])

  if (!src) return null

  return (
    <>
      <button
        type="button"
        className={cn(
          'group block w-full overflow-hidden rounded-md border border-border bg-surface text-left',
          className,
        )}
        onClick={() => setOpen(true)}
        aria-label="Enlarge figure"
      >
        <img
          src={src}
          alt={alt}
          className="max-h-64 w-full object-contain transition group-hover:opacity-95"
          loading="lazy"
          referrerPolicy="no-referrer"
        />
        <span className="block border-t border-border px-2 py-1 text-center text-[11px] text-muted">
          Click to enlarge
        </span>
      </button>

      {open ? (
        <div
          className="fixed inset-0 z-[80] flex items-center justify-center bg-black/80 p-4"
          role="dialog"
          aria-modal="true"
          aria-label="Enlarged figure"
          onClick={() => setOpen(false)}
        >
          <button
            type="button"
            className="absolute right-4 top-4 rounded-md border border-white/40 bg-black/40 px-3 py-1.5 text-sm text-white hover:bg-black/60"
            onClick={() => setOpen(false)}
          >
            Close
          </button>
          <img
            src={src}
            alt={alt}
            className="max-h-[90vh] max-w-[95vw] object-contain"
            referrerPolicy="no-referrer"
            onClick={(e) => e.stopPropagation()}
          />
        </div>
      ) : null}
    </>
  )
}

/** Prefer Wikimedia Special:FilePath (or any https image URL) from payload. */
export function questionImageUrl(payload: Record<string, unknown> | null | undefined): string | null {
  if (!payload) return null
  const raw =
    (typeof payload.image_url === 'string' && payload.image_url) ||
    (typeof payload.image === 'string' && payload.image) ||
    null
  if (!raw) return null
  return toEmbeddableImageUrl(raw)
}

export function toEmbeddableImageUrl(url: string): string {
  const trimmed = url.trim()
  const m = trimmed.match(/commons\.wikimedia\.org\/wiki\/File:(.+)$/i)
  if (m) {
    return `https://commons.wikimedia.org/wiki/Special:FilePath/${m[1]}`
  }
  return trimmed
}

import { cn } from '@/lib/cn'

type Props = {
  name: string
  imageUrl?: string | null
  size?: 'sm' | 'md' | 'lg'
  className?: string
}

const sizes = {
  sm: 'h-7 w-7 text-xs',
  md: 'h-10 w-10 text-base',
  lg: 'h-20 w-20 text-3xl',
}

/** Pastel teal circle + bold black Montserrat initial; image URL overrides when set. */
export function Avatar({ name, imageUrl, size = 'sm', className }: Props) {
  const initial = (name.trim().slice(0, 1) || '?').toUpperCase()
  if (imageUrl) {
    return (
      <img
        src={imageUrl}
        alt=""
        className={cn('rounded-full object-cover', sizes[size], className)}
      />
    )
  }
  return (
    <span
      className={cn(
        'inline-flex items-center justify-center rounded-full font-display font-bold text-black',
        'bg-[#a8d4db]',
        sizes[size],
        className,
      )}
      aria-hidden
    >
      {initial}
    </span>
  )
}

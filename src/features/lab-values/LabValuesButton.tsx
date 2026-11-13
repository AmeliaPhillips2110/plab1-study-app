import { useState } from 'react'
import { Button } from '@/components/ui/Button'
import { LabValuesModal } from '@/features/lab-values/LabValuesModal'

type Props = {
  className?: string
  variant?: 'primary' | 'secondary' | 'ghost'
}

/** Opens the embedded adult Lab Values reference during Practice / Tests. */
export function LabValuesButton({ className, variant = 'secondary' }: Props) {
  const [open, setOpen] = useState(false)
  return (
    <>
      <Button
        type="button"
        variant={variant}
        className={className}
        onClick={() => setOpen(true)}
        aria-haspopup="dialog"
      >
        Lab Values
      </Button>
      <LabValuesModal open={open} onClose={() => setOpen(false)} />
    </>
  )
}

import type { MachineLevel } from '@/lib/translation/machine'
import { MACHINE_LEVEL_TEXT } from '@/lib/status-labels'

// How far machine translation has come in a language, as a small tag. The
// same words and colours wherever it appears.
const STYLE: Record<MachineLevel | 'none', string> = {
  trained: 'border-petrol-500 bg-petrol-500 text-paper',
  bridge: 'border-ink-900 bg-ink-900 text-paper',
  early: 'border-signal-500 text-signal-700',
  base: 'border-ink-400 text-ink-700',
  none: 'border-ink-200 text-ink-500',
}

export default function MachineTag({ level }: { level: MachineLevel | null }) {
  const key = level ?? 'none'
  return (
    <span
      title={MACHINE_LEVEL_TEXT[key].body}
      className={`inline-block whitespace-nowrap border px-2 py-0.5 text-xs font-semibold ${STYLE[key]}`}
    >
      {MACHINE_LEVEL_TEXT[key].label}
    </span>
  )
}

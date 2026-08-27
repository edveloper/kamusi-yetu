'use client'

import { useCallback, useEffect, useRef, useState } from 'react'

const BAR_COUNT = 56

type Props = {
  src?: string | null
  /** Shown under the bars: who spoke, where they learned it. */
  caption?: string
  /** What to say when there is no recording. */
  emptyLabel?: string
  onEmptyAction?: () => void
  emptyActionLabel?: string
  compact?: boolean
}

/**
 * The signature element of the identity.
 *
 * Audio is the thing no competitor in this space has and the thing the whole
 * wearable-translation goal depends on, so it gets the visual weight the
 * decorative textile patterns used to take.
 *
 * The bars are decoded from the real audio via the Web Audio API rather than
 * generated, because a fake waveform that does not match what you hear is worse
 * than no waveform at all. Decoding fails gracefully to a plain player.
 *
 * The empty state matters as much as the full one: a flat line makes the
 * absence of a voice visible, and repeated down a page of a language with no
 * recordings it argues for contributing better than any copy could.
 */
export default function Waveform({
  src,
  caption,
  emptyLabel = 'No voice yet',
  onEmptyAction,
  emptyActionLabel = 'Record it',
  compact = false,
}: Props) {
  const [peaks, setPeaks] = useState<number[] | null>(null)
  const [playing, setPlaying] = useState(false)
  const [progress, setProgress] = useState(0)
  const [failed, setFailed] = useState(false)
  const audioRef = useRef<HTMLAudioElement | null>(null)

  const height = compact ? 28 : 44

  useEffect(() => {
    if (!src) return
    let cancelled = false

    ;(async () => {
      try {
        const response = await fetch(src)
        const buffer = await response.arrayBuffer()
        const Ctx =
          window.AudioContext ||
          (window as unknown as { webkitAudioContext: typeof AudioContext }).webkitAudioContext
        const ctx = new Ctx()
        const decoded = await ctx.decodeAudioData(buffer)
        const channel = decoded.getChannelData(0)
        const block = Math.floor(channel.length / BAR_COUNT) || 1

        const next: number[] = []
        for (let i = 0; i < BAR_COUNT; i += 1) {
          let sum = 0
          const start = i * block
          for (let j = 0; j < block; j += 1) sum += Math.abs(channel[start + j] || 0)
          next.push(sum / block)
        }

        const peak = Math.max(...next, 0.0001)
        if (!cancelled) setPeaks(next.map((value) => Math.max(0.06, value / peak)))
        void ctx.close()
      } catch {
        // CORS, an unsupported codec, or no Web Audio: fall back to the player.
        if (!cancelled) setFailed(true)
      }
    })()

    return () => {
      cancelled = true
    }
  }, [src])

  const toggle = useCallback(() => {
    const audio = audioRef.current
    if (!audio) return
    if (audio.paused) {
      void audio.play()
    } else {
      audio.pause()
    }
  }, [])

  /* ------------------------------------------------------------- empty */

  if (!src) {
    return (
      <div className="flex flex-wrap items-center gap-4">
        <div
          className="flex flex-1 min-w-[140px] items-center gap-[3px]"
          style={{ height }}
          aria-hidden="true"
        >
          {Array.from({ length: BAR_COUNT }).map((_, index) => (
            <span key={index} className="block h-[2px] flex-1 rounded-full bg-ink-200" />
          ))}
        </div>
        <div className="flex items-center gap-3">
          <span className="label text-signal-500">{emptyLabel}</span>
          {onEmptyAction && (
            <button type="button" onClick={onEmptyAction} className="btn-primary text-sm py-2 px-3">
              {emptyActionLabel}
            </button>
          )}
        </div>
      </div>
    )
  }

  /* ---------------------------------------------------------- fallback */

  if (failed) {
    return (
      <div>
        {/* eslint-disable-next-line jsx-a11y/media-has-caption */}
        <audio controls preload="none" src={src} className="w-full" />
        {caption && <p className="label text-ink-600 mt-2">{caption}</p>}
      </div>
    )
  }

  /* ------------------------------------------------------------- bars */

  const played = Math.round(progress * BAR_COUNT)

  return (
    <div>
      <div className="flex items-center gap-3">
        <button
          type="button"
          onClick={toggle}
          aria-label={playing ? 'Pause' : 'Play pronunciation'}
          className="grid h-10 w-10 shrink-0 place-items-center rounded-full bg-ink-900 text-paper transition-colors hover:bg-signal-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-signal-500"
        >
          {playing ? (
            <svg width="12" height="14" viewBox="0 0 12 14" aria-hidden="true">
              <rect width="4" height="14" rx="1" fill="currentColor" />
              <rect x="8" width="4" height="14" rx="1" fill="currentColor" />
            </svg>
          ) : (
            <svg width="13" height="14" viewBox="0 0 13 14" aria-hidden="true">
              <path d="M1 1.4v11.2a1 1 0 0 0 1.5.87l9.2-5.6a1 1 0 0 0 0-1.74L2.5.53A1 1 0 0 0 1 1.4Z" fill="currentColor" />
            </svg>
          )}
        </button>

        <button
          type="button"
          onClick={toggle}
          aria-label={playing ? 'Pause' : 'Play pronunciation'}
          className="flex flex-1 items-center gap-[3px] focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-signal-500"
          style={{ height }}
        >
          {(peaks ?? Array.from({ length: BAR_COUNT }, () => 0.22)).map((value, index) => (
            <span
              key={index}
              className={`block flex-1 rounded-full transition-colors ${
                index < played ? 'bg-signal-500' : 'bg-ink-300'
              }`}
              style={{ height: `${Math.max(8, value * 100)}%` }}
            />
          ))}
        </button>
      </div>

      {caption && <p className="label text-ink-600 mt-2">{caption}</p>}

      <audio
        ref={audioRef}
        src={src}
        preload="metadata"
        onPlay={() => setPlaying(true)}
        onPause={() => setPlaying(false)}
        onEnded={() => {
          setPlaying(false)
          setProgress(0)
        }}
        onTimeUpdate={(event) => {
          const audio = event.currentTarget
          if (audio.duration) setProgress(audio.currentTime / audio.duration)
        }}
        className="sr-only"
      />
    </div>
  )
}

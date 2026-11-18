'use client'

import { useEffect, useState } from 'react'
import { creditFor, sentencesWithWord, type SourceSentence } from '@/lib/api/sources'

// Real sentences that contain the word being written, from the licensed source
// datasets (sql/121). One click adds a sentence as an example, credited to its
// source; a reviewer still checks it like any other example.

type Props = {
  languageId?: string
  word: string
  /** Texts already on the entry, so they are not offered twice. */
  exclude: string[]
  onUse: (sentence: SourceSentence) => void
}

export default function SentenceSuggestions({ languageId, word, exclude, onUse }: Props) {
  const [found, setFound] = useState<SourceSentence[]>([])
  const [loading, setLoading] = useState(false)

  useEffect(() => {
    // Too short to search: the render below shows nothing in that case.
    const w = word.trim()
    if (!languageId || w.length < 2) return
    let cancelled = false
    const timer = setTimeout(async () => {
      setLoading(true)
      const result = await sentencesWithWord(languageId, w, 6)
      if (!cancelled) {
        setFound(result)
        setLoading(false)
      }
    }, 500)
    return () => {
      cancelled = true
      clearTimeout(timer)
    }
  }, [languageId, word])

  const taken = new Set(exclude.map((t) => t.trim().toLowerCase()))
  const offer = found.filter((s) => !taken.has(s.text.trim().toLowerCase())).slice(0, 4)
  if (!languageId || word.trim().length < 2 || (!loading && offer.length === 0)) return null

  return (
    <div className="mt-6 border border-ink-200 bg-paper-warm px-4 py-4">
      <p className="label mb-1 text-ink-900">Real sentences with &ldquo;{word.trim()}&rdquo;</p>
      <p className="mb-4 text-sm text-ink-600">
        From recorded speakers. Add one if it uses the word in this meaning.
      </p>
      {loading && offer.length === 0 ? (
        <p className="text-sm text-ink-500">Looking</p>
      ) : (
        <ul className="space-y-4">
          {offer.map((sentence) => (
            <li key={sentence.id} className="flex flex-wrap items-start justify-between gap-3">
              <div className="min-w-0 flex-1">
                <p className="text-ink-900">{sentence.text}</p>
                {(sentence.translation_en || sentence.translation_sw) && (
                  <p className="mt-0.5 text-sm text-ink-600">{sentence.translation_en || sentence.translation_sw}</p>
                )}
                <p className="mt-1 font-mono text-[11px] text-ink-500">
                  {creditFor(sentence)} · {sentence.licence}
                </p>
              </div>
              <button
                type="button"
                onClick={() => onUse(sentence)}
                className="shrink-0 border border-ink-300 px-3 py-1.5 text-sm font-semibold text-ink-700 transition-colors hover:border-ink-900"
              >
                Use This
              </button>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}

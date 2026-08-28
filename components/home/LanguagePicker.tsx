'use client'

import { useMemo, useState } from 'react'
import Link from 'next/link'
import type { LanguageState } from '@/lib/public-site'

/**
 * The homepage hero.
 *
 * A search box was the wrong question. Nobody arrives at a dictionary homepage
 * to look up a word, they search the web for it and land on the entry directly.
 * The people who do arrive here already know which language they care about,
 * so that is what we ask, and the answer is a real report on that language
 * rather than a marketing line.
 */
export default function LanguagePicker({ languages }: { languages: LanguageState[] }) {
  const [selectedId, setSelectedId] = useState('')

  const selected = useMemo(
    () => languages.find((language) => language.id === selectedId) ?? null,
    [languages, selectedId]
  )

  const nextStep = (language: LanguageState) => {
    if (language.entries === 0) {
      return {
        label: 'Be the first to add a word',
        href: `/contribute?lang=${language.code}`,
        why: 'Nothing has been recorded in this language yet.',
      }
    }
    if (language.recordings === 0) {
      return {
        label: 'Record the first word',
        href: `/explore?language=${language.id}`,
        why: 'It has words, but nobody has said one out loud yet.',
      }
    }
    if (language.percentCovered < 60) {
      return {
        label: 'Fill a gap',
        href: `/contribute/gaps?lang=${language.code}`,
        why: `${language.conceptsTotal - language.conceptsCovered} core meanings are still missing.`,
      }
    }
    return {
      label: 'Add more voices',
      href: `/explore?language=${language.id}`,
      why: 'Good word coverage. It needs more speakers recorded.',
    }
  }

  return (
    <div>
      <label htmlFor="home-language" className="label mb-3 block text-sand-300">
        Choose a language
      </label>

      <div className="flex flex-col gap-3 sm:flex-row">
        <select
          id="home-language"
          value={selectedId}
          onChange={(event) => setSelectedId(event.target.value)}
          className="select select-dark select-lg sm:max-w-md"
        >
          <option value="">Which language do you speak?</option>
          {languages.map((language) => (
            <option key={language.id} value={language.id}>
              {language.name}
              {language.nativeName ? ` (${language.nativeName})` : ''}
            </option>
          ))}
        </select>

        {selected && (
          <Link href={`/explore?language=${selected.id}`} className="btn-on-dark shrink-0">
            Browse {selected.name}
          </Link>
        )}
      </div>

      {selected ? (
        <div className="mt-8 border-t border-ink-700 pt-8">
          <dl className="grid grid-cols-2 gap-x-8 gap-y-6 sm:grid-cols-4">
            {[
              { label: 'Words', value: selected.entries.toLocaleString() },
              {
                label: 'Core meanings',
                value: `${selected.conceptsCovered}/${selected.conceptsTotal}`,
              },
              { label: 'Recordings', value: selected.recordings.toLocaleString() },
              { label: 'Voices', value: selected.speakers.toLocaleString() },
            ].map((stat) => (
              <div key={stat.label}>
                <dd className="tabular font-mono text-3xl font-semibold text-paper">
                  {stat.value}
                </dd>
                <dt className="label mt-1 text-ink-400">{stat.label}</dt>
              </div>
            ))}
          </dl>

          {/* Coverage as a bar, because a number alone does not show how far there is to go. */}
          <div className="mt-8">
            <div className="flex h-1.5 w-full bg-ink-700" role="img"
              aria-label={`${selected.percentCovered}% of core meanings covered`}>
              <div
                className="h-full bg-sand-300"
                style={{ width: `${Math.min(100, Math.max(1, selected.percentCovered))}%` }}
              />
            </div>
            <p className="mt-3 text-[0.9375rem] text-ink-300">
              {selected.recordings === 0
                ? `No one has recorded a word in ${selected.name} yet. That is the biggest gap.`
                : `${selected.entriesWithAudio} ${selected.entriesWithAudio === 1 ? 'word has' : 'words have'} audio, from ${selected.speakers} ${selected.speakers === 1 ? 'speaker' : 'speakers'}.`}
            </p>
          </div>

          <div className="mt-8 flex flex-col gap-3 sm:flex-row sm:items-center">
            <Link href={nextStep(selected).href} className="btn-primary">
              {nextStep(selected).label}
            </Link>
            <p className="text-[0.9375rem] text-ink-300">{nextStep(selected).why}</p>
          </div>
        </div>
      ) : (
        <p className="mt-6 max-w-xl text-[0.9375rem] text-ink-300">
          {languages.length} Kenyan languages are here so far. Pick yours and we will show you
          exactly what it has, what it is missing, and the fastest way to help.
        </p>
      )}
    </div>
  )
}

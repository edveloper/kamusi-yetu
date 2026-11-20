'use client'

import { useMemo, useState } from 'react'
import Link from 'next/link'
import Dropdown, { type DropdownOption } from '@/components/ui/Dropdown'
import type { LanguageStatus } from '@/lib/platform-status'
import { MACHINE_LEVEL_TEXT } from '@/lib/status-labels'
import StageTrack from '@/components/status/StageTrack'

/**
 * The homepage hero.
 *
 * A search box was the wrong question. Nobody arrives at a dictionary homepage
 * to look up a word, they search the web for it and land on the entry directly.
 * The people who do arrive here already know which language they care about,
 * so that is what we ask, and the answer is a real report on that language
 * rather than a marketing line. The figures are the same ones Coverage shows
 * (lib/platform-status.ts).
 */
export default function LanguagePicker({ languages }: { languages: LanguageStatus[] }) {
  const [selectedId, setSelectedId] = useState('')

  const selected = useMemo(
    () => languages.find((language) => language.id === selectedId) ?? null,
    [languages, selectedId]
  )

  // The native name is the second line and the size sits on the right, so
  // someone scanning for their own language finds the name they call it by and
  // can see, before choosing, whether there is anything in it yet.
  const options: DropdownOption[] = useMemo(
    () =>
      [...languages]
        .sort((a, b) => a.name.localeCompare(b.name))
        .map((language) => ({
          value: language.id,
          label: language.name,
          hint:
            language.nativeName && language.nativeName !== language.name
              ? language.nativeName
              : undefined,
          meta:
            language.entries > 0
              ? `${language.entries.toLocaleString()} words`
              : language.sentencePairs
                ? `${language.sentencePairs.toLocaleString()} sentences`
                : 'nothing yet',
        })),
    [languages]
  )

  // The most useful thing to do next in that language. Where it translates,
  // that is trying the translator, because every correction teaches it.
  const nextStep = (language: LanguageStatus) => {
    if (language.machine && language.machine !== 'bridge') {
      return {
        label: 'Translate a Sentence',
        href: `/translate?from=${language.code}&to=sw`,
        why:
          language.machine === 'trained'
            ? 'Whole sentences translate. Tell us when it gets one wrong.'
            : language.machine === 'early'
              ? 'Translation is early here. Every correction you make teaches it.'
              : 'It uses the translator as it comes. Your corrections help us train it.',
      }
    }
    if (language.entries === 0) {
      return {
        label: 'Add the First Word',
        href: `/contribute?lang=${language.code}`,
        why: 'Nothing has been added in this language yet.',
      }
    }
    if (language.percentCovered < 60) {
      return {
        label: 'Fill a Gap',
        href: `/contribute/gaps?lang=${language.code}`,
        why: `${language.conceptsTotal - language.conceptsCovered} core meanings are still missing.`,
      }
    }
    return {
      label: 'Record a Word',
      href: `/explore?language=${language.id}`,
      why: 'Good word coverage. It needs speakers recorded.',
    }
  }

  const translating = languages.filter((l) => l.machine).length

  return (
    <div>
      <label htmlFor="home-language" className="label mb-3 block text-sand-300">
        Choose a language
      </label>

      <div className="flex flex-col gap-3 sm:flex-row">
        <div className="sm:max-w-md sm:flex-1">
          <Dropdown
            id="home-language"
            value={selectedId}
            onChange={setSelectedId}
            options={options}
            placeholder="Which language do you speak?"
            tone="dark"
            size="lg"
            aria-label="Choose a language"
            searchPlaceholder="Find your language"
          />
        </div>

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
                label: 'Sentence pairs',
                value: selected.sentencePairs === null ? 'Not counted' : selected.sentencePairs.toLocaleString(),
              },
              { label: 'Translation', value: MACHINE_LEVEL_TEXT[selected.machine ?? 'none'].label },
              { label: 'Recordings', value: selected.recordings.toLocaleString() },
            ].map((stat) => (
              <div key={stat.label}>
                <dd className="tabular font-mono text-3xl font-semibold text-paper">
                  {stat.value}
                </dd>
                <dt className="label mt-1 text-ink-400">{stat.label}</dt>
              </div>
            ))}
          </dl>

          {/* The four stages, the same track the Coverage page draws. */}
          <div className="mt-8 max-w-md">
            <StageTrack stages={selected.stages} tone="dark" showLabels />
            <p className="mt-4 text-[0.9375rem] text-ink-300">
              {MACHINE_LEVEL_TEXT[selected.machine ?? 'none'].body}{' '}
              {selected.recordings === 0
                ? `No one has recorded ${selected.name} yet.`
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
          {languages.length} languages so far, {translating} of them with sentence translation.
          Pick yours and we will show you what it has, what it is missing, and the fastest way to
          help.
        </p>
      )}
    </div>
  )
}

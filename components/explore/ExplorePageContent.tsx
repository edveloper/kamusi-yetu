'use client'

import { useMemo, useState } from 'react'
import Link from 'next/link'
import { CATEGORIES } from '@/lib/constants'
import { getLanguageGroupNote } from '@/lib/constants/languageNotes'
import type { Language } from '@/lib/types/database'
import SearchAutocomplete from '@/components/SearchAutocomplete'

const ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')

function buildSearchHref(params: {
  q?: string
  language?: string
  category?: string
  letter?: string
  kind?: 'all' | 'word' | 'phrase'
}) {
  const query = new URLSearchParams()
  if (params.q && params.q.trim()) query.set('q', params.q.trim())
  if (params.language && params.language !== 'all') query.set('language', params.language)
  if (params.category && params.category !== 'all') query.set('category', params.category)
  if (params.letter && params.letter !== 'all') query.set('letter', params.letter)
  if (params.kind && params.kind !== 'all') query.set('kind', params.kind)

  const qs = query.toString()
  return qs ? `/search?${qs}` : '/search'
}

type LanguageGroup = {
  key: string
  label: string
  languages: Language[]
}

type CountySummary = {
  countyName: string
  note: string
}

type ExplorePageContentProps = {
  languages: Language[]
  groupedLanguages: LanguageGroup[]
  languageCounts: Record<string, number>
  categoryCounts: Record<string, number>
  selectedCounty?: CountySummary
  countyLanguageCards: Array<Language & { count: number }>
}

export default function ExplorePageContent({
  languages,
  groupedLanguages,
  languageCounts,
  categoryCounts,
  selectedCounty,
  countyLanguageCards,
}: ExplorePageContentProps) {
  const [expandedCategories, setExpandedCategories] = useState(false)
  const [expandedGroups, setExpandedGroups] = useState<Record<string, boolean>>({})

  const languageCards = useMemo(
    () =>
      languages
        .map((lang) => ({ ...lang, count: languageCounts[lang.id] || 0 }))
        .sort((a, b) => b.count - a.count),
    [languages, languageCounts]
  )

  const popularLanguages = languageCards.slice(0, 5)
  const underdocumentedLanguages = languageCards
    .filter((lang) => lang.count > 0)
    .sort((a, b) => a.count - b.count)
    .slice(0, 5)

  return (
    <div className="min-h-screen bg-neutral-100 font-sans">
      <div className="relative overflow-hidden bg-heritage-dark text-white py-20 md:py-28 px-4 sm:px-6">
        <div className="relative max-w-5xl mx-auto text-center">
          <p className="text-xs uppercase tracking-[0.35em] text-accent-300 mb-4 font-semibold">Discover Kenya's Languages</p>
          <h1 className="text-5xl md:text-6xl lg:text-7xl font-black leading-tight max-w-3xl mx-auto font-display">Explore Our Heritage</h1>
          <p className="mt-6 text-base md:text-lg text-white max-w-2xl mx-auto leading-8">
            Find the words your ancestors spoke. Discover which languages need your help. See how Kenya's languages are growing.
          </p>

          <div className="mt-10 max-w-4xl mx-auto">
            <form action="/search" className="relative">
              <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-[minmax(0,1fr)_170px_170px_170px_90px] gap-3">
                <SearchAutocomplete
                  name="q"
                  formMode
                  placeholder="A word, a phrase, a story..."
                  inputClassName="w-full px-4 py-3 rounded-xl bg-neutral-50 text-neutral-900 font-semibold placeholder:text-neutral-600"
                />
                <select
                  name="language"
                  defaultValue="all"
                  className="px-4 py-3 rounded-xl bg-white text-neutral-900 font-semibold"
                >
                  <option value="all">All languages</option>
                  {groupedLanguages.map((group) => (
                    <optgroup key={group.key} label={group.label}>
                      {group.languages.map((lang) => (
                        <option key={lang.id} value={lang.id}>
                          {lang.name}
                        </option>
                      ))}
                    </optgroup>
                  ))}
                </select>
                <select
                  name="category"
                  defaultValue="all"
                  className="px-4 py-3 rounded-xl bg-white text-neutral-900 font-semibold"
                >
                  <option value="all">All topics</option>
                  {CATEGORIES.map((category) => (
                    <option key={category.id} value={category.id}>
                      {category.name}
                    </option>
                  ))}
                </select>
                <select
                  name="kind"
                  defaultValue="all"
                  className="px-4 py-3 rounded-xl bg-white text-neutral-900 font-semibold"
                >
                  <option value="all">Words + Phrases</option>
                  <option value="word">Words only</option>
                  <option value="phrase">Phrases only</option>
                </select>
                <button
                  type="submit"
                  className="w-full md:w-auto px-4 py-3 rounded-xl bg-heritage-dark hover:bg-heritage-darker transition-colors font-black text-xs uppercase tracking-widest text-white"
                >
                  Search
                </button>
              </div>
            </form>
          </div>

          <div className="mt-6 flex flex-wrap justify-center gap-2 text-sm">
            <Link className="px-4 py-2 rounded-full bg-white/10 hover:bg-white/20 border border-white/20" href="/search">
              Full Dictionary
            </Link>
            <Link className="px-4 py-2 rounded-full bg-white/10 hover:bg-white/20 border border-white/20" href="/search?kind=phrase">
              Browse Phrases
            </Link>
            <Link className="px-4 py-2 rounded-full bg-white/10 hover:bg-white/20 border border-white/20" href="/search?letter=A">
              Browse A-Z
            </Link>
            <Link className="px-4 py-2 rounded-full bg-white/10 hover:bg-white/20 border border-white/20" href="/translate">
              Go to Translate
            </Link>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-16 relative z-20">
        <div className="surface-card p-8 md:p-10 shadow-medium overflow-hidden">
          <div className="grid gap-8 md:grid-cols-[1.5fr_1fr] mb-14">
            <div>
              <p className="text-[10px] font-black uppercase tracking-[0.25em] text-accent-700 mb-3">Start Your Journey</p>
              <h2 className="text-3xl font-black text-heritage-dark font-display mb-4">Find your language. Share your words.</h2>
              <p className="text-neutral-600 font-medium leading-relaxed mb-6">
                Browse the words that matter most. See which languages are thriving and which need your contribution. Every word you add strengthens our archive.
              </p>
              <div className="grid gap-4">
                {featuredExamples.map((group) => (
                  <div key={group.label} className={`rounded-3xl border p-5 ${group.tone}`}>
                    <p className="text-[10px] font-black uppercase tracking-[0.2em] text-neutral-600 mb-4">{group.label}</p>
                    <div className="space-y-3">
                      {group.items.map((item) => (
                        <div key={`${item.source}-${item.sourceLang}`} className="grid gap-3 md:grid-cols-[minmax(0,1fr)_auto] items-center rounded-2xl bg-neutral-50/90 px-4 py-3">
                          <div>
                            <p className="text-lg font-black text-neutral-900">{item.source}</p>
                            <p className="text-[10px] font-black uppercase tracking-[0.2em] text-neutral-600">{item.sourceLang}</p>
                          </div>
                          <div className="text-neutral-600 font-black text-right">
                            <p className="text-lg font-black text-accent-700">{item.target}</p>
                            <p className="text-[10px] font-black uppercase tracking-[0.2em] text-neutral-600">{item.targetLang}</p>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                ))}
              </div>
            </div>

            <div className="grid gap-6">
              <div className="surface-card p-6 md:p-8 shadow-medium">
                <p className="text-[10px] font-black uppercase tracking-[0.2em] text-neutral-600 mb-4">Popular language groups</p>
                <div className="space-y-3">
                  {popularLanguages.map((lang) => (
                    <Link key={lang.id} href={`/search?language=${lang.id}`} className="flex items-center justify-between rounded-2xl bg-neutral-100 px-4 py-3 hover:bg-accent-50 transition-colors">
                      <div>
                        <p className="font-black text-heritage-dark">{lang.name}</p>
                        <p className="text-[10px] uppercase tracking-[0.2em] text-neutral-600">{lang.native_name}</p>
                      </div>
                      <span className="text-sm font-black text-accent-700">{lang.count}</span>
                    </Link>
                  ))}
                </div>
              </div>

              <div className="surface-card p-6 md:p-8 shadow-medium bg-accent-50 border-accent-100">
                <p className="text-[10px] font-black uppercase tracking-[0.2em] text-accent-700 mb-4">Underdocumented groups</p>
                <div className="space-y-3">
                  {underdocumentedLanguages.map((lang) => (
                    <Link key={lang.id} href={`/search?language=${lang.id}`} className="flex items-center justify-between rounded-2xl bg-white px-4 py-3 hover:bg-accent-100/40 transition-colors">
                      <div>
                        <p className="font-black text-heritage-dark">{lang.name}</p>
                        <p className="text-[10px] uppercase tracking-[0.2em] text-neutral-600">{lang.native_name}</p>
                      </div>
                      <span className="text-sm font-black text-accent-700">{lang.count}</span>
                    </Link>
                  ))}
                </div>
                <p className="text-sm text-accent-900 font-medium leading-relaxed mt-5">
                  These communities are still growing in the dictionary and are a strong place to discover, contribute, and help strengthen coverage.
                </p>
              </div>
            </div>
          </div>

          {selectedCounty && countyLanguageCards.length > 0 ? (
            <div className="border-t border-accent-100 pt-10 mb-14">
              <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between mb-6">
                <div>
                  <p className="text-[10px] font-black uppercase tracking-[0.25em] text-accent-700">County focus</p>
                  <h2 className="text-3xl font-black text-heritage-dark font-display">{selectedCounty.countyName}</h2>
                </div>
                <Link
                  href="/explore"
                  className="rounded-full border border-accent-200 bg-white/90 px-4 py-2 text-[10px] font-black uppercase tracking-widest text-accent-700 hover:bg-white transition"
                >
                  Clear County
                </Link>
              </div>
              <p className="text-neutral-600 font-medium leading-relaxed mb-8 max-w-3xl">
                These are the language communities currently mapped to {selectedCounty.countyName}. Start here if you want county-specific discovery before widening back out to the full dictionary.
              </p>
              <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
                {countyLanguageCards.map((lang) => (
                  <Link href={`/search?language=${lang.id}`} key={`county-${lang.id}`} className="group">
                    <div className="bg-accent-50 rounded-[2rem] p-6 border border-accent-300/30 shadow-soft hover:shadow-xl hover:-translate-y-1 transition-all duration-300 h-full">
                      <div className="flex justify-between items-start mb-6">
                        <div className="w-12 h-12 bg-accent-100 rounded-xl flex items-center justify-center text-xs font-black text-heritage-dark">
                          KE
                        </div>
                        <span className="text-[10px] font-black text-accent-700 bg-accent-100 px-3 py-1 rounded-full uppercase tracking-[0.15em]">
                          {lang.code || 'KEN'}
                        </span>
                      </div>
                      <h3 className="text-xl font-black text-heritage-dark mb-1 font-display group-hover:text-accent-700 transition-colors">{lang.name}</h3>
                      <p className="text-neutral-600 text-xs font-bold italic mb-6">{lang.native_name}</p>
                      <div className="pt-4 border-t border-accent-100 flex justify-between items-center">
                        <span className="text-xs font-black text-neutral-600 uppercase tracking-widest">
                          <b className="text-accent-700 text-sm">{lang.count}</b> records
                        </span>
                        <span className="text-accent-500 font-bold group-hover:translate-x-1 transition-transform">→</span>
                      </div>
                    </div>
                  </Link>
                ))}
              </div>
            </div>
          ) : null}
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <section className="mt-20 mb-16">
          <div className="flex items-center gap-4 mb-8">
            <h2 className="text-4xl font-black text-heritage-dark font-display">By Community</h2>
            <div className="h-px flex-1 bg-accent-300/40" />
          </div>
        <div className="space-y-12">
          {groupedLanguages.map((group) => {
            const isExpanded = expandedGroups[group.key]
            const visibleLanguages = isExpanded ? group.languages : group.languages.slice(0, 4)

            return (
              <div key={group.key} className="surface-card p-8 shadow-medium">
                <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between mb-6">
                  <div>
                    <p className="text-[10px] font-black uppercase tracking-[0.22em] text-accent-700">{group.label}</p>
                    <p className="mt-2 text-neutral-600 font-medium leading-relaxed max-w-3xl">
                      {getLanguageGroupNote(group.key)}
                    </p>
                  </div>
                  {group.languages.length > 4 ? (
                    <button
                      type="button"
                      onClick={() =>
                        setExpandedGroups((current) => ({
                          ...current,
                          [group.key]: !current[group.key],
                        }))
                      }
                      className="self-start rounded-full border border-accent-200 bg-white px-4 py-2 text-[10px] font-black uppercase tracking-[0.2em] text-accent-700 hover:bg-accent-50 transition"
                    >
                      {isExpanded ? 'Show less' : `Show ${group.languages.length - 4} more`}
                    </button>
                  ) : null}
                </div>

                <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
                  {visibleLanguages.map((lang) => (
                    <Link href={`/search?language=${lang.id}`} key={lang.id} className="group">
                      <div className="bg-accent-50 rounded-[2rem] p-6 border border-accent-300/30 shadow-soft hover:shadow-xl hover:-translate-y-1 transition-all duration-300 h-full">
                        <div className="flex justify-between items-start mb-5">
                          <div className="w-12 h-12 bg-accent-100 rounded-xl flex items-center justify-center text-xs font-black text-heritage-dark">KE</div>
                          <span className="text-[10px] font-black text-accent-700 bg-accent-100 px-3 py-1 rounded-full uppercase tracking-[0.15em]">{lang.code || 'KEN'}</span>
                        </div>
                        <h3 className="text-xl font-black text-heritage-dark mb-2 font-display group-hover:text-accent-700 transition-colors">{lang.name}</h3>
                        <p className="text-neutral-600 text-xs font-bold italic mb-6">{lang.native_name}</p>
                        <div className="pt-4 border-t border-accent-100 flex justify-between items-center">
                          <span className="text-xs font-black text-neutral-600 uppercase tracking-widest">
                            <b className="text-accent-700 text-sm">{languageCounts[lang.id] || 0}</b> records
                          </span>
                          <span className="text-accent-500 font-bold group-hover:translate-x-1 transition-transform">→</span>
                        </div>
                      </div>
                    </Link>
                  ))}
                </div>
              </div>
            )
          })}
        </div>
      </section>

      <section className="mb-16">
        <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between mb-10">
          <div>
            <h2 className="text-4xl font-black text-heritage-dark font-display">By Topic</h2>
            <p className="text-neutral-600 font-medium leading-relaxed mt-3 max-w-3xl">
              Browse the dictionary by topic and follow the categories with the richest coverage.
            </p>
          </div>
          <button
            type="button"
            onClick={() => setExpandedCategories((current) => !current)}
            className="rounded-full border border-accent-200 bg-white px-4 py-2 text-[10px] font-black uppercase tracking-[0.2em] text-accent-700 hover:bg-accent-50 transition"
          >
            {expandedCategories ? 'Show fewer' : 'Show all topics'}
          </button>
        </div>

        <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6">
          {(expandedCategories ? CATEGORIES : CATEGORIES.slice(0, 5)).map((category) => (
            <Link href={`/search?category=${category.id}`} key={category.id} className="group">
              <div className="bg-accent-50 rounded-[2rem] p-8 text-center border border-accent-300/30 shadow-soft hover:border-accent-400 hover:shadow-xl hover:-translate-y-1 transition-all duration-300 h-full flex flex-col items-center justify-center">
                <span className="text-2xl mb-4 group-hover:text-accent-700 transition-colors">{category.icon}</span>
                <h3 className="text-sm font-black text-heritage-dark group-hover:text-accent-700 transition-colors tracking-tight leading-tight">{category.name}</h3>
                <div className="mt-4 inline-block bg-accent-100 px-3 py-1 rounded-full border border-accent-300">
                  <p className="text-[10px] font-black text-accent-700 uppercase tracking-tighter">
                    {categoryCounts[category.id] || 0} words
                  </p>
                </div>
              </div>
            </Link>
          ))}
        </div>
      </section>

      <section className="py-24">
        <div className="bg-heritage-dark rounded-2xl p-12 md:p-16 text-white shadow-strong">
          <div className="text-center">
            <h2 className="text-4xl font-black font-display mb-4">Be a custodian of culture</h2>
            <p className="text-white text-lg font-medium mb-8 max-w-3xl mx-auto">
              Our languages are only as alive as our willingness to share them. Is your grandmother&apos;s favorite saying here?
            </p>
            <div className="flex flex-wrap justify-center gap-4">
              <Link href="/contribute" className="px-8 py-4 rounded-lg bg-accent-300 text-heritage-dark font-black text-lg hover:bg-accent-400 transition shadow-soft">
                Add a word
              </Link>
              <Link href="/contribute?type=phrase" className="px-8 py-4 rounded-lg border-2 border-accent-300 text-white font-black text-lg hover:bg-accent-300/20 transition">
                Add a phrase
              </Link>
            </div>
          </div>
        </div>
      </section>
    </div>
  </div>
  )
}

const featuredExamples = [
  {
    label: 'Popular language groups',
    tone: 'bg-neutral-50 border-neutral-200',
    items: [
      { source: 'salama', sourceLang: 'Swahili', target: 'peace; safety', targetLang: 'English' },
      { source: 'mũndũ', sourceLang: 'Kikuyu', target: 'person', targetLang: 'English' },
      { source: 'Andu', sourceLang: 'Kikuyu', target: 'people; community members', targetLang: 'English' },
    ],
  },
  {
    label: 'Underdocumented language groups',
    tone: 'bg-accent-50 border-accent-100',
    items: [
      { source: 'poisho?', sourceLang: 'Pokot', target: 'hello', targetLang: 'English' },
      { source: 'Wukiere', sourceLang: 'Suba', target: 'good morning', targetLang: 'English' },
      { source: 'Akkam?', sourceLang: 'Orma', target: 'hello; how are you?', targetLang: 'English' },
    ],
  },
]

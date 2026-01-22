// components/SavedWordsList.tsx
'use client'

import Link from 'next/link'
import React from 'react'

type SavedRow = {
  id: string
  created_at?: string
  entry_id?: string
  entry?: {
    id: string
    headword: string
    language_id?: string
    part_of_speech?: string
    validation_status?: string
    created_by?: string
    contributor?: {
      display_name?: string
      avatar_url?: string
    } | null
  } | null
}

type Language = { id: string; name: string }

type Props = {
  items: SavedRow[]
  loading: boolean
  onUnsave: (entryOrSavedId: string) => void
  onLoadMore?: () => void
  showLoadMore?: boolean
  languages?: Language[]
  filterLang?: string | null
  onFilterChange?: (lang: string | null) => void
}

export default function SavedWordsList({
  items,
  loading,
  onUnsave,
  onLoadMore,
  showLoadMore,
  languages = [],
  filterLang,
  onFilterChange
}: Props) {
  const langName = (id?: string) => {
    if (!id) return ''
    const found = languages.find((l) => l.id === id)
    return found ? found.name : id
  }

  const copyList = () => {
    const text = items.map(s => s.entry?.headword || '[unavailable]').join('\n')
    try {
      navigator.clipboard.writeText(text)
    } catch (e) {
      // fallback for older browsers
      window.prompt('Copy saved words', text)
    }
  }

  return (
    <section className="bg-white rounded-[2.5rem] border border-stone-200 p-6 shadow-sm" role="region" aria-label="Saved words">
      <div className="flex items-center justify-between mb-4">
        <h3 className="text-lg font-black font-logo uppercase tracking-widest">Saved Words</h3>
        <div className="flex items-center gap-2">
          <select
            value={filterLang || ''}
            onChange={(e) => onFilterChange?.(e.target.value || null)}
            className="text-[10px] p-2 border rounded-lg bg-stone-50"
            aria-label="Filter saved words by language"
          >
            <option value="">All</option>
            {languages.map((l: any) => (
              <option key={l.id} value={l.id}>
                {l.name}
              </option>
            ))}
          </select>

          <button
            onClick={copyList}
            className="text-[10px] px-3 py-2 bg-stone-100 rounded-lg"
            aria-label="Copy saved words to clipboard"
          >
            Copy list
          </button>
        </div>
      </div>

      {loading ? (
        <div className="py-8 text-center text-stone-400">Loading...</div>
      ) : items.length === 0 ? (
        <div className="py-8 text-center text-stone-400">
          No saved words yet.
          <div className="mt-4">
            <Link href="/explore" className="text-emerald-600 font-black text-xs uppercase tracking-widest">Explore words</Link>
          </div>
        </div>
      ) : (
        <div className="space-y-3" role="list">
          {items.map((s) => {
            const e = s.entry

            if (!e) {
              return (
                <div key={s.id} className="flex items-center justify-between p-3 rounded-xl border border-stone-100 bg-stone-50" role="listitem">
                  <div className="min-w-0">
                    <div className="font-black text-sm text-stone-900 truncate">[Entry unavailable]</div>
                    <div className="text-[10px] text-stone-400">This saved item references an entry that could not be loaded.</div>
                  </div>
                  <div className="flex items-center gap-2">
                    <button
                      onClick={() => onUnsave(s.entry_id || s.id)}
                      className="text-red-600 text-[12px] px-3 py-2 rounded-lg bg-red-50 hover:bg-red-100"
                      aria-label="Remove saved word"
                    >
                      Remove
                    </button>
                  </div>
                </div>
              )
            }

            const contributorName = e.contributor?.display_name || null
            const contributorAvatar = e.contributor?.avatar_url || null

            return (
              <div key={s.id} className="flex items-center justify-between p-3 rounded-xl border border-stone-100 bg-stone-50" role="listitem">
                <div className="min-w-0 flex items-center gap-3">
                  {contributorAvatar ? (
                    <img
                      src={contributorAvatar}
                      alt={contributorName ? `${contributorName} avatar` : 'Contributor avatar'}
                      className="w-10 h-10 rounded-lg object-cover flex-shrink-0"
                    />
                  ) : (
                    <div className="w-10 h-10 rounded-lg bg-stone-200 flex items-center justify-center text-xs font-black text-stone-600 flex-shrink-0">
                      {e.headword?.[0]?.toUpperCase() || '?'}
                    </div>
                  )}

                  <div className="min-w-0">
                    <Link href={`/entry/${e.id}`} className="block">
                      <div className="font-black text-sm text-stone-900 truncate">{e.headword}</div>
                      <div className="text-[10px] text-stone-400 uppercase tracking-widest">
                        {langName(e.language_id)}{e.part_of_speech ? ` • ${e.part_of_speech}` : ''}
                      </div>
                    </Link>

                    {contributorName && (
                      <div className="text-[11px] text-stone-500 mt-1">
                        <span className="font-bold">{contributorName}</span>
                      </div>
                    )}
                  </div>
                </div>

                <div className="flex items-center gap-2">
                  <button
                    onClick={() => onUnsave(e.id || s.entry_id || s.id)}
                    className="text-red-600 text-[12px] px-3 py-2 rounded-lg bg-red-50 hover:bg-red-100"
                    aria-label={`Unsave ${e.headword}`}
                  >
                    Unsave
                  </button>
                </div>
              </div>
            )
          })}
        </div>
      )}

      {showLoadMore && (
        <div className="mt-4 text-center">
          <button onClick={onLoadMore} className="px-4 py-2 bg-emerald-600 text-white rounded-xl text-[10px] font-black uppercase tracking-widest">
            Load more
          </button>
        </div>
      )}
    </section>
  )
}

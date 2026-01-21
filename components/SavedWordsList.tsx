// components/SavedWordsList.tsx
'use client'

import Link from 'next/link'
import React from 'react'

type Props = {
  items: any[]
  loading: boolean
  onUnsave: (entryId: string) => void
  onLoadMore?: () => void
  showLoadMore?: boolean
  languages?: any[]
  filterLang?: string | null
  onFilterChange?: (lang: string | null) => void
}

export default function SavedWordsList({ items, loading, onUnsave, onLoadMore, showLoadMore, languages = [], filterLang, onFilterChange }: Props) {
  return (
    <section className="bg-white rounded-[2.5rem] border border-stone-200 p-6 shadow-sm">
      <div className="flex items-center justify-between mb-4">
        <h3 className="text-lg font-black font-logo uppercase tracking-widest">Saved Words</h3>
        <div className="flex items-center gap-2">
          <select
            value={filterLang || ''}
            onChange={(e) => onFilterChange?.(e.target.value || null)}
            className="text-[10px] p-2 border rounded-lg bg-stone-50"
          >
            <option value="">All</option>
            {languages.map((l: any) => <option key={l.id} value={l.id}>{l.name}</option>)}
          </select>
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
        <div className="space-y-3">
          {items.map((s: any) => {
            const e = s.entry
            return (
              <div key={s.id} className="flex items-center justify-between p-3 rounded-xl border border-stone-100 bg-stone-50">
                <div className="min-w-0">
                  <Link href={`/entry/${e.id}`} className="block">
                    <div className="font-black text-sm text-stone-900 truncate">{e.headword}</div>
                    <div className="text-[10px] text-stone-400 uppercase tracking-widest">{e.language_id} • {e.part_of_speech}</div>
                  </Link>
                </div>
                <div className="flex items-center gap-2">
                  <button onClick={() => onUnsave(e.id)} className="text-red-600 text-[12px] px-3 py-2 rounded-lg bg-red-50 hover:bg-red-100">
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

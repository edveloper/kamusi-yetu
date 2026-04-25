import Link from 'next/link'
import { getLanguageNote } from '@/lib/constants/languageNotes'
import { getHomepageData } from '@/lib/public-site'

export default async function HomePage() {
  const { languages, latest, wordOfTheDay } = await getHomepageData()
  const maturityLevels = ['Starter', 'Growing', 'Phrase-Ready', 'Review-Heavy']
  const activeLanguages = 37
  const verifiedEntries = 3015
  const verifiedPhrases = 394
  const currentPhase = "Phase 2 - Phrase Layer"

  const projectStats = [
    { label: 'Languages', value: activeLanguages },
    { label: 'Verified Entries', value: verifiedEntries },
    { label: 'Phrase Packs', value: verifiedPhrases },
  ]

  return (
    <div className="min-h-screen bg-stone-50 font-sans pb-20">
      {/* Project Status Ribbon */}
      <div className="bg-emerald-50 text-emerald-900 px-4 sm:px-6 py-2 border-b border-emerald-100">
        <div className="max-w-7xl mx-auto">
          <div className="flex flex-wrap items-center justify-center gap-4 text-sm font-semibold uppercase tracking-[0.18em]">
            <span className="text-emerald-700">Live Dictionary Status</span>
            <span className="hidden sm:inline-block h-4 w-px bg-emerald-200" />
            {projectStats.map((stat) => (
              <span key={stat.label} className="inline-flex items-center gap-2 rounded-full bg-white border border-emerald-200 px-3 py-2 text-emerald-900">
                <span>{stat.label}:</span>
                <strong className="font-black text-emerald-700">{stat.value.toLocaleString()}</strong>
              </span>
            ))}
          </div>
        </div>
      </div>

      <div className="relative overflow-hidden bg-gradient-to-br from-emerald-700 to-emerald-800 text-white py-20 md:py-28 px-4 sm:px-6">
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_top_right,_rgba(255,255,255,0.12),_transparent_50%)]" />
        <div className="relative max-w-5xl mx-auto text-center">
          <p className="text-xs uppercase tracking-[0.35em] text-emerald-100 mb-4 font-semibold">A living archive for Kenyan languages</p>
          <h1 className="text-5xl md:text-6xl lg:text-7xl font-black leading-tight max-w-3xl mx-auto font-logo">Kamusi Yetu</h1>
          <p className="mt-6 text-base md:text-lg text-emerald-50 max-w-2xl mx-auto leading-8">
            Search words, explore language communities, and help preserve the phrases that keep our conversations rich and local.
          </p>

          <div className="mt-10 max-w-2xl mx-auto">
            <form action="/search" className="relative">
              <input
                type="text"
                name="q"
                placeholder="Search for a word, phrase, or meaning..."
                className="w-full rounded-[1.75rem] border border-emerald-200 bg-white text-stone-900 placeholder:text-stone-400 px-6 py-4 font-semibold shadow-sm focus:border-white focus:ring-4 focus:ring-emerald-400/20 outline-none transition"
              />
              <button
                type="submit"
                className="absolute right-2 top-1/2 -translate-y-1/2 btn-primary px-7 py-3.5"
              >
                Search
              </button>
            </form>
            <div className="mt-4 flex flex-wrap justify-center gap-3 text-xs text-emerald-50">
              <span className="rounded-full bg-white/15 px-4 py-2">37 languages live</span>
              <span className="rounded-full bg-white/15 px-4 py-2">3015 verified entries</span>
              <span className="rounded-full bg-white/15 px-4 py-2">Phrase expansion underway</span>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 -mt-10 relative z-20">
        <div className="mb-10 surface-card p-6 md:p-8">
          <div className="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-5">
            <div>
              <p className="text-[10px] font-semibold uppercase tracking-[0.25em] text-emerald-700 mb-2">Building in public</p>
              <h2 className="text-3xl md:text-4xl font-black text-stone-900 font-logo">What’s live, and what’s next</h2>
              <p className="text-stone-600 font-medium mt-4 max-w-3xl leading-relaxed">
                The dictionary is currently live with verified entries and bridge-assisted translation candidates. Phrase packs, usage examples and richer language communities are the focus now.
              </p>
            </div>
            <div className="flex flex-wrap gap-2">
              {maturityLevels.map((level) => (
                <span
                  key={level}
                  className="rounded-full border border-stone-200 bg-stone-50 px-4 py-2 text-[10px] font-semibold uppercase tracking-[0.18em] text-stone-600"
                >
                  {level}
                </span>
              ))}
            </div>
          </div>
        </div>

        <div className="grid lg:grid-cols-3 gap-8">
          <div className="lg:col-span-2">
            <Link href={wordOfTheDay ? `/entry/${wordOfTheDay.id}` : '#'}>
              <div className="surface-card group h-full border-emerald-200 transition hover:border-emerald-400">
                <div className="p-8 md:p-10 space-y-6">
                  <div className="inline-flex items-center rounded-full bg-emerald-100/90 px-4 py-2 text-sm font-semibold text-emerald-900">
                    Word of the Day
                  </div>
                  <div>
                    <h2 className="text-5xl md:text-6xl font-black text-stone-900 mb-2 font-logo group-hover:text-emerald-800 transition-colors">
                      {wordOfTheDay?.headword || 'Salama'}
                    </h2>
                    <p className="text-sm font-semibold uppercase tracking-[0.2em] text-emerald-700">{wordOfTheDay?.language?.name || 'Swahili'}</p>
                  </div>
                  <div className="space-y-4 border-t border-stone-200 pt-4">
                    <div>
                      <p className="text-xs font-black uppercase tracking-[0.2em] text-stone-500 mb-2">Definition</p>
                      <p className="text-lg text-stone-700 leading-relaxed font-medium">
                        {wordOfTheDay?.primary_definition || 'A state of peace, safety, and well-being.'}
                      </p>
                    </div>
                    {wordOfTheDay?.part_of_speech && (
                      <div>
                        <p className="text-xs font-black uppercase tracking-[0.2em] text-stone-500 mb-2">Part of Speech</p>
                        <p className="text-base text-stone-700 font-medium italic">{wordOfTheDay.part_of_speech}</p>
                      </div>
                    )}
                    <div className="pt-2">
                      <p className="text-xs font-black text-emerald-600 hover:text-emerald-700 transition">View full entry →</p>
                    </div>
                  </div>
                </div>
              </div>
            </Link>
          </div>

          <div className="space-y-6">
            <div className="surface-card h-full p-8">
              <h3 className="text-base font-black font-logo uppercase tracking-[0.3em] mb-6 text-emerald-700">Latest additions</h3>
              <div className="space-y-5">
                {latest.map((entry) => (
                  <Link key={entry.id} href={`/entry/${entry.id}`} className="block">
                    <div className="rounded-2xl border border-stone-200 bg-stone-50 p-5 hover:border-emerald-200 transition">
                      <p className="text-lg font-bold text-stone-900 mb-1">{entry.headword}</p>
                      <p className="text-[10px] uppercase tracking-[0.25em] text-stone-500 font-bold mb-3">{entry.language?.name}</p>
                      <p className="text-sm text-stone-600 italic line-clamp-2">“{entry.primary_definition}”</p>
                    </div>
                  </Link>
                ))}
              </div>
            </div>
          </div>
        </div>

        <div className="mt-24">
          <div className="flex items-center gap-6 mb-12">
            <h2 className="text-2xl font-black text-stone-900 font-logo uppercase tracking-tight">Communities</h2>
            <div className="h-px flex-1 bg-stone-200"></div>
            <Link href="/explore" className="text-[10px] font-black uppercase tracking-widest text-emerald-600">
              View All
            </Link>
          </div>
          <div className="mb-6 rounded-2xl border border-emerald-200 bg-emerald-50 px-5 py-4">
            <p className="text-sm text-emerald-800 font-semibold leading-relaxed">
              Language expansion is in progress. If your language has fewer entries, your contributions have immediate impact.
            </p>
          </div>
          <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
            {languages.slice(0, 6).map((lang) => (
              <Link key={lang.id} href={`/search?language=${lang.id}`} className="group">
                <div className="bg-white border border-stone-200 p-6 rounded-2xl hover:border-emerald-400 hover:shadow-md hover:bg-emerald-50/30 transition-all h-full flex flex-col">
                  <div className="flex items-center justify-between mb-3">
                    <p className="font-black text-stone-800 group-hover:text-emerald-700 transition-colors">{lang.name}</p>
                    <span className="text-[9px] font-black uppercase tracking-widest text-emerald-700 bg-emerald-100 border border-emerald-200 px-2 py-1 rounded-md">
                      {(lang.code || 'KE').toUpperCase()}
                    </span>
                  </div>
                  <p className="text-xs text-stone-600 leading-relaxed line-clamp-3 flex-grow">{getLanguageNote(lang.code)}</p>
                </div>
              </Link>
            ))}
          </div>
        </div>

        <div className="bg-gradient-to-r from-emerald-600 to-emerald-700 rounded-3xl p-12 md:p-16 text-white shadow-xl mt-16">
          <div className="text-center">
            <h2 className="text-4xl font-black font-logo mb-4">Help expand the dictionary</h2>
            <p className="text-emerald-100 text-lg font-medium mb-8 max-w-3xl mx-auto">
              Add a word or phrase from your language, and make the dictionary stronger for your community. Every contribution helps move a language toward phrase-ready coverage.
            </p>
            <div className="flex flex-wrap justify-center gap-4">
              <Link href="/contribute" className="px-8 py-4 rounded-2xl bg-white text-emerald-900 font-black text-lg hover:bg-emerald-50 transition">
                Add a word
              </Link>
              <Link href="/contribute?type=phrase" className="px-8 py-4 rounded-2xl border-2 border-white text-white font-black text-lg hover:bg-white/10 transition">
                Add a phrase
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

import Link from 'next/link'
import { getLanguageNote } from '@/lib/constants/languageNotes'
import { getHomepageData } from '@/lib/public-site'

export default async function HomePage() {
  const { languages, latest, wordOfTheDay, stats } = await getHomepageData()
  const maturityLevels = ['Starter', 'Growing', 'Phrase-Ready', 'Review-Heavy']
  const currentPhase = "Phase 2 - Phrase Layer"

  const projectStats = [
    { label: 'Languages', value: stats.totalLanguages },
    { label: 'Verified Entries', value: stats.totalEntries },
    { label: 'Phrase Packs', value: stats.totalPhrases },
  ]

  return (
    <div className="min-h-screen bg-neutral-100 font-sans pb-20">
      {/* Project Status Ribbon */}
      <div className="bg-primary-100 text-primary-700 border-b border-primary-300">
        {/* Mobile: auto-scrolling ticker */}
        <div className="md:hidden overflow-hidden py-2">
          <div className="ticker-track">
            {[0, 1].map((copy) => (
              <div key={copy} className="flex items-center gap-5 px-6 whitespace-nowrap" aria-hidden={copy === 1 ? true : undefined}>
                <span className="text-primary-600 text-sm font-semibold uppercase tracking-[0.18em]">Live Dictionary Status</span>
                <span className="inline-block h-4 w-px bg-primary-300" />
                {projectStats.map((stat) => (
                  <span key={stat.label} className="inline-flex items-center gap-2 rounded-full bg-neutral-100 border border-primary-300 px-3 py-1.5 text-primary-900 text-sm font-semibold uppercase tracking-[0.18em]">
                    <span>{stat.label}:</span>
                    <strong className="font-black text-primary-600">{stat.value.toLocaleString()}</strong>
                  </span>
                ))}
                <span className="inline-block w-8" />
              </div>
            ))}
          </div>
        </div>

        {/* Desktop: static centered layout */}
        <div className="hidden md:block px-6 py-2">
          <div className="max-w-7xl mx-auto">
            <div className="flex items-center justify-center gap-4 text-sm font-semibold uppercase tracking-[0.18em]">
              <span className="text-primary-600">Live Dictionary Status</span>
              <span className="inline-block h-4 w-px bg-primary-300" />
              {projectStats.map((stat) => (
                <span key={stat.label} className="inline-flex items-center gap-2 rounded-full bg-neutral-100 border border-primary-300 px-3 py-2 text-primary-900">
                  <span>{stat.label}:</span>
                  <strong className="font-black text-primary-600">{stat.value.toLocaleString()}</strong>
                </span>
              ))}
            </div>
          </div>
        </div>
      </div>

      <div className="relative overflow-hidden bg-heritage-dark text-white py-20 md:py-28 px-4 sm:px-6">
        <div className="relative max-w-5xl mx-auto text-center">
          <p className="text-xs uppercase tracking-[0.35em] text-accent-300 mb-4 font-semibold">Our Languages, Our Heritage</p>
          <h1 className="text-5xl md:text-6xl lg:text-7xl font-black leading-tight max-w-3xl mx-auto font-display">Kamusi Yetu</h1>
          <p className="mt-6 text-base md:text-lg text-white max-w-2xl mx-auto leading-8">
            A living archive where Kenya's languages breathe. Discover words your grandmother spoke. Share the phrases that carry your culture forward.
          </p>

          <div className="mt-10 max-w-2xl mx-auto">
            <form action="/search" className="relative">
              <input
                type="text"
                name="q"
                placeholder="Find a word, a phrase, a memory..."
                className="w-full rounded-2xl border border-accent-300/40 bg-neutral-100 text-neutral-900 placeholder:text-neutral-400 px-6 py-4 font-semibold shadow-soft focus:border-accent-300 focus:ring-4 focus:ring-heritage-light/20 outline-none transition"
              />
              <button
                type="submit"
                className="absolute right-2 top-1/2 -translate-y-1/2 btn-primary px-7 py-3.5"
              >
                Search
              </button>
            </form>
            <div className="mt-4 flex flex-wrap justify-center gap-3 text-xs text-white">
              <span className="rounded-full bg-accent-300/20 px-4 py-2">37 languages preserved</span>
              <span className="rounded-full bg-accent-300/20 px-4 py-2">3,000+ verified words</span>
              <span className="rounded-full bg-accent-300/20 px-4 py-2">Growing phrase collection</span>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 -mt-10 relative z-20">
        <div className="mb-10 surface-card p-6 md:p-8 border-accent-300/40">
          <div className="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-5">
            <div>
              <p className="text-[10px] font-semibold uppercase tracking-[0.25em] text-heritage-dark mb-2">Our Progress</p>
              <h2 className="text-3xl md:text-4xl font-black text-neutral-900 font-display">What we've preserved. What's coming.</h2>
              <p className="text-neutral-700 font-medium mt-4 max-w-3xl leading-relaxed">
                Today you can search verified words and their meanings. Soon you'll find the full phrases and stories that bring language to life.
              </p>
            </div>
            <div className="flex flex-wrap gap-2">
              {maturityLevels.map((level) => (
                <span
                  key={level}
                  className="rounded-lg border border-accent-300/30 bg-accent-50 px-4 py-2 text-[10px] font-semibold uppercase tracking-[0.18em] text-accent-700"
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
              <div className="surface-card group h-full border-accent-300/40 transition hover:border-accent-300 hover:shadow-medium">
                <div className="p-8 md:p-10 space-y-6">
                  <div className="inline-flex items-center rounded-lg bg-accent-100 px-4 py-2 text-sm font-semibold text-accent-900">
                    Word to Remember
                  </div>
                  <div>
                    <h2 className="text-5xl md:text-6xl font-black text-neutral-900 mb-2 font-display group-hover:text-heritage-dark transition-colors">
                      {wordOfTheDay?.headword || 'Salama'}
                    </h2>
                    <p className="text-sm font-semibold uppercase tracking-[0.2em] text-heritage-dark">{wordOfTheDay?.language?.name || 'Swahili'}</p>
                  </div>
                  <div className="space-y-4 border-t border-neutral-200 pt-4">
                    <div>
                      <p className="text-xs font-black uppercase tracking-[0.2em] text-neutral-500 mb-2">Definition</p>
                      <p className="text-lg text-neutral-700 leading-relaxed font-medium">
                        {wordOfTheDay?.primary_definition || 'A state of peace, safety, and well-being.'}
                      </p>
                    </div>
                    {wordOfTheDay?.part_of_speech && (
                      <div>
                        <p className="text-xs font-black uppercase tracking-[0.2em] text-neutral-500 mb-2">Part of Speech</p>
                        <p className="text-base text-neutral-700 font-medium italic">{wordOfTheDay.part_of_speech}</p>
                      </div>
                    )}
                    <div className="pt-2">
                      <p className="text-xs font-black text-heritage-dark hover:text-heritage-darker transition">View full entry →</p>
                    </div>
                  </div>
                </div>
              </div>
            </Link>
          </div>

          <div className="space-y-6">
            <div className="surface-card h-full p-8 pattern-shuka">
              <h3 className="text-base font-black font-display uppercase tracking-[0.3em] mb-6 text-heritage-dark">Latest additions</h3>
              <div className="space-y-5">
                {latest.map((entry) => (
                  <Link key={entry.id} href={`/entry/${entry.id}`} className="block">
                    <div className="rounded-lg border border-accent-300/30 bg-accent-50 p-5 hover:border-accent-300 hover:shadow-soft transition">
                      <p className="text-lg font-bold text-neutral-900 mb-1">{entry.headword}</p>
                      <p className="text-[10px] uppercase tracking-[0.25em] text-heritage-dark font-bold mb-3">{entry.language?.name}</p>
                      <p className="text-sm text-neutral-700 italic line-clamp-2">"{entry.primary_definition}"</p>
                    </div>
                  </Link>
                ))}
              </div>
            </div>
          </div>
        </div>

        <div className="mt-24">
          <div className="flex items-center gap-6 mb-12">
            <h2 className="text-2xl font-black text-neutral-900 font-display uppercase tracking-tight">Communities</h2>
            <div className="h-px flex-1 bg-neutral-300"></div>
            <Link href="/explore" className="text-[10px] font-black uppercase tracking-widest text-heritage-dark">
              View All
            </Link>
          </div>
          <div className="mb-6 rounded-lg border border-accent-300/40 bg-accent-50 px-5 py-4 pattern-beads">
            <p className="text-sm text-accent-900 font-semibold leading-relaxed">
              Language expansion is in progress. If your language has fewer entries, your contributions have immediate impact.
            </p>
          </div>
          <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
            {languages.slice(0, 6).map((lang) => (
              <Link key={lang.id} href={`/search?language=${lang.id}`} className="group">
                <div className="bg-neutral-100 border border-accent-300/30 p-6 rounded-lg hover:border-accent-300 hover:shadow-soft hover:bg-accent-50/50 transition-all h-full flex flex-col">
                  <div className="flex items-center justify-between mb-3">
                    <p className="font-black text-neutral-900 group-hover:text-heritage-dark transition-colors">{lang.name}</p>
                    <span className="text-[9px] font-black uppercase tracking-widest text-heritage-dark bg-accent-100 border border-accent-300/40 px-2 py-1 rounded-md">
                      {(lang.code || 'KE').toUpperCase()}
                    </span>
                  </div>
                  <p className="text-xs text-neutral-700 leading-relaxed line-clamp-3 flex-grow">{getLanguageNote(lang.code)}</p>
                </div>
              </Link>
            ))}
          </div>
        </div>

        <div className="bg-heritage-dark rounded-2xl p-12 md:p-16 text-white shadow-strong mt-16">
          <div className="text-center">
            <h2 className="text-4xl font-black font-display mb-4">Help expand the dictionary</h2>
            <p className="text-white text-lg font-medium mb-8 max-w-3xl mx-auto">
              Add a word or phrase from your language, and make the dictionary stronger for your community. Every contribution helps move a language toward phrase-ready coverage.
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
      </div>
    </div>
  )
}

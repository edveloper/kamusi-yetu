'use client'

import Link from 'next/link'

export default function AboutPage() {
  const maturityLevels = [
    {
      title: 'Starter',
      desc: 'A language has enough verified seed entries to appear in the product, but still needs more words, phrases, and examples.',
    },
    {
      title: 'Growing',
      desc: 'Word coverage is improving and phrase packs are underway, making the dictionary increasingly useful for daily lookups.',
    },
    {
      title: 'Phrase-Ready',
      desc: 'A language has meaningful phrase coverage and usage context, so translation quality improves beyond isolated words.',
    },
    {
      title: 'Review-Heavy',
      desc: 'A language is visible, but entries still need deeper expert or community review before it can be treated as broadly reliable.',
    },
  ]

  return (
    <div className="min-h-screen bg-stone-50 pb-20">
      <div className="relative overflow-hidden bg-gradient-to-br from-emerald-700 to-emerald-800 text-white py-20 md:py-28 px-4 sm:px-6">
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_top_right,_rgba(255,255,255,0.12),_transparent_50%)]" />
        <div className="relative max-w-5xl mx-auto text-center">
          <p className="text-xs uppercase tracking-[0.35em] text-emerald-100 mb-4 font-semibold">Our story and mission</p>
          <h1 className="text-5xl md:text-6xl lg:text-7xl font-black leading-tight max-w-3xl mx-auto font-logo">Our Story</h1>
          <p className="mt-6 text-base md:text-lg text-emerald-50 max-w-2xl mx-auto leading-8">
            Every Kenyan language is a treasure. We are here to ensure our voices remain audible tomorrow.
          </p>
        </div>
      </div>

      <div className="max-w-4xl mx-auto px-4 -mt-16 relative z-20">
        <section className="bg-white rounded-[3rem] shadow-xl border border-stone-200 p-10 md:p-16 mb-12">
          <div className="flex items-center gap-4 mb-8">
            <span className="text-4xl">KE</span>
            <h2 className="text-4xl font-black text-gray-900 font-logo">The Mission</h2>
          </div>
          <div className="space-y-8">
            <p className="text-xl text-stone-700 leading-relaxed font-medium">
              <span className="text-emerald-600 font-black">Kamusi Yetu</span> is more than a dictionary, it is a community-driven sanctuary for Kenya's linguistic diversity. From the dialects of the Lake Victoria shores to the heritage of the Taita hills.
            </p>
            <p className="text-xl text-stone-600 leading-relaxed italic border-l-4 border-emerald-100 pl-8 py-2">
              &ldquo;We believe that technology should serve heritage. By building a digital home for our mother tongues, we empower the next generation to speak with pride and precision.&rdquo;
            </p>
            <p className="text-lg text-stone-600 leading-relaxed font-medium">
              We are now in Phase 2: the phrase and usage expansion stage. Verified word lookup, bridge translation, and moderation workflows are live. Phrase packs, usage examples, and community rollout are actively expanding the platform. Sentence-level translation remains future work.
            </p>
          </div>
        </section>

        <section className="grid md:grid-cols-2 gap-8 mb-20">
          <div className="bg-white p-10 rounded-[2.5rem] border border-stone-200 shadow-sm hover:shadow-lg transition-all">
            <div className="w-14 h-14 bg-emerald-50 rounded-2xl flex items-center justify-center text-3xl mb-6">DB</div>
            <h3 className="text-2xl font-black text-emerald-900 mb-4 font-logo">Preservation</h3>
            <p className="text-stone-600 leading-relaxed font-medium">
              We focus on recording rare dialects, proverbs, and specialized vocabulary before they fade from daily conversation.
            </p>
          </div>
          <div className="bg-emerald-900 p-10 rounded-[2.5rem] text-white shadow-lg">
            <div className="w-14 h-14 bg-emerald-800 rounded-2xl flex items-center justify-center text-3xl mb-6">OK</div>
            <h3 className="text-2xl font-black mb-4 font-logo">Community</h3>
            <p className="text-emerald-100 opacity-80 leading-relaxed font-medium">
              Native speakers are the ultimate authorities. Every entry is contributed, reviewed, and refined by the community.
            </p>
          </div>
        </section>

        <div className="text-center mb-12">
          <h2 className="text-4xl font-black text-gray-900 font-logo mb-4">How it Works</h2>
          <p className="text-stone-500 font-bold uppercase tracking-widest text-xs">The Guardian's Journey</p>
        </div>

        <div className="grid gap-6 mb-24">
          {[
            { step: 1, title: 'Contribute', desc: 'Document words, pronunciations, and usage from your home language.' },
            { step: 2, title: 'Verify', desc: 'Community elders and language experts review entries for cultural accuracy.' },
            { step: 3, title: 'Learn', desc: 'Students, writers, and linguists search and preserve the vocabulary.' },
          ].map((item) => (
            <div
              key={item.step}
              className="group flex flex-col md:flex-row items-center gap-8 bg-white p-8 rounded-3xl border border-stone-100 shadow-sm hover:border-emerald-200 transition-all"
            >
              <div className="w-20 h-20 bg-stone-50 text-emerald-600 rounded-[1.5rem] flex items-center justify-center text-4xl font-black shrink-0 group-hover:bg-emerald-600 group-hover:text-white transition-all duration-500 font-logo">
                {item.step}
              </div>
              <div className="text-center md:text-left">
                <h3 className="text-2xl font-black text-gray-900 mb-2 font-logo">{item.title}</h3>
                <p className="text-lg text-stone-500 font-medium leading-relaxed">{item.desc}</p>
              </div>
            </div>
          ))}
        </div>

        <section className="bg-white rounded-[3rem] shadow-xl border border-stone-200 p-8 md:p-16 mb-16">
          <div className="flex flex-col md:flex-row md:items-end md:justify-between gap-4 mb-8">
            <div>
              <span className="text-sm font-black uppercase tracking-widest text-emerald-700">Our Progress</span>
              <h2 className="text-3xl md:text-4xl font-black text-gray-900 font-logo mt-2">Where We Are Now</h2>
            </div>
            <span className="inline-flex items-center rounded-full bg-emerald-50 border border-emerald-100 px-4 py-2 text-[10px] font-black uppercase tracking-[0.2em] text-emerald-700">
              Phase 2 In Progress
            </span>
          </div>
          <div className="grid md:grid-cols-3 gap-5 mb-10">
            <div className="rounded-2xl border border-stone-100 bg-stone-50 p-5">
              <p className="text-[10px] font-black uppercase tracking-[0.2em] text-stone-400 mb-2">Available Today</p>
              <p className="text-stone-700 font-medium">Verified word entries, bridge translation, moderation workflows, and active language expansion.</p>
            </div>
            <div className="rounded-2xl border border-stone-100 bg-stone-50 p-5">
              <p className="text-[10px] font-black uppercase tracking-[0.2em] text-stone-400 mb-2">Growing Next</p>
              <p className="text-stone-700 font-medium">Phrase packs, usage examples, subgroup rollouts, and phrase-aware search and moderation.</p>
            </div>
            <div className="rounded-2xl border border-stone-100 bg-stone-50 p-5">
              <p className="text-[10px] font-black uppercase tracking-[0.2em] text-stone-400 mb-2">Why Context Matters</p>
              <p className="text-stone-700 font-medium">Enough contextual data to support sentence translation that is better than simple word substitution.</p>
            </div>
          </div>
          <div>
            <h3 className="text-2xl font-black text-stone-900 font-logo mb-5">Quality & Trust</h3>
            <div className="grid md:grid-cols-3 gap-4 mb-8">
              <div className="rounded-2xl border border-emerald-100 bg-emerald-50 p-5">
                <p className="font-black text-stone-900 mb-2">Verified Entries</p>
                <p className="text-stone-600 font-medium text-sm">Every entry is reviewed by a moderator for accuracy, completeness, and cultural appropriateness.</p>
              </div>
              <div className="rounded-2xl border border-emerald-100 bg-emerald-50 p-5">
                <p className="font-black text-stone-900 mb-2">Bridge Coverage</p>
                <p className="text-stone-600 font-medium text-sm">All entries have English and/or Swahili translations to ensure discoverability and cross-language search.</p>
              </div>
              <div className="rounded-2xl border border-emerald-100 bg-emerald-50 p-5">
                <p className="font-black text-stone-900 mb-2">Open & Transparent</p>
                <p className="text-stone-600 font-medium text-sm">Contributions, moderation decisions, and data gaps are visible. Community feedback shapes decisions.</p>
              </div>
            </div>
          </div>
          <div>
            <h3 className="text-2xl font-black text-stone-900 font-logo mb-5">How Language Growth Works</h3>
            <div className="grid md:grid-cols-2 gap-4">
              {maturityLevels.map((item) => (
                <div key={item.title} className="rounded-2xl border border-stone-100 bg-white p-5">
                  <p className="text-lg font-black text-stone-900 mb-2">{item.title}</p>
                  <p className="text-stone-600 font-medium leading-relaxed">{item.desc}</p>
                </div>
              ))}
            </div>
          </div>
        </section>

        <section className="bg-white rounded-[3rem] shadow-xl border border-stone-200 p-8 md:p-16 mb-16 overflow-hidden">
          <div className="flex flex-col gap-3 mb-8">
            <span className="text-sm font-black uppercase tracking-widest text-emerald-700">Roadmap</span>
            <h2 className="text-3xl md:text-4xl font-black text-gray-900 font-logo leading-tight break-words">
              From Dictionary to Translation Platform
            </h2>
          </div>
          <div className="space-y-5">
            {[
              {
                title: 'Phase 1 - Dictionary Foundation',
                desc: 'Build verified word entries, bridge translations (EN/SW), moderation workflows, and language expansion.',
              },
              {
                title: 'Phase 2 - Phrase Layer (Current)',
                desc: 'Add high-frequency phrase packs with usage context, formality, and domain tags for real conversational meaning.',
              },
              {
                title: 'Phase 3 - Sentence Translation',
                desc: 'Use phrase memory, bridge logic, and curated examples to improve sentence-level translation quality.',
              },
              {
                title: 'Phase 4 - Document Translation',
                desc: 'Support full document workflows with glossary consistency, quality scoring, and human-in-the-loop review.',
              },
              {
                title: 'Phase 5 - Live Speech Translation',
                desc: 'Expand into real-time speech-to-text and text-to-speech translation for multilingual conversations and events.',
              },
              {
                title: 'Phase 6 - Domain Intelligence',
                desc: 'Develop academic, healthcare, legal, research, and wearable-device translation use cases with safer terminology controls.',
              },
            ].map((item) => (
              <div key={item.title} className="rounded-2xl border border-stone-100 bg-stone-50 p-5">
                <h3 className="text-lg font-black text-stone-900 mb-1">{item.title}</h3>
                <p className="text-stone-600 font-medium">{item.desc}</p>
              </div>
            ))}
          </div>
        </section>

        <div className="bg-gradient-to-r from-emerald-600 to-emerald-700 rounded-3xl p-12 md:p-16 text-white shadow-xl">
          <div className="text-center">
            <h2 className="text-4xl font-black font-logo mb-4">Join the Movement</h2>
            <p className="text-emerald-100 text-lg font-medium mb-8 max-w-3xl mx-auto">
              Our target is to preserve 10,000 unique Kenyan words this year. Will your mother tongue be represented?
            </p>
            <div className="flex flex-wrap justify-center gap-4">
              <Link href="/contribute" className="px-8 py-4 rounded-2xl bg-white text-emerald-900 font-black text-lg hover:bg-emerald-50 transition">
                Start Contributing
              </Link>
              <Link href="/explore" className="px-8 py-4 rounded-2xl border-2 border-white text-white font-black text-lg hover:bg-white/10 transition">
                Explore Dictionary
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

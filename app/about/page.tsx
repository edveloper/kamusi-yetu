'use client'

import Link from 'next/link'

export default function AboutPage() {
  return (
    <div className="min-h-screen bg-stone-50 pb-20">
      {/* Hero Header */}
      <div className="bg-emerald-900 text-white py-32 border-b border-emerald-800 relative overflow-hidden">
        <div className="max-w-4xl mx-auto px-4 text-center relative z-10">
          <h1 className="text-6xl md:text-8xl font-black mb-8 font-logo tracking-tight">
            Our Story
          </h1>
          <p className="text-xl md:text-2xl text-emerald-100 opacity-90 leading-relaxed font-medium">
            Every Kenyan language is a treasure. We are here to ensure <br className="hidden md:block"/> the voices of our ancestors remain audible tomorrow.
          </p>
        </div>
        {/* Subtle Decorative Element */}
        <div className="absolute top-0 right-0 opacity-10 translate-x-1/4 -translate-y-1/4 pointer-events-none">
          <div className="w-[600px] h-[600px] border-[60px] border-white rounded-full"></div>
        </div>
      </div>

      <div className="max-w-4xl mx-auto px-4 -mt-16 relative z-20">
        {/* The Mission Manifesto */}
        <section className="bg-white rounded-[3rem] shadow-xl border border-stone-200 p-10 md:p-16 mb-12">
          <div className="flex items-center gap-4 mb-8">
            <span className="text-4xl">🇰🇪</span>
            <h2 className="text-4xl font-black text-gray-900 font-logo">The Mission</h2>
          </div>
          <div className="space-y-8">
            <p className="text-xl text-stone-700 leading-relaxed font-medium">
              <span className="text-emerald-600 font-black">Kamusi Yetu</span> is more than a dictionary—it is a community-driven sanctuary for Kenya's linguistic diversity. From the rhythmic dialects of the Lake Victoria shores to the tonal heritage of the Taita hills.
            </p>
            <p className="text-xl text-stone-600 leading-relaxed italic border-l-4 border-emerald-100 pl-8 py-2">
              &ldquo;We believe that technology should serve heritage. By building a digital home for our mother tongues, we empower the next generation to speak with pride and precision.&rdquo;
            </p>
          </div>
        </section>

        {/* Core Pillars */}
        <section className="grid md:grid-cols-2 gap-8 mb-20">
          <div className="bg-white p-10 rounded-[2.5rem] border border-stone-200 shadow-sm hover:shadow-lg transition-all">
            <div className="w-14 h-14 bg-emerald-50 rounded-2xl flex items-center justify-center text-3xl mb-6">📚</div>
            <h3 className="text-2xl font-black text-emerald-900 mb-4 font-logo">Preservation</h3>
            <p className="text-stone-600 leading-relaxed font-medium">
              We focus on recording rare dialects, proverbs, and specialized vocabulary before they fade from daily conversation.
            </p>
          </div>
          <div className="bg-emerald-900 p-10 rounded-[2.5rem] text-white shadow-lg">
            <div className="w-14 h-14 bg-emerald-800 rounded-2xl flex items-center justify-center text-3xl mb-6">🤝</div>
            <h3 className="text-2xl font-black mb-4 font-logo">Community</h3>
            <p className="text-emerald-100 opacity-80 leading-relaxed font-medium">
              Native speakers are the ultimate authorities. Every entry is contributed, reviewed, and refined by the community.
            </p>
          </div>
        </section>

        {/* Process Steps */}
        <div className="text-center mb-12">
          <h2 className="text-4xl font-black text-gray-900 font-logo mb-4">How it Works</h2>
          <p className="text-stone-500 font-bold uppercase tracking-widest text-xs">The Guardian's Journey</p>
        </div>
        
        <div className="grid gap-6 mb-24">
          {[
            { step: 1, title: 'Contribute', desc: 'Document words, pronunciations, and usage from your home language.' },
            { step: 2, title: 'Verify', desc: 'Community elders and language experts review entries for cultural accuracy.' },
            { step: 3, title: 'Learn', desc: 'Students, writers, and linguists search and preserve the vocabulary.' }
          ].map((item) => (
            <div key={item.step} className="group flex flex-col md:flex-row items-center gap-8 bg-white p-8 rounded-3xl border border-stone-100 shadow-sm hover:border-emerald-200 transition-all">
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

        {/* Final CTA */}
        <div className="bg-emerald-600 rounded-[3rem] p-12 md:p-20 text-white text-center shadow-2xl relative overflow-hidden">
          <div className="relative z-10">
            <h2 className="text-4xl md:text-5xl font-black mb-8 font-logo">Join the Movement</h2>
            <p className="text-emerald-100 mb-10 text-xl font-medium max-w-lg mx-auto leading-relaxed">
              Our target is to preserve 10,000 unique Kenyan words this year. Will your mother tongue be represented?
            </p>
            <Link href="/contribute">
              <button className="bg-white text-emerald-900 px-12 py-5 rounded-2xl font-black text-xl hover:bg-emerald-50 transition-all shadow-xl hover:scale-105 active:scale-95">
                Start Contributing
              </button>
            </Link>
          </div>
          {/* Subtle pattern background */}
          <div className="absolute inset-0 opacity-10 pointer-events-none flex items-center justify-center">
             <div className="w-full h-full border-[1px] border-white/20 rotate-45 scale-150"></div>
          </div>
        </div>
      </div>
    </div>
  )
}
'use client'

import Link from 'next/link'

export default function TeamPage() {
  return (
    <div className="min-h-screen bg-stone-50 pb-24 font-sans">
      <div className="bg-emerald-900 text-white py-32 border-b border-emerald-800 relative overflow-hidden">
        <div className="max-w-4xl mx-auto px-4 text-center relative z-10">
          <h1 className="text-6xl md:text-8xl font-black mb-8 font-logo tracking-tight">
            Team
          </h1>
          <p className="text-xl md:text-2xl text-emerald-100 opacity-90 leading-relaxed font-medium max-w-3xl mx-auto">
            Kamusi Yetu is founder-led today, with the long-term aim of growing into a wider network of engineers, linguists, educators, and community reviewers.
          </p>
        </div>

        <div className="absolute top-0 right-0 opacity-10 translate-x-1/4 -translate-y-1/4 pointer-events-none">
          <div className="w-[600px] h-[600px] border-[60px] border-white rounded-full"></div>
        </div>
      </div>

      <div className="max-w-5xl mx-auto px-4 -mt-16 relative z-20">
        <section className="bg-white rounded-[3rem] shadow-xl border border-stone-200 p-10 md:p-16 mb-12">
          <div className="flex items-center gap-6 mb-10">
            <div className="w-20 h-20 bg-emerald-900 text-white rounded-[1.5rem] flex items-center justify-center text-4xl font-black font-logo">
              E
            </div>
            <div>
              <h2 className="text-3xl font-black text-stone-900 font-logo tracking-tight">Eddie Ezekiel Ochieng</h2>
              <p className="text-emerald-600 font-bold uppercase tracking-widest text-xs mt-1">Founder, Product Builder, and Lead Engineer</p>
            </div>
          </div>

          <div className="space-y-8">
            <p className="text-xl md:text-2xl text-stone-800 leading-relaxed font-medium">
              I started Kamusi Yetu because too many Kenyan languages remain digitally underrepresented at the very moment language technology is accelerating globally. If our languages are missing from dictionaries, phrase banks, and machine-readable systems today, they risk falling even further behind in the AI era.
            </p>
            <p className="text-lg text-stone-600 leading-relaxed font-medium">
              My role here is not only technical. I am shaping the product direction, data model, moderation workflow, and long-term translation architecture so this can become both a cultural asset and practical language infrastructure. The goal is to preserve vocabulary, support learning, improve translation, and eventually create better access to information across Kenyan and African languages.
            </p>
            <div className="border-l-4 border-emerald-100 pl-8 py-4 bg-emerald-50/30 rounded-r-3xl">
              <p className="text-xl text-stone-800 leading-relaxed font-bold">
                &ldquo;If our languages are absent from the systems shaping the future, then our communities are absent from that future too. Kamusi Yetu is one way of changing that.&rdquo;
              </p>
            </div>
            <p className="text-lg text-stone-600 leading-relaxed font-medium">
              The potential benefits are practical as well as cultural: stronger education tools, better multilingual search, safer civic and health communication, richer language archives, and eventually sentence, document, and speech translation that actually reflects how Kenyans speak.
            </p>
          </div>
        </section>

        <section className="grid lg:grid-cols-2 gap-8 mb-20">
          <div className="bg-white p-10 rounded-[2.5rem] border border-stone-200 shadow-sm">
            <div className="w-16 h-16 bg-emerald-50 text-emerald-700 rounded-2xl flex items-center justify-center text-3xl mb-8">
              DB
            </div>
            <h3 className="text-2xl font-black text-stone-900 mb-4 font-logo">Why This Work Matters</h3>
            <p className="text-stone-600 leading-relaxed font-medium">
              Kenyan languages deserve to exist in modern digital systems with the same seriousness given to globally dominant languages. That means verified word entries, phrase context, audio, moderation, and eventually machine-usable translation data.
            </p>
          </div>

          <div className="bg-emerald-900 p-10 rounded-[2.5rem] text-white shadow-2xl relative overflow-hidden">
            <div className="relative z-10">
              <div className="w-16 h-16 bg-emerald-800 rounded-2xl flex items-center justify-center text-3xl mb-8 border border-white/10">
                OK
              </div>
              <h3 className="text-2xl font-black mb-4 font-logo">The Team We Need</h3>
              <p className="text-emerald-100/80 leading-relaxed font-medium">
                The long-term team should include engineers, linguists, native speakers, moderators, educators, and partner organizations who can help grow the lexicon with quality and cultural accuracy.
              </p>
            </div>
            <div className="absolute -bottom-10 -right-10 w-40 h-40 bg-white/5 rounded-full"></div>
          </div>
        </section>

        <section className="bg-white rounded-[3rem] shadow-xl border border-stone-200 p-10 md:p-16 mb-16">
          <div className="flex flex-col md:flex-row md:items-end md:justify-between gap-4 mb-8">
            <div>
              <p className="text-sm font-black uppercase tracking-widest text-emerald-700">Connected Work</p>
              <h2 className="text-3xl md:text-4xl font-black text-stone-900 font-logo mt-2">A link to Usalama Voice</h2>
            </div>
          </div>
          <div className="space-y-6">
            <p className="text-lg text-stone-600 leading-relaxed font-medium">
              Kamusi Yetu also connects naturally with another project I am building: <span className="font-black text-stone-900">Usalama Voice</span>, a Kenyan anti-GBV platform focused on emergency response, protected reporting, county referral access, and practical survivor-support guidance. The connection matters because language access is not abstract. In safety, justice, and support systems, a person may need to understand instructions, describe harm, or ask for help in the language they trust most.
            </p>
            <p className="text-lg text-stone-600 leading-relaxed font-medium">
              Over time, the two projects could reinforce each other directly. Kamusi Yetu can help supply multilingual vocabulary, phrase packs, and translation infrastructure for reporting flows, safety prompts, learning modules, and county support directories inside Usalama Voice, making those systems more accessible to survivors, allies, and responders across Kenya.
            </p>
            <p className="text-lg text-stone-600 leading-relaxed font-medium">
              That is part of the larger vision here: language infrastructure should not end at preservation. It should improve real systems that people rely on in education, healthcare, safety, research, and daily life, especially when clear communication can change outcomes.
            </p>
          </div>
        </section>

        <div className="bg-emerald-600 rounded-[3rem] p-12 md:p-24 text-white text-center shadow-2xl relative overflow-hidden">
          <div className="relative z-10">
            <h2 className="text-4xl md:text-6xl font-black mb-8 font-logo tracking-tight">Build With Us</h2>
            <p className="text-emerald-100 mb-10 text-xl font-medium max-w-2xl mx-auto leading-relaxed">
              If you work in language, research, moderation, education, or engineering, there is space to help shape the next stage of Kamusi Yetu.
            </p>
            <Link href="/contact">
              <button className="bg-white text-emerald-900 px-14 py-6 rounded-2xl font-black text-xl hover:bg-emerald-50 transition-all shadow-2xl">
                Contact the Founder
              </button>
            </Link>
          </div>
        </div>
      </div>
    </div>
  )
}

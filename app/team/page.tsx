'use client'

import Link from 'next/link'

export default function TeamPage() {
  return (
    <div className="min-h-screen bg-neutral-100 pb-24 font-sans">
      <div className="relative overflow-hidden bg-heritage-dark text-white py-20 md:py-28 px-4 sm:px-6">
        <div className="relative max-w-5xl mx-auto text-center">
          <p className="text-xs uppercase tracking-[0.35em] text-accent-300 mb-4 font-semibold">Our team and vision</p>
          <h1 className="text-5xl md:text-6xl lg:text-7xl font-black leading-tight max-w-3xl mx-auto font-display">Team</h1>
          <p className="mt-6 text-base md:text-lg text-white max-w-2xl mx-auto leading-8">
            Kamusi Yetu is founder-led today, with the long-term aim of growing into a wider network of engineers, linguists, educators, and community reviewers.
          </p>
        </div>
      </div>

      <div className="max-w-5xl mx-auto px-4 -mt-16 relative z-20">
        <section className="bg-neutral-100 rounded-[3rem] shadow-soft border border-accent-300/30 p-10 md:p-16 mb-12">
          <div className="flex items-center gap-6 mb-10">
            <div className="w-20 h-20 bg-accent-100 text-heritage-dark rounded-[1.5rem] flex items-center justify-center text-4xl font-black font-display">
              E
            </div>
            <div>
              <h2 className="text-3xl font-black text-heritage-dark font-display tracking-tight">Eddie Ezekiel Ochieng</h2>
              <p className="text-accent-700 font-bold uppercase tracking-widest text-xs mt-1">Founder, Product Builder, and Lead Engineer</p>
            </div>
          </div>

          <div className="space-y-8">
            <p className="text-xl md:text-2xl text-neutral-800 leading-relaxed font-medium">
              I started Kamusi Yetu because too many Kenyan languages remain digitally underrepresented at the very moment language technology is accelerating globally. If our languages are missing from dictionaries, phrase banks, and machine-readable systems today, they risk falling even further behind in the AI era.
            </p>
            <p className="text-lg text-neutral-600 leading-relaxed font-medium">
              My role here is not only technical. I am shaping the product direction, data model, moderation workflow, and long-term translation architecture so this can become both a cultural asset and practical language infrastructure. The goal is to preserve vocabulary, support learning, improve translation, and eventually create better access to information across Kenyan and African languages.
            </p>
            <div className="border-l-4 border-accent-300/40 pl-8 py-4 bg-accent-50/30 rounded-r-3xl">
              <p className="text-xl text-neutral-800 leading-relaxed font-bold">
                &ldquo;If our languages are absent from the systems shaping the future, then our communities are absent from that future too. Kamusi Yetu is one way of changing that.&rdquo;
              </p>
            </div>
            <p className="text-lg text-neutral-600 leading-relaxed font-medium">
              The potential benefits are practical as well as cultural: stronger education tools, better multilingual search, safer civic and health communication, richer language archives, and eventually sentence, document, and speech translation that actually reflects how Kenyans speak.
            </p>
          </div>
        </section>

        <section className="grid lg:grid-cols-2 gap-8 mb-20">
          <div className="bg-accent-50 p-10 rounded-[2.5rem] border border-accent-300/30 shadow-soft">
            <div className="w-16 h-16 bg-accent-100 text-heritage-dark rounded-2xl flex items-center justify-center text-3xl mb-8">
              DB
            </div>
            <h3 className="text-2xl font-black text-heritage-dark mb-4 font-display">Why This Work Matters</h3>
            <p className="text-neutral-600 leading-relaxed font-medium">
              Kenyan languages deserve to exist in modern digital systems with the same seriousness given to globally dominant languages. That means verified word entries, phrase context, audio, moderation, and eventually machine-usable translation data.
            </p>
          </div>

          <div className="bg-heritage-dark p-10 rounded-[2.5rem] text-white shadow-soft relative overflow-hidden">
            <div className="relative z-10">
              <div className="w-16 h-16 bg-accent-100 text-heritage-dark rounded-2xl flex items-center justify-center text-3xl mb-8 border border-white/10">
                OK
              </div>
              <h3 className="text-2xl font-black mb-4 font-display">The Team We Need</h3>
              <p className="text-accent-100/90 leading-relaxed font-medium">
                The long-term team should include engineers, linguists, native speakers, moderators, educators, and partner organizations who can help grow the lexicon with quality and cultural accuracy.
              </p>
            </div>
            <div className="absolute -bottom-10 -right-10 w-40 h-40 bg-white/5 rounded-full"></div>
          </div>
        </section>

        <section className="bg-neutral-100 rounded-[3rem] shadow-soft border border-accent-300/20 p-10 md:p-16 mb-16">
          <div className="flex flex-col md:flex-row md:items-end md:justify-between gap-4 mb-8">
            <div>
              <p className="text-sm font-black uppercase tracking-widest text-accent-700">Connected Work</p>
              <h2 className="text-3xl md:text-4xl font-black text-heritage-dark font-display mt-2">A link to Usalama Voice</h2>
            </div>
          </div>
          <div className="space-y-6">
            <p className="text-lg text-neutral-600 leading-relaxed font-medium">
              Kamusi Yetu also connects naturally with another project I am building: <span className="font-black text-neutral-900">Usalama Voice</span>, a Kenyan anti-GBV platform focused on emergency response, protected reporting, county referral access, and practical survivor-support guidance. The connection matters because language access is not abstract. In safety, justice, and support systems, a person may need to understand instructions, describe harm, or ask for help in the language they trust most.
            </p>
            <p className="text-lg text-neutral-600 leading-relaxed font-medium">
              Over time, the two projects could reinforce each other directly. Kamusi Yetu can help supply multilingual vocabulary, phrase packs, and translation infrastructure for reporting flows, safety prompts, learning modules, and county support directories inside Usalama Voice, making those systems more accessible to survivors, allies, and responders across Kenya.
            </p>
            <p className="text-lg text-neutral-600 leading-relaxed font-medium">
              That is part of the larger vision here: language infrastructure should not end at preservation. It should improve real systems that people rely on in education, healthcare, safety, research, and daily life, especially when clear communication can change outcomes.
            </p>
          </div>
        </section>

        <div className="bg-heritage-dark rounded-2xl p-12 md:p-16 text-white shadow-strong">
          <div className="text-center">
            <h2 className="text-4xl font-black font-display mb-4">Build With Us</h2>
            <p className="text-white text-lg font-medium mb-8 max-w-3xl mx-auto">
              If you work in language, research, moderation, education, or engineering, there is space to help shape the next stage of Kamusi Yetu.
            </p>
            <div className="flex flex-wrap justify-center gap-4">
              <Link href="/contact" className="px-8 py-4 rounded-lg bg-accent-300 text-heritage-dark font-black text-lg hover:bg-accent-400 transition shadow-soft">
                Contact the Founder
              </Link>
              <Link href="/contribute" className="px-8 py-4 rounded-lg border-2 border-accent-300 text-white font-black text-lg hover:bg-accent-300/20 transition">
                Start Contributing
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

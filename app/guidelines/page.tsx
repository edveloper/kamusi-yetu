import Link from 'next/link'

export default function GuidelinesPage() {
  const dos = [
    { icon: '📝', title: 'Everyday Words', desc: 'Terms used in daily conversation.' },
    { icon: '🏛️', title: 'Cultural Heritage', desc: 'Traditions, tools, and ceremonies.' },
    { icon: '🗣️', title: 'Regional Dialects', desc: 'Variations from specific villages or regions.' }
  ]

  return (
    <div className="min-h-screen bg-neutral-100 pb-20">
      <div className="relative overflow-hidden bg-heritage-dark text-white py-20 md:py-28 px-4 sm:px-6">
        <div className="relative max-w-5xl mx-auto text-center">
          <p className="text-xs uppercase tracking-[0.35em] text-accent-300 mb-4 font-semibold">Quality and trust</p>
          <h1 className="text-5xl md:text-6xl lg:text-7xl font-black leading-tight max-w-3xl mx-auto font-display">Community Standards</h1>
          <p className="mt-6 text-base md:text-lg text-white max-w-2xl mx-auto leading-8">How we keep Kamusi Yetu accurate and respectful.</p>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-16 relative z-20">
        <div className="bg-neutral-100 rounded-[2.5rem] shadow-soft border border-accent-300/20 p-8 md:p-16 space-y-16">
          <section>
            <div className="inline-block bg-accent-100 text-heritage-dark px-4 py-1 rounded-full text-xs font-black uppercase tracking-widest mb-6">
              The Golden Rule
            </div>
            <h2 className="text-4xl font-black text-heritage-dark mb-6 font-display">Speak your truth.</h2>
            <p className="text-xl text-neutral-600 leading-relaxed font-medium">
              Kamusi Yetu is built on <span className="text-accent-600 underline decoration-2 underline-offset-4">lived experience</span>.
              Only contribute to languages you speak fluently. If you aren&apos;t sure, leave it for another guardian of the language.
            </p>
          </section>

          <div className="grid md:grid-cols-3 gap-8">
            {dos.map((item, i) => (
              <div key={i} className="p-6 bg-accent-50 rounded-3xl border border-accent-300/30">
                <div className="text-3xl mb-4">{item.icon}</div>
                <h3 className="font-black text-heritage-dark mb-2 uppercase text-sm tracking-tight">{item.title}</h3>
                <p className="text-neutral-600 text-sm leading-relaxed">{item.desc}</p>
              </div>
            ))}
          </div>

          <section className="bg-neutral-50 rounded-[2rem] p-8 md:p-12 border border-accent-100">
            <h2 className="text-2xl font-black text-heritage-dark mb-6 uppercase tracking-tight">Zero Tolerance</h2>
            <ul className="space-y-4">
              {['No hate speech or slurs', 'No invented/fake words', 'No spam or promotional content'].map((text, i) => (
                <li key={i} className="flex items-center gap-3 text-heritage-dark font-bold">
                  <span className="w-6 h-6 bg-accent-100 rounded-full flex items-center justify-center text-xs">✕</span>
                  {text}
                </li>
              ))}
            </ul>
          </section>

          <div className="text-center pt-8">
            <div className="bg-heritage-dark rounded-2xl p-12 md:p-16 text-white shadow-strong inline-block w-full">
              <h2 className="text-4xl font-black font-display mb-4">Ready to Contribute?</h2>
              <p className="text-white text-lg font-medium mb-8 max-w-3xl mx-auto">
                You understand the standards. Now help us preserve and grow Kenya's languages.
              </p>
              <div className="flex flex-wrap justify-center gap-4">
                <Link href="/contribute" className="px-8 py-4 rounded-lg bg-accent-300 text-heritage-dark font-black text-lg hover:bg-accent-400 transition shadow-soft">
                  Start Contributing
                </Link>
                <Link href="/explore" className="px-8 py-4 rounded-lg border-2 border-accent-300 text-white font-black text-lg hover:bg-accent-300/20 transition">
                  Explore Dictionary
                </Link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
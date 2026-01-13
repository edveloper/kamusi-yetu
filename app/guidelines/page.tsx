import Link from 'next/link'

export default function GuidelinesPage() {
  const dos = [
    { icon: '📝', title: 'Everyday Words', desc: 'Terms used in daily conversation.' },
    { icon: '🏛️', title: 'Cultural Heritage', desc: 'Traditions, tools, and ceremonies.' },
    { icon: '🗣️', title: 'Regional Dialects', desc: 'Variations from specific villages or regions.' }
  ]

  return (
    <div className="min-h-screen bg-stone-50 pb-20">
      <div className="bg-emerald-900 text-white py-24">
        <div className="max-w-4xl mx-auto px-4 text-center">
          <h1 className="text-5xl md:text-7xl font-black mb-6 font-logo tracking-tight">Community Standards</h1>
          <p className="text-xl text-emerald-100 opacity-90 font-medium">How we keep Kamusi Yetu accurate and respectful.</p>
        </div>
      </div>

      <div className="max-w-4xl mx-auto px-4 -mt-12">
        <div className="bg-white rounded-[2.5rem] shadow-xl border border-stone-200 p-8 md:p-16 space-y-16">
          
          <section>
            <div className="inline-block bg-emerald-100 text-emerald-800 px-4 py-1 rounded-full text-xs font-black uppercase tracking-widest mb-6">
              The Golden Rule
            </div>
            <h2 className="text-4xl font-black text-gray-900 mb-6 font-logo">Speak your truth.</h2>
            <p className="text-xl text-stone-600 leading-relaxed font-medium">
              Kamusi Yetu is built on <span className="text-emerald-600 underline decoration-2 underline-offset-4">lived experience</span>. 
              Only contribute to languages you speak fluently. If you aren&apos;t sure, leave it for another guardian of the language.
            </p>
          </section>

          <div className="grid md:grid-cols-3 gap-8">
            {dos.map((item, i) => (
              <div key={i} className="p-6 bg-stone-50 rounded-3xl border border-stone-100">
                <div className="text-3xl mb-4">{item.icon}</div>
                <h3 className="font-black text-gray-900 mb-2 uppercase text-sm tracking-tight">{item.title}</h3>
                <p className="text-stone-500 text-sm leading-relaxed">{item.desc}</p>
              </div>
            ))}
          </div>

          <section className="bg-red-50 rounded-[2rem] p-8 md:p-12 border border-red-100">
            <h2 className="text-2xl font-black text-red-900 mb-6 uppercase tracking-tight">Zero Tolerance</h2>
            <ul className="space-y-4">
              {['No hate speech or slurs', 'No invented/fake words', 'No spam or promotional content'].map((text, i) => (
                <li key={i} className="flex items-center gap-3 text-red-700 font-bold">
                  <span className="w-6 h-6 bg-red-200 rounded-full flex items-center justify-center text-xs">✕</span>
                  {text}
                </li>
              ))}
            </ul>
          </section>

          <div className="text-center pt-8">
            <Link href="/contribute">
              <button className="bg-emerald-600 text-white px-12 py-5 rounded-2xl font-black text-xl hover:scale-105 transition shadow-lg">
                I Understand, Let&apos;s Build →
              </button>
            </Link>
          </div>
        </div>
      </div>
    </div>
  )
}
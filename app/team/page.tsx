'use client'

import Link from 'next/link'

export default function TeamPage() {
  return (
    <div className="min-h-screen bg-stone-50 pb-24 font-sans">
      {/* Hero Header: Direct and Professional */}
      <div className="bg-emerald-900 text-white py-32 border-b border-emerald-800 relative overflow-hidden">
        <div className="max-w-4xl mx-auto px-4 text-center relative z-10">
          <h1 className="text-6xl md:text-8xl font-black mb-8 font-logo tracking-tight">
            Team
          </h1>
          <p className="text-xl md:text-2xl text-emerald-100 opacity-90 leading-relaxed font-medium max-w-2xl mx-auto">
            A technical initiative dedicated to the digital documentation of Kenya’s linguistic diversity.
          </p>
        </div>
        
        <div className="absolute top-0 right-0 opacity-10 translate-x-1/4 -translate-y-1/4 pointer-events-none">
          <div className="w-[600px] h-[600px] border-[60px] border-white rounded-full"></div>
        </div>
      </div>

      <div className="max-w-4xl mx-auto px-4 -mt-16 relative z-20">
        {/* Founder Card: Professional & Infrastructure Focused */}
        <section className="bg-white rounded-[3rem] shadow-xl border border-stone-200 p-10 md:p-16 mb-12">
          <div className="flex items-center gap-6 mb-10">
            <div className="w-20 h-20 bg-emerald-900 text-white rounded-[1.5rem] flex items-center justify-center text-4xl font-black font-logo">
              E
            </div>
            <div>
              <h2 className="text-3xl font-black text-stone-900 font-logo tracking-tight">Eddie Ezekiel Ochieng</h2>
              <p className="text-emerald-600 font-bold uppercase tracking-widest text-xs mt-1">Founder & Lead Engineer</p>
            </div>
          </div>
          
          <div className="space-y-10">
            <p className="text-xl md:text-2xl text-stone-800 leading-relaxed font-medium">
              Kamusi Yetu is a software engineering project designed to bridge the gap between traditional oral history and modern data systems. I am focused on building the <span className="text-emerald-900 font-black">standardized infrastructure</span> required to catalog and verify Kenyan languages at scale.
            </p>
            <div className="border-l-4 border-emerald-100 pl-8 py-4 bg-emerald-50/20 rounded-r-3xl">
              <p className="text-xl text-stone-800 leading-relaxed font-bold">
                &ldquo;As the lead architect, my priority is the technical viability and data integrity of this platform, ensuring our linguistic records are accessible for future generations of developers and researchers.&rdquo;
              </p>
            </div>
            <p className="text-lg text-stone-600 leading-relaxed font-medium">
              Currently, the platform is under active development. I am seeking collaboration from engineers and linguists to help establish formal data standards and expand our verification capabilities.
            </p>
          </div>
        </section>

        {/* Collaboration Pillars: Keeping the engineering focus */}
        <section className="grid md:grid-cols-2 gap-8 mb-20">
          <div className="bg-white p-12 rounded-[2.5rem] border border-stone-200 shadow-sm group">
            <div className="w-16 h-16 bg-stone-50 text-emerald-600 rounded-2xl flex items-center justify-center text-3xl mb-8 group-hover:bg-emerald-600 group-hover:text-white transition-all duration-500">
              💻
            </div>
            <h3 className="text-2xl font-black text-stone-900 mb-4 font-logo">Engineering</h3>
            <p className="text-stone-600 leading-relaxed font-medium">
              Contributing to the core API, frontend architecture, and the implementation of NLP tools for dialect processing.
            </p>
          </div>
          
          <div className="bg-emerald-900 p-12 rounded-[2.5rem] text-white shadow-2xl relative overflow-hidden group">
            <div className="relative z-10">
              <div className="w-16 h-16 bg-emerald-800 rounded-2xl flex items-center justify-center text-3xl mb-8 border border-white/10 group-hover:bg-white group-hover:text-emerald-900 transition-all duration-500">
                🏛️
              </div>
              <h3 className="text-2xl font-black mb-4 font-logo">Linguistics</h3>
              <p className="text-emerald-100/70 leading-relaxed font-medium">
                Setting the standards for orthography and verifying phonetic accuracy across regional language variations.
              </p>
            </div>
            <div className="absolute -bottom-10 -right-10 w-40 h-40 bg-white/5 rounded-full"></div>
          </div>
        </section>

        {/* Final CTA: Clear Call to Action */}
        <div className="bg-emerald-600 rounded-[3rem] p-12 md:p-24 text-white text-center shadow-2xl relative overflow-hidden">
          <div className="relative z-10">
            <h2 className="text-4xl md:text-6xl font-black mb-8 font-logo tracking-tight">Join the Project</h2>
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
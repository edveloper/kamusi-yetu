import Link from 'next/link'

export default function ModeratorsPage() {
  return (
    <div className="min-h-screen bg-neutral-100 pb-20">
      {/* Hero Header - Standardized Gradient */}
      <div className="relative overflow-hidden bg-heritage-dark text-white py-20 md:py-28 px-4 sm:px-6">
        <div className="relative max-w-5xl mx-auto text-center">
          <p className="text-xs uppercase tracking-[0.35em] text-accent-300 mb-4 font-semibold">Community guardianship</p>
          <h1 className="text-5xl md:text-6xl lg:text-7xl font-black leading-tight max-w-3xl mx-auto font-display">Our Moderators</h1>
          <p className="mt-6 text-base md:text-lg text-white max-w-2xl mx-auto leading-8">
            Ensuring the accuracy, cultural authenticity, and quality of every entry in our collective archive.
          </p>
        </div>
        <div className="absolute top-0 left-0 opacity-6 pointer-events-none">
          <div className="-translate-x-1/4 -translate-y-1/4 w-[520px] h-[520px] border-[48px] border-white rounded-full opacity-10"></div>
        </div>
      </div>

      {/* Main Content */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-10 relative z-20">
        
        {/* Quality Standards Section */}
        <section className="bg-neutral-100 shadow-soft border border-ink-200 p-8 md:p-16 mb-16">
          <div className="flex flex-col md:flex-row gap-12 items-start">
            <div className="md:w-1/3">
              <h2 className="text-4xl font-black text-heritage-dark font-display leading-tight">
                Linguistic <br/>Integrity
              </h2>
              <div className="h-1.5 w-16 bg-accent-300 mt-4 rounded-full"></div>
              <p className="mt-6 text-neutral-600 font-medium leading-relaxed">
                Moderators act as curators, verifying that submissions reflect real-world usage and cultural nuance.
              </p>
            </div>
            
            <div className="md:w-2/3 grid sm:grid-cols-2 gap-10">
              <div className="space-y-3">
                <div className="text-accent-700 font-black text-2xl">01</div>
                <h3 className="font-black text-heritage-dark uppercase text-xs tracking-widest">Entry Validation</h3>
                <p className="text-sm text-neutral-600 leading-relaxed font-medium">Cross-referencing submissions with established dialect patterns to maintain high academic standards.</p>
              </div>

              <div className="space-y-3">
                <div className="text-accent-600 font-black text-2xl">02</div>
                <h3 className="font-black text-neutral-900 uppercase text-xs tracking-widest">Community Review</h3>
                <p className="text-sm text-neutral-700 leading-relaxed font-medium">Monitoring the platform to resolve disputes and ensure all contributions remain respectful and accurate.</p>
              </div>

              <div className="space-y-3">
                <div className="text-accent-600 font-black text-2xl">03</div>
                <h3 className="font-black text-neutral-900 uppercase text-xs tracking-widest">Data Stewardship</h3>
                <p className="text-sm text-neutral-700 leading-relaxed font-medium">Organizing metadata, regional tags, and phonetic transcriptions for better searchability.</p>
              </div>

              <div className="space-y-3">
                <div className="text-accent-600 font-black text-2xl">04</div>
                <h3 className="font-black text-neutral-900 uppercase text-xs tracking-widest">Archive Security</h3>
                <p className="text-sm text-neutral-700 leading-relaxed font-medium">Protecting the integrity of the archive by preventing spam, vandalism, or low-quality entries.</p>
              </div>
            </div>
          </div>
        </section>

        {/* Meet the Teams - Reusing the Card Style from "By Community" */}
        <section className="py-12">
          <div className="flex items-center gap-4 mb-12">
            <h2 className="text-4xl font-black text-heritage-dark font-display">Active Teams</h2>
            <div className="h-px flex-1 bg-accent-100"></div>
          </div>

          <div className="grid md:grid-cols-3 gap-8">
            {[
              { team: "Kiswahili", count: "3 Moderators", tag: "SWA", info: "Specialists in Coastal and Standard Swahili dialects." },
              { team: "Gikuyu", count: "2 Moderators", tag: "KIK", info: "Focused on central region orthography and oral history." },
              { team: "Dholuo", count: "2 Moderators", tag: "LUO", info: "Experts in Nilotic linguistic structures and modern usage." },
            ].map((item, idx) => (
              <div key={idx} className="bg-accent-50 p-8 border border-ink-200 shadow-soft transition-all duration-300">
                <div className="flex justify-between items-start mb-8">
                  <div className="w-12 h-12 bg-accent-100 rounded-xl flex items-center justify-center text-xl text-heritage-dark">
                    🛡️
                  </div>
                  <span className="text-[10px] font-black text-accent-700 bg-accent-100 px-3 py-1 rounded-full uppercase tracking-widest">
                    {item.tag}
                  </span>
                </div>
                <h3 className="text-2xl font-black text-heritage-dark mb-2 font-display">{item.team}</h3>
                <p className="text-neutral-500 text-xs font-bold uppercase tracking-tighter mb-4">
                  {item.count}
                </p>
                <div className="pt-6 border-t border-accent-100">
                   <p className="text-sm text-neutral-600 leading-relaxed font-medium italic">"{item.info}"</p>
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* Professional CTA - Standard Gradient CTA */}
        <section className="mt-20">
          <div className="bg-heritage-dark rounded-2xl p-12 md:p-16 text-white shadow-strong">
            <div className="text-center">
              <h2 className="text-4xl font-black font-display mb-4">Join the Moderation Team</h2>
              <p className="text-white text-lg font-medium mb-8 max-w-3xl mx-auto">
                We are looking for native speakers with a background in linguistics or language preservation. Help us keep our heritage accurate and alive.
              </p>
              <div className="flex flex-wrap justify-center gap-4">
                <Link href="/contact" className="px-8 py-4 rounded-lg bg-accent-300 text-heritage-dark font-black text-lg hover:bg-accent-400 transition shadow-soft">
                  Apply to Moderate
                </Link>
                <Link href="/guidelines" className="px-8 py-4 rounded-lg border-2 border-accent-300 text-white font-black text-lg hover:bg-ink-800 transition">
                  Review Guidelines
                </Link>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  )
}
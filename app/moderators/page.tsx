import Link from 'next/link'

export default function ModeratorsPage() {
  return (
    <div className="min-h-screen bg-stone-50 pb-20">
      {/* Hero Header - Standardized Gradient */}
      <div className="relative overflow-hidden bg-gradient-to-br from-emerald-700 to-emerald-800 text-white py-20 md:py-28 px-4 sm:px-6">
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_top_right,_rgba(255,255,255,0.12),_transparent_50%)]" />
        <div className="relative max-w-5xl mx-auto text-center">
          <p className="text-xs uppercase tracking-[0.35em] text-emerald-100 mb-4 font-semibold">Community guardianship</p>
          <h1 className="text-5xl md:text-6xl lg:text-7xl font-black leading-tight max-w-3xl mx-auto font-logo">Our Moderators</h1>
          <p className="mt-6 text-base md:text-lg text-emerald-50 max-w-2xl mx-auto leading-8">
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
        <section className="bg-white rounded-[3rem] shadow-xl shadow-stone-200 border border-stone-100 p-8 md:p-16 mb-16">
          <div className="flex flex-col md:flex-row gap-12 items-start">
            <div className="md:w-1/3">
              <h2 className="text-4xl font-black text-gray-900 font-logo leading-tight">
                Linguistic <br/>Integrity
              </h2>
              <div className="h-1.5 w-16 bg-emerald-500 mt-4 rounded-full"></div>
              <p className="mt-6 text-stone-500 font-medium leading-relaxed">
                Moderators act as curators, verifying that submissions reflect real-world usage and cultural nuance.
              </p>
            </div>
            
            <div className="md:w-2/3 grid sm:grid-cols-2 gap-10">
              <div className="space-y-3">
                <div className="text-emerald-600 font-black text-2xl">01</div>
                <h3 className="font-black text-gray-900 uppercase text-xs tracking-widest">Entry Validation</h3>
                <p className="text-sm text-stone-600 leading-relaxed font-medium">Cross-referencing submissions with established dialect patterns to maintain high academic standards.</p>
              </div>

              <div className="space-y-3">
                <div className="text-emerald-600 font-black text-2xl">02</div>
                <h3 className="font-black text-gray-900 uppercase text-xs tracking-widest">Community Review</h3>
                <p className="text-sm text-stone-600 leading-relaxed font-medium">Monitoring the platform to resolve disputes and ensure all contributions remain respectful and accurate.</p>
              </div>

              <div className="space-y-3">
                <div className="text-emerald-600 font-black text-2xl">03</div>
                <h3 className="font-black text-gray-900 uppercase text-xs tracking-widest">Data Stewardship</h3>
                <p className="text-sm text-stone-600 leading-relaxed font-medium">Organizing metadata, regional tags, and phonetic transcriptions for better searchability.</p>
              </div>

              <div className="space-y-3">
                <div className="text-emerald-600 font-black text-2xl">04</div>
                <h3 className="font-black text-gray-900 uppercase text-xs tracking-widest">Archive Security</h3>
                <p className="text-sm text-stone-600 leading-relaxed font-medium">Protecting the integrity of the archive by preventing spam, vandalism, or low-quality entries.</p>
              </div>
            </div>
          </div>
        </section>

        {/* Meet the Teams - Reusing the Card Style from "By Community" */}
        <section className="py-12">
          <div className="flex items-center gap-4 mb-12">
            <h2 className="text-4xl font-black text-gray-900 font-logo">Active Teams</h2>
            <div className="h-px flex-1 bg-stone-200"></div>
          </div>

          <div className="grid md:grid-cols-3 gap-8">
            {[
              { team: "Kiswahili", count: "3 Moderators", tag: "SWA", info: "Specialists in Coastal and Standard Swahili dialects." },
              { team: "Gikuyu", count: "2 Moderators", tag: "KIK", info: "Focused on central region orthography and oral history." },
              { team: "Dholuo", count: "2 Moderators", tag: "LUO", info: "Experts in Nilotic linguistic structures and modern usage." },
            ].map((item, idx) => (
              <div key={idx} className="bg-white rounded-[2.5rem] p-8 border border-stone-200 shadow-sm transition-all duration-300">
                <div className="flex justify-between items-start mb-8">
                  <div className="w-12 h-12 bg-emerald-50 rounded-xl flex items-center justify-center text-xl">
                    🛡️
                  </div>
                  <span className="text-[10px] font-black text-emerald-600 bg-emerald-50 px-3 py-1 rounded-full uppercase tracking-widest">
                    {item.tag}
                  </span>
                </div>
                <h3 className="text-2xl font-black text-gray-900 mb-2 font-logo">{item.team}</h3>
                <p className="text-stone-400 text-xs font-bold uppercase tracking-tighter mb-4">
                  {item.count}
                </p>
                <div className="pt-6 border-t border-stone-50">
                   <p className="text-sm text-stone-600 leading-relaxed font-medium italic">"{item.info}"</p>
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* Professional CTA - Standard Gradient CTA */}
        <section className="mt-20">
          <div className="bg-gradient-to-r from-emerald-600 to-emerald-700 rounded-3xl p-12 md:p-16 text-white shadow-xl">
            <div className="text-center">
              <h2 className="text-4xl font-black font-logo mb-4">Join the Moderation Team</h2>
              <p className="text-emerald-100 text-lg font-medium mb-8 max-w-3xl mx-auto">
                We are looking for native speakers with a background in linguistics or language preservation. Help us keep our heritage accurate and alive.
              </p>
              <div className="flex flex-wrap justify-center gap-4">
                <Link href="/contact" className="px-8 py-4 rounded-2xl bg-white text-emerald-900 font-black text-lg hover:bg-emerald-50 transition">
                  Apply to Moderate
                </Link>
                <Link href="/guidelines" className="px-8 py-4 rounded-2xl border-2 border-white text-white font-black text-lg hover:bg-white/10 transition">
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
'use client'

export default function ContactPage() {
  return (
    <div className="min-h-screen bg-stone-50 pb-20">
      <div className="relative overflow-hidden bg-gradient-to-br from-emerald-700 to-emerald-800 text-white py-20 md:py-28 px-4 sm:px-6">
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_top_right,_rgba(255,255,255,0.12),_transparent_50%)]" />
        <div className="relative max-w-5xl mx-auto text-center">
          <p className="text-xs uppercase tracking-[0.35em] text-emerald-100 mb-4 font-semibold">Get in touch with us</p>
          <h1 className="text-5xl md:text-6xl lg:text-7xl font-black leading-tight max-w-3xl mx-auto font-logo">Tuwasiliane</h1>
          <p className="mt-6 text-base md:text-lg text-emerald-50 max-w-2xl mx-auto leading-8">
            Have a suggestion, a correction, or want to partner with us? Our ears are open to the community.
          </p>
        </div>
      </div>

      <div className="max-w-6xl mx-auto px-4 -mt-12 relative z-20">
        <div className="grid lg:grid-cols-3 gap-8">
          
          {/* Info Side */}
          <div className="lg:col-span-1 space-y-6">
            <div className="bg-white rounded-[2.5rem] p-10 shadow-xl border border-stone-200">
              <h2 className="text-3xl font-black mb-8 font-logo text-gray-900">Get in Touch</h2>
              
              <div className="space-y-8">
                <div className="group flex items-center gap-5">
                  <div className="w-14 h-14 bg-stone-50 text-emerald-600 rounded-2xl flex items-center justify-center text-2xl group-hover:bg-emerald-600 group-hover:text-white transition-all duration-300 shadow-sm">
                    📧
                  </div>
                  <div>
                    <p className="text-[10px] font-black text-stone-400 uppercase tracking-widest mb-1">Email Us</p>
                    <p className="font-bold text-gray-900 text-lg break-all">
                      <a href="mailto:ed.veloper10@gmail.com" className="text-emerald-600 hover:underline">ed.veloper10@gmail.com</a>
                    </p>
                  </div>
                </div>
              </div>

              <div className="mt-12 pt-10 border-t border-stone-100">
                <p className="text-stone-500 font-medium text-sm leading-relaxed">
                  We aim to respond to all community inquiries within <span className="text-emerald-600 font-bold">48 hours</span>.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
'use client'

export default function ContactPage() {
  return (
    <div className="min-h-screen bg-neutral-100 pb-20">
      <div className="relative overflow-hidden bg-heritage-dark text-white py-20 md:py-28 px-4 sm:px-6">
        <div className="relative max-w-5xl mx-auto text-center">
          <p className="text-xs uppercase tracking-[0.35em] text-accent-300 mb-4 font-semibold">Get in touch with us</p>
          <h1 className="text-5xl md:text-6xl lg:text-7xl font-black leading-tight max-w-3xl mx-auto font-display">Tuwasiliane</h1>
          <p className="mt-6 text-base md:text-lg text-white max-w-2xl mx-auto leading-8">
            Have a suggestion, a correction, or want to partner with us? Our ears are open to the community.
          </p>
        </div>
      </div>

      <div className="max-w-6xl mx-auto px-4 -mt-12 relative z-20">
        <div className="grid lg:grid-cols-3 gap-8">
          
          {/* Info Side */}
          <div className="lg:col-span-1 space-y-6">
            <div className="bg-neutral-100 rounded-[2.5rem] p-10 shadow-soft border border-accent-300/30">
              <h2 className="text-3xl font-black mb-8 font-display text-heritage-dark">Get in Touch</h2>
              
              <div className="space-y-8">
                <div className="group flex items-center gap-5">
                  <div className="w-14 h-14 bg-accent-100 text-heritage-dark rounded-2xl flex items-center justify-center text-2xl group-hover:bg-accent-200 transition-all duration-300 shadow-sm">
                    📧
                  </div>
                  <div>
                    <p className="text-[10px] font-black text-neutral-500 uppercase tracking-widest mb-1">Email Us</p>
                    <p className="font-bold text-heritage-dark text-lg break-all">
                      <a href="mailto:ed.veloper10@gmail.com" className="text-accent-700 hover:underline">ed.veloper10@gmail.com</a>
                    </p>
                  </div>
                </div>
              </div>

              <div className="mt-12 pt-10 border-t border-accent-200">
                <p className="text-neutral-600 font-medium text-sm leading-relaxed">
                  We aim to respond to all community inquiries within <span className="text-accent-700 font-bold">48 hours</span>.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
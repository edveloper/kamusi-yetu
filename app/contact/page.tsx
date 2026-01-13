'use client'

export default function ContactPage() {
  return (
    <div className="min-h-screen bg-stone-50 pb-20">
      {/* Hero Header */}
      <div className="bg-emerald-900 text-white py-24 border-b border-emerald-800 relative overflow-hidden">
        <div className="max-w-4xl mx-auto px-4 text-center relative z-10">
          <h1 className="text-5xl md:text-7xl font-black mb-6 font-logo tracking-tight">
            Tuwasiliane
          </h1>
          <p className="text-xl md:text-2xl text-emerald-100 opacity-90 leading-relaxed font-medium">
            Have a suggestion, a correction, or want to partner with us? <br className="hidden md:block"/> Our ears are open to the community.
          </p>
        </div>
        {/* Background Decorative Graphic */}
        <div className="absolute -bottom-10 -left-10 w-64 h-64 bg-emerald-800 rounded-full blur-3xl opacity-50"></div>
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
                    <p className="font-bold text-gray-900 text-lg break-all">habari@kamusiyetu.ke</p>
                  </div>
                </div>

                <div className="group flex items-center gap-5">
                  <div className="w-14 h-14 bg-stone-50 text-emerald-600 rounded-2xl flex items-center justify-center text-2xl group-hover:bg-emerald-600 group-hover:text-white transition-all duration-300 shadow-sm">
                    📍
                  </div>
                  <div>
                    <p className="text-[10px] font-black text-stone-400 uppercase tracking-widest mb-1">Our Base</p>
                    <p className="font-bold text-gray-900 text-lg">Nairobi, Kenya</p>
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

          {/* Form Side */}
          <div className="lg:col-span-2">
            <div className="bg-white rounded-[3rem] p-10 md:p-14 shadow-xl border border-stone-100">
              <form className="space-y-8">
                <div className="grid md:grid-cols-2 gap-8">
                  <div className="space-y-2">
                    <label className="text-xs font-black text-stone-400 uppercase tracking-widest ml-1">Your Name</label>
                    <input 
                      type="text" 
                      className="w-full px-6 py-5 bg-stone-50 border-2 border-stone-50 rounded-2xl focus:bg-white focus:border-emerald-500 focus:ring-0 transition-all font-medium text-gray-900 outline-none" 
                      placeholder="Jina lako" 
                    />
                  </div>
                  <div className="space-y-2">
                    <label className="text-xs font-black text-stone-400 uppercase tracking-widest ml-1">Email Address</label>
                    <input 
                      type="email" 
                      className="w-full px-6 py-5 bg-stone-50 border-2 border-stone-50 rounded-2xl focus:bg-white focus:border-emerald-500 focus:ring-0 transition-all font-medium text-gray-900 outline-none" 
                      placeholder="email@address.com" 
                    />
                  </div>
                </div>
                
                <div className="space-y-2">
                  <label className="text-xs font-black text-stone-400 uppercase tracking-widest ml-1">How can we help?</label>
                  <textarea 
                    rows={6} 
                    className="w-full px-6 py-5 bg-stone-50 border-2 border-stone-50 rounded-2xl focus:bg-white focus:border-emerald-500 focus:ring-0 transition-all font-medium text-gray-900 outline-none resize-none" 
                    placeholder="Tell us about your suggestion, partnership idea, or feedback..."
                  ></textarea>
                </div>

                <button className="group w-full bg-emerald-600 text-white py-6 rounded-2xl font-black text-xl hover:bg-emerald-700 shadow-2xl shadow-emerald-900/20 transition-all active:scale-[0.98] flex items-center justify-center gap-3">
                  Send Message
                  <span className="group-hover:translate-x-2 transition-transform">→</span>
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
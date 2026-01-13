'use client'

import Link from 'next/link'

export default function Footer() {
  return (
    <footer className="bg-stone-900 text-stone-400 border-t border-stone-800 font-sans">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-12">
          
          {/* Brand & Subtle Signature */}
          <div className="space-y-6 md:col-span-1">
            <h3 className="text-white font-black text-2xl font-logo tracking-tighter uppercase">
              Kamusi Yetu
            </h3>
            <p className="text-stone-400 font-medium leading-relaxed">
              Every Kenyan language, equal and alive. A living archive dedicated to preserving the diverse voices of our nation.
            </p>
            
            {/* The Subtle Variant */}
            <div className="pt-4 border-t border-stone-800/50">
              <p className="text-[10px] font-black uppercase tracking-[0.2em] text-stone-600">
                Created by{' '}
                <a 
                  href="https://www.eddie-ezekiel.com" 
                  target="_blank" 
                  rel="noopener noreferrer"
                  className="text-stone-500 hover:text-emerald-500 transition-colors underline decoration-stone-700 underline-offset-4"
                >
                  Eddie Ezekiel
                </a>
              </p>
            </div>
          </div>

          {/* Quick Links */}
          <div className="md:pl-8">
            <h4 className="text-emerald-500 font-black text-[10px] uppercase tracking-[0.4em] mb-6">Explore</h4>
            <ul className="space-y-3 text-sm">
              <li><Link href="/explore" className="font-bold hover:text-white transition">Languages</Link></li>
              <li><Link href="/categories" className="font-bold hover:text-white transition">Categories</Link></li>
              <li><Link href="/trending" className="font-bold hover:text-white transition">Trending</Link></li>
            </ul>
          </div>

          {/* Community */}
          <div>
            <h4 className="text-emerald-500 font-black text-[10px] uppercase tracking-[0.4em] mb-6">Community</h4>
            <ul className="space-y-3 text-sm">
              <li><Link href="/contribute" className="font-bold hover:text-white transition">Contribute</Link></li>
              <li><Link href="/guidelines" className="font-bold hover:text-white transition">Guidelines</Link></li>
              <li><Link href="/moderators" className="font-bold hover:text-white transition">Moderators</Link></li>
            </ul>
          </div>

          {/* About */}
          <div>
            <h4 className="text-emerald-500 font-black text-[10px] uppercase tracking-[0.4em] mb-6">About</h4>
            <ul className="space-y-3 text-sm">
              <li><Link href="/about" className="font-bold hover:text-white transition">Our Mission</Link></li>
              <li><Link href="/team" className="font-bold hover:text-white transition">Team</Link></li>
              <li><Link href="/contact" className="font-bold hover:text-white transition">Contact</Link></li>
            </ul>
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="border-t border-stone-800 mt-16 pt-8">
          <p className="text-stone-600 text-[10px] font-black uppercase tracking-[0.2em] text-center md:text-left">
            &copy; {new Date().getFullYear()} Kamusi Yetu. Built with pride in Kenya.
          </p>
        </div>
      </div>
    </footer>
  )
}
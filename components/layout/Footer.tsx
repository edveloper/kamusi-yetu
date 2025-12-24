export default function Footer() {
  return (
    <footer className="bg-neutral-900 text-neutral-300">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          {/* Brand */}
          <div>
            <h3 className="text-white font-bold text-lg mb-4">Kamusi Yetu</h3>
            <p className="text-sm">
              Every Kenyan language, equal and alive.
            </p>
          </div>

          {/* Quick Links */}
          <div>
            <h4 className="text-white font-semibold mb-4">Explore</h4>
            <ul className="space-y-2 text-sm">
              <li><a href="/languages" className="hover:text-white transition">Languages</a></li>
              <li><a href="/categories" className="hover:text-white transition">Categories</a></li>
              <li><a href="/trending" className="hover:text-white transition">Trending</a></li>
            </ul>
          </div>

          {/* Community */}
          <div>
            <h4 className="text-white font-semibold mb-4">Community</h4>
            <ul className="space-y-2 text-sm">
              <li><a href="/contribute" className="hover:text-white transition">Contribute</a></li>
              <li><a href="/guidelines" className="hover:text-white transition">Guidelines</a></li>
              <li><a href="/moderators" className="hover:text-white transition">Moderators</a></li>
            </ul>
          </div>

          {/* About */}
          <div>
            <h4 className="text-white font-semibold mb-4">About</h4>
            <ul className="space-y-2 text-sm">
              <li><a href="/about" className="hover:text-white transition">Our Mission</a></li>
              <li><a href="/team" className="hover:text-white transition">Team</a></li>
              <li><a href="/contact" className="hover:text-white transition">Contact</a></li>
            </ul>
          </div>
        </div>

        <div className="border-t border-neutral-800 mt-8 pt-8 text-sm text-center">
          <p>&copy; 2025 Kamusi Yetu. Built with ❤️ by Kenyans.</p>
        </div>
      </div>
    </footer>
  )
}
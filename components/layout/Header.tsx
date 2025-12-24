import Link from 'next/link'

export default function Header() {
  return (
    <header className="bg-white border-b border-neutral-200 sticky top-0 z-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          {/* Logo */}
          <Link href="/" className="flex items-center space-x-2">
            <div className="w-8 h-8 bg-primary-500 rounded-md flex items-center justify-center text-white font-bold">
              K
            </div>
            <span className="text-xl font-bold text-neutral-900">
              Kamusi Yetu
            </span>
          </Link>

          {/* Desktop Navigation */}
          <nav className="hidden md:flex items-center space-x-8">
            <Link href="/explore" className="text-neutral-700 hover:text-primary-500 transition">
              Explore
            </Link>
            <Link href="/about" className="text-neutral-700 hover:text-primary-500 transition">
              About
            </Link>
          </nav>

          {/* CTA Button */}
          <div className="flex items-center space-x-4">
            <Link 
              href="/contribute" 
              className="bg-primary-500 text-white px-4 py-2 rounded-lg hover:bg-primary-600 transition"
            >
              + Add Word
            </Link>
            <button className="text-neutral-700 hover:text-primary-500">
              Login
            </button>
          </div>
        </div>
      </div>
    </header>
  )
}
import Link from 'next/link'
import Button from '@/components/ui/Button'

export default function Header() {
  return (
    <header className="bg-white border-b border-gray-200 sticky top-0 z-50 shadow-sm">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          {/* Logo with Kenyan flag colors */}
          <Link href="/" className="flex items-center space-x-3 group">
            <div className="relative w-10 h-10 rounded-lg overflow-hidden shadow-md">
              {/* Kenyan flag stripes */}
              <div className="absolute inset-0 flex flex-col">
                <div className="flex-1 bg-black"></div>
                <div className="flex-1 bg-red-600"></div>
                <div className="flex-1 bg-green-700"></div>
              </div>
              {/* White borders */}
              <div className="absolute inset-0 border-2 border-white"></div>
              {/* Letter K overlay */}
              <div className="absolute inset-0 flex items-center justify-center">
                <span className="text-white font-bold text-xl drop-shadow-lg">K</span>
              </div>
            </div>
            <span className="text-xl font-bold text-gray-900 group-hover:text-green-700 transition">
              Kamusi Yetu
            </span>
          </Link>

          {/* Desktop Navigation */}
          <nav className="hidden md:flex items-center space-x-8">
            <Link 
              href="/explore" 
              className="text-gray-700 hover:text-green-700 transition font-medium"
            >
              Explore
            </Link>
            <Link 
              href="/about" 
              className="text-gray-700 hover:text-green-700 transition font-medium"
            >
              About
            </Link>
          </nav>

          {/* CTA Buttons */}
          <div className="flex items-center space-x-3">
            <Link href="/contribute">
              <button className="bg-green-700 text-white px-4 py-2 rounded-lg hover:bg-green-800 transition font-medium">
                + Add Word
              </button>
            </Link>
            <button className="text-gray-700 hover:text-green-700 transition font-medium px-4 py-2">
              Login
            </button>
          </div>
        </div>
      </div>
    </header>
  )
}
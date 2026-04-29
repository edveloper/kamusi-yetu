import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './app/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        // Kenyan Heritage Color Palette
        heritage: {
          dark: '#0B6B3A',       // Primary - deep forest green
          darker: '#064E2A',     // Darker shade for depth
          light: '#D4A373',      // Warm accent - ochre/earth tone
          bg: '#F5F1E8',         // Warm cream background
        },
        primary: {
          50: '#F0F7F4',
          100: '#E6F4F0',
          300: '#4DA87F',
          500: '#0B6B3A',
          600: '#064E2A',
          700: '#053C20',
          900: '#032815',
        },
        accent: {
          50: '#FBF6EF',
          100: '#F5E8D4',
          300: '#D4A373',
          500: '#B8885F',
          700: '#9C6B47',
        },
        neutral: {
          50: '#FAFAF8',
          100: '#F5F1E8',
          200: '#E5DFCE',
          300: '#C0B5A0',
          500: '#808080',
          700: '#4A4A4A',
          900: '#1A1A1A',
        },
      },
      fontFamily: {
        sans: ['var(--font-inter)', 'system-ui', 'sans-serif'],
        serif: ['var(--font-playfair)', 'Georgia', 'serif'],
        display: ['var(--font-playfair)', 'Georgia', 'serif'],
      },
      borderRadius: {
        'xs': '0.375rem',
        'sm': '0.5rem',
        'base': '0.75rem',
        'md': '1rem',
        'lg': '1.5rem',
        'xl': '2rem',
        '2xl': '2.5rem',
        '3xl': '3rem',
        'full': '9999px',
      },
      spacing: {
        'xs': '0.25rem',
        'sm': '0.5rem',
        'md': '1rem',
        'lg': '1.5rem',
        'xl': '2rem',
        '2xl': '3rem',
        '3xl': '4rem',
        '4xl': '6rem',
      },
      boxShadow: {
        'soft': '0 2px 8px rgba(11, 107, 58, 0.08)',
        'medium': '0 4px 16px rgba(11, 107, 58, 0.12)',
        'strong': '0 8px 24px rgba(11, 107, 58, 0.16)',
        'inner-soft': 'inset 0 1px 3px rgba(11, 107, 58, 0.06)',
      },
      backgroundImage: {
        // Kente-inspired diagonal weave pattern
        'pattern-kente': 
          'linear-gradient(45deg, rgba(212, 163, 115, 0.08) 25%, transparent 25%, transparent 50%, rgba(212, 163, 115, 0.08) 50%, rgba(212, 163, 115, 0.08) 75%, transparent 75%, transparent), linear-gradient(45deg, rgba(11, 107, 58, 0.05) 25%, transparent 25%, transparent 50%, rgba(11, 107, 58, 0.05) 50%, rgba(11, 107, 58, 0.05) 75%, transparent 75%, transparent)',
        // Maasai shuka dot pattern
        'pattern-shuka': 
          'radial-gradient(circle, rgba(212, 163, 115, 0.12) 2px, transparent 2px), radial-gradient(circle, rgba(11, 107, 58, 0.08) 1px, transparent 1px)',
        // Beaded pattern
        'pattern-beads': 
          'repeating-linear-gradient(0deg, rgba(212, 163, 115, 0.1) 0px, rgba(212, 163, 115, 0.1) 2px, transparent 2px, transparent 6px), repeating-linear-gradient(90deg, rgba(11, 107, 58, 0.06) 0px, rgba(11, 107, 58, 0.06) 2px, transparent 2px, transparent 6px)',
        // Sisal basket weave
        'pattern-weave': 
          'linear-gradient(0deg, transparent 24%, rgba(212, 163, 115, 0.06) 25%, rgba(212, 163, 115, 0.06) 26%, transparent 27%, transparent 74%, rgba(212, 163, 115, 0.06) 75%, rgba(212, 163, 115, 0.06) 76%, transparent 77%, transparent), linear-gradient(90deg, transparent 24%, rgba(212, 163, 115, 0.06) 25%, rgba(212, 163, 115, 0.06) 26%, transparent 27%, transparent 74%, rgba(212, 163, 115, 0.06) 75%, rgba(212, 163, 115, 0.06) 76%, transparent 77%, transparent)',
      },
      backgroundSize: {
        'pattern-kente': '60px 60px',
        'pattern-shuka': '24px 24px',
        'pattern-beads': '8px 8px',
        'pattern-weave': '50px 50px',
      },
      backgroundPosition: {
        'pattern-kente': '0 0, 30px 30px',
        'pattern-shuka': '0 0, 12px 12px',
        'pattern-beads': '0 0',
        'pattern-weave': '0 0',
      },
      fontSize: {
        'xs': ['0.75rem', { lineHeight: '1rem' }],
        'sm': ['0.875rem', { lineHeight: '1.25rem' }],
        'base': ['1rem', { lineHeight: '1.5rem' }],
        'lg': ['1.125rem', { lineHeight: '1.75rem' }],
        'xl': ['1.25rem', { lineHeight: '1.75rem' }],
        '2xl': ['1.5rem', { lineHeight: '2rem' }],
        '3xl': ['1.875rem', { lineHeight: '2.25rem' }],
        '4xl': ['2.25rem', { lineHeight: '2.5rem' }],
        '5xl': ['3rem', { lineHeight: '1' }],
        '6xl': ['3.75rem', { lineHeight: '1' }],
        '7xl': ['4.5rem', { lineHeight: '1' }],
      },
      letterSpacing: {
        'tighter': '-0.02em',
        'tight': '-0.01em',
        'normal': '0em',
        'wide': '0.025em',
        'wider': '0.05em',
        'widest': '0.1em',
        'tracking-header': '0.18em',
        'tracking-label': '0.22em',
      },
    },
  },
  plugins: [],
}

export default config

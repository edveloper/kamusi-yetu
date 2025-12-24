import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        // Kenyan-inspired color palette
        primary: {
          900: '#003300',
          700: '#005500',
          500: '#006600', // Main brand green
          300: '#00AA00',
          100: '#E6F4E6',
        },
        accent: {
          700: '#A00000',
          500: '#C8102E', // Kenyan red for CTAs
          300: '#FF4757',
        },
        neutral: {
          900: '#1A1A1A', // Text
          700: '#4A4A4A',
          500: '#808080',
          300: '#C0C0C0',
          200: '#E5E5E5',
          100: '#F5F5F0', // Background
        },
        // Semantic colors
        success: '#10B981',
        warning: '#F59E0B',
        error: '#EF4444',
        info: '#3B82F6',
      },
      fontFamily: {
        sans: [
          '-apple-system',
          'BlinkMacSystemFont',
          '"Segoe UI"',
          'Roboto',
          '"Helvetica Neue"',
          'Arial',
          'sans-serif',
        ],
      },
      spacing: {
        '18': '4.5rem',
        '88': '22rem',
        '128': '32rem',
      },
      borderRadius: {
        'xl': '1rem',
        '2xl': '1.5rem',
      },
      boxShadow: {
        'soft': '0 2px 8px rgba(0, 0, 0, 0.08)',
        'medium': '0 4px 16px rgba(0, 0, 0, 0.12)',
        'strong': '0 8px 24px rgba(0, 0, 0, 0.16)',
      },
    },
  },
  plugins: [],
}

export default config
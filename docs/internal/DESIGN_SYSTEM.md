# LughaKonnect - Heritage Design System

## Overview
This design system implements a **cultural, heritage-focused Kenyan brand** with warm, inviting aesthetics inspired by African textiles and traditional craftsmanship.

## Color Palette

### Primary Colors
- **Heritage Dark**: `#0B6B3A` - Deep forest green (primary action)
- **Heritage Darker**: `#064E2A` - Darker green (hover/active states)

### Accent Color
- **Heritage Light**: `#D4A373` - Warm ochre/earth tone (secondary actions, highlights)

### Background
- **Neutral 100** (Warm Cream): `#F5F1E8` - Primary background (welcoming, warm)

### Supporting Colors
- **Primary shades**: `#E6F4F0` (100) to `#032815` (900) - Green family
- **Accent shades**: `#F5E8D4` (100) to `#9C6B47` (700) - Earth tones
- **Neutral shades**: `#F5F1E8` (100) to `#1A1A1A` (900) - Grays

## Typography

### Fonts
- **Display/Headings**: Playfair Display (serif) - Elegant, sophisticated
- **Body**: Inter (sans-serif) - Clear, readable

### Font Classes
- `.font-display` - Use for all headings (h1-h6)
- `.font-logo` - (deprecated) Use `.font-display` instead

### Heading Utilities
```
.headline-xl   // text-4xl/5xl
.headline-lg   // text-3xl/4xl
.headline-md   // text-2xl/3xl
.headline-sm   // text-lg
```

## Spacing & Sizing

### Border Radius (Soft Rounded Corners)
- `rounded-xs`: 0.375rem
- `rounded-sm`: 0.5rem
- `rounded-base`: 0.75rem
- `rounded-md`: 1rem
- `rounded-lg`: 1.5rem (default for most components)
- `rounded-xl`: 2rem
- `rounded-2xl`: 2.5rem
- `rounded-3xl`: 3rem

### Shadows (Warm Heritage Feel)
```
shadow-soft     // 0 2px 8px rgba(11, 107, 58, 0.08)
shadow-medium   // 0 4px 16px rgba(11, 107, 58, 0.12)
shadow-strong   // 0 8px 24px rgba(11, 107, 58, 0.16)
shadow-inner-soft // Inset subtle shadow
```

## Component Patterns

### Cards
```jsx
// Featured card (accent border)
<div className="card-featured">Content</div>

// Subtle card (light background)
<div className="card-subtle">Content</div>

// Dark card (heritage green background)
<div className="card-dark">Content</div>
```

### Buttons
```jsx
// Primary action - Heritage green
<button className="btn-primary">Action</button>

// Secondary - Outlined
<button className="btn-secondary">Secondary</button>

// Accent - Warm ochre
<button className="btn-accent">Featured</button>

// Tertiary - Subtle
<button className="btn-tertiary">Tertiary</button>
```

### Inputs
```jsx
// Standard input
<input className="input-base" />

// Large prominent input (for search/hero sections)
<input className="input-large" placeholder="Find a word..." />
```

### Badges
```jsx
<span className="badge-primary">Label</span>
<span className="badge-accent">Accent</span>
<span className="badge-dark">Dark</span>
```

### Text Styles
```jsx
<h1 className="headline-xl">Extra Large</h1>
<h2 className="headline-lg">Large</h2>
<h3 className="headline-md">Medium</h3>
<p className="label">Small Label</p>
<p className="label-accent">Accent Label</p>
```

## African Textile Patterns

All patterns are subtle (8-12% opacity) and work as background layers:

### Pattern Classes
- `.pattern-kente` - Diagonal weave (inspired by Kente cloth)
- `.pattern-shuka` - Dot pattern (inspired by Maasai shuka)
- `.pattern-beads` - Grid pattern (inspired by beadwork)
- `.pattern-weave` - Basket weave (sisal pattern)

### Usage
```jsx
{/* Apply to section backgrounds */}
<div className="bg-accent-50 pattern-kente">
  Content with textile overlay
</div>

{/* Use in cards for supporting content */}
<div className="surface-card pattern-shuka">
  Card with beaded pattern
</div>
```

## Global Styling Applied

- **Site Background**: Warm cream (`neutral-100`)
- **Text Color**: Dark neutral (`neutral-900` on light, `neutral-100` on dark)
- **Default Rounded Corners**: Applied throughout for soft, organic feel
- **Scrollbar**: Styled with accent colors
- **Selection**: Heritage light color with white text
- **Transitions**: Smooth 150-200ms ease-out on all interactive elements

## Color Applications

### When to Use Each Color

**Heritage Dark (`#0B6B3A`)**
- Primary buttons
- Main headings
- Active states
- Navigation links (hover)
- Primary interactive elements

**Heritage Darker (`#064E2A`)**
- Button hover states
- Deep accents
- Footer background
- Dark theme elements

**Heritage Light (`#D4A373`)**
- Secondary buttons
- Accent highlights
- Supporting badges
- Link focus states
- Decorative elements

**Neutral 100 (`#F5F1E8`)**
- Page background (site-wide)
- Input backgrounds
- Secondary backgrounds
- Subtle surfaces

**Primary Colors (Greens)**
- Use for subtle variations
- Status badges
- Supporting UI elements

**Accent Colors (Earths/Ochres)**
- Use for tertiary actions
- Warning/caution states
- Secondary information

## Implementation Guidelines

### Do's ✓
- Use serif fonts (`font-display`) for all headings
- Apply textile patterns to large content sections
- Use warm cream background throughout
- Maintain soft rounded corners (lg/xl sizes)
- Use heritage colors for primary interactions
- Apply subtle shadows for depth

### Don'ts ✗
- Don't use generic SaaS color schemes (blues, purples)
- Don't use harsh borders or sharp corners
- Don't mix serif and sans-serif fonts for body text
- Don't apply multiple patterns to same element
- Don't use high opacity on pattern overlays
- Don't apply heritage colors to all UI elements

## Component Example: Complete Card

```jsx
<div className="card-featured pattern-kente">
  <div className="p-6 md:p-8">
    {/* Heading */}
    <h2 className="headline-md mb-4">
      Featured Content
    </h2>
    
    {/* Badge */}
    <span className="badge-accent mb-4 inline-flex">
      New
    </span>
    
    {/* Description */}
    <p className="text-neutral-700 mb-6">
      This card features the heritage design system with warm colors
      and subtle patterns inspired by African textiles.
    </p>
    
    {/* Action */}
    <button className="btn-primary">
      Learn More
    </button>
  </div>
</div>
```

## Responsive Design

All components use Tailwind's responsive prefix system:
- `sm:` (640px)
- `md:` (768px)
- `lg:` (1024px)
- `xl:` (1280px)

Example: `text-lg md:text-xl lg:text-2xl`

## Accessibility

- Use `.focus-visible-ring` for keyboard navigation states
- Maintain sufficient color contrast (WCAG AA minimum)
- Use semantic HTML (`<button>`, `<a>`, `<h1>`, etc.)
- Provide alt text for images
- Use `.sr-only` for screen-reader-only text

## Related Files

- `tailwind.config.ts` - Tailwind configuration with color/font extensions
- `globals.css` - Global styles and theme variables
- `component-utilities.css` - Reusable component class definitions
- `app/layout.tsx` - Sets neutral-100 background site-wide

---

**Last Updated**: April 2026  
**Brand**: LughaKonnect - Every Kenyan Language, Equal and Alive

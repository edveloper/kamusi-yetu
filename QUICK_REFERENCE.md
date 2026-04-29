# Quick Reference: Heritage Design System

## Colors (Copy & Paste)

```css
/* Primary Actions - Heritage Dark */
.btn-primary, .text-primary { color: #0B6B3A; }

/* Hover/Active - Heritage Darker */
.hover-dark { color: #064E2A; }

/* Secondary/Accents - Heritage Light */
.btn-accent, .accent { color: #D4A373; }

/* Backgrounds - Warm Cream */
body, .bg-main { background-color: #F5F1E8; }
```

## Most Common Classes

### Buttons
```jsx
<button className="btn-primary">Primary Action</button>
<button className="btn-accent">Secondary Action</button>
<button className="btn-secondary">Outlined Button</button>
<button className="btn-tertiary">Subtle Button</button>
```

### Cards
```jsx
<div className="card-featured">Featured Content</div>
<div className="card-subtle">Subtle Content</div>
<div className="card-dark">Dark Background</div>
```

### Headings
```jsx
<h1 className="headline-xl">Extra Large</h1>
<h2 className="headline-lg">Large</h2>
<h3 className="headline-md">Medium</h3>
<h4 className="headline-sm">Small</h4>
```

### Inputs
```jsx
<input className="input-base" placeholder="Normal input" />
<input className="input-large" placeholder="Large search input" />
```

### Labels & Badges
```jsx
<span className="label">Normal Label</span>
<span className="label-accent">Accent Label</span>
<span className="badge-primary">Primary Badge</span>
<span className="badge-accent">Accent Badge</span>
<span className="badge-dark">Dark Badge</span>
```

### Patterns (Add to sections)
```jsx
<div className="bg-accent-50 pattern-kente">Kente Pattern</div>
<div className="bg-accent-50 pattern-shuka">Shuka Pattern</div>
<div className="bg-accent-50 pattern-beads">Beads Pattern</div>
<div className="bg-heritage-darker pattern-weave">Weave Pattern</div>
```

## Colors at a Glance

```
PRIMARY:        heritage-dark      #0B6B3A     [buttons, headings, actions]
DARKER:         heritage-darker    #064E2A     [hover, footer, depth]
ACCENT:         heritage-light     #D4A373     [secondary, highlights]
BACKGROUND:     neutral-100        #F5F1E8     [site-wide, inputs]

GREENS:         primary-50/100/300/500/600/700/900  [status variations]
EARTHS:         accent-50/100/300/500/700           [secondary variations]
GRAYS:          neutral-50/100/200/300/500/700/900  [text, borders]
```

## Font Styles

```jsx
// Use font-display for ALL headings
<h1 className="font-display">Heading</h1>
<h2 className="font-display">Heading</h2>

// Body text uses Inter (default, no special class needed)
<p>Normal paragraph text</p>

// Utility classes
<h3 className="font-black font-display text-3xl">Bold Heading</h3>
```

## Shadows

```jsx
// Soft (default for most elements)
<div className="shadow-soft">Subtle shadow</div>

// Medium (for hovered/elevated elements)
<div className="shadow-medium hover:shadow-medium">Elevated</div>

// Strong (for modals, overlays)
<div className="shadow-strong">Deep shadow</div>

// Inset (for inputs, depressed elements)
<div className="shadow-inner-soft">Inset subtle shadow</div>
```

## Rounded Corners

```jsx
// Standard sizes
rounded-lg    // 1.5rem  (DEFAULT - use this most)
rounded-xl    // 2rem
rounded-2xl   // 2.5rem  (for large sections)

// Avoid
Don't use: rounded-full (for pills only)
Don't mix: Use lg consistently
```

## Responsive Prefixes

```jsx
// Mobile first
<div className="text-lg md:text-xl lg:text-2xl">
  Responsive text
</div>

<div className="px-4 md:px-6 lg:px-8">
  Responsive padding
</div>

<div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
  Responsive grid
</div>
```

## Common Patterns

### Hero Section
```jsx
<div className="bg-gradient-to-br from-heritage-dark to-heritage-darker text-white py-20 pattern-kente">
  <h1 className="headline-xl text-white">Title</h1>
  <input className="input-large" />
</div>
```

### Feature Card
```jsx
<div className="card-featured">
  <div className="p-8">
    <h2 className="headline-lg mb-4">Title</h2>
    <p className="text-neutral-700 mb-6">Description</p>
    <button className="btn-primary">Action</button>
  </div>
</div>
```

### Information Section
```jsx
<div className="bg-accent-50 pattern-shuka rounded-lg p-8 border border-accent-300/40">
  <h3 className="headline-md mb-4 text-heritage-dark">Information</h3>
  <p className="text-neutral-700">Content goes here</p>
</div>
```

### CTA Footer
```jsx
<div className="bg-gradient-to-r from-heritage-dark to-heritage-darker text-white p-16 pattern-weave rounded-2xl">
  <h2 className="headline-lg text-white mb-4">Call to Action</h2>
  <div className="flex gap-4">
    <button className="btn-primary">Primary</button>
    <button className="border-2 border-white text-white font-black px-8 py-3 rounded-lg">Secondary</button>
  </div>
</div>
```

## Do's and Don'ts

### DO ✓
- Use `font-display` for all headings
- Apply patterns to large sections (not every element)
- Use heritage colors for primary actions
- Apply `shadow-soft` for depth
- Use `rounded-lg` consistently
- Apply `neutral-100` background site-wide

### DON'T ✗
- Don't use stone colors (use neutral-* instead)
- Don't use emerald colors (use heritage-* instead)
- Don't mix sharp and soft corners
- Don't apply multiple patterns to one element
- Don't use high opacity on patterns
- Don't use generic SaaS blues/purples

## Testing Colors

```html
<!-- Copy these into HTML to test colors -->

<!-- Heritage Dark (#0B6B3A) -->
<div style="background-color: #0B6B3A; color: white; padding: 20px;">
  Heritage Dark - Primary Actions
</div>

<!-- Heritage Light (#D4A373) -->
<div style="background-color: #D4A373; color: white; padding: 20px;">
  Heritage Light - Accents
</div>

<!-- Neutral 100 (#F5F1E8) -->
<div style="background-color: #F5F1E8; color: #1A1A1A; padding: 20px;">
  Neutral 100 - Warm Cream Background
</div>

<!-- Heritage Darker (#064E2A) -->
<div style="background-color: #064E2A; color: white; padding: 20px;">
  Heritage Darker - Depth/Hover
</div>
```

## Debugging Checklist

- [ ] Are headings using `font-display`?
- [ ] Are primary buttons using `btn-primary`?
- [ ] Is the page background `neutral-100` or `bg-neutral-100`?
- [ ] Are corners using `rounded-lg` consistently?
- [ ] Are textile patterns applied subtly (8% opacity)?
- [ ] Do text colors use `neutral-*` or `heritage-*`, not `stone-*`?
- [ ] Are hover states using `heritage-darker`?
- [ ] Is the design distinctly Kenyan (not generic SaaS)?

---

**Need More Info?** See `DESIGN_SYSTEM.md` for full documentation  
**Visual Examples?** See `BEFORE_AFTER_GUIDE.md` for comparisons  
**Brand Guide?** See `REBRANDING_GUIDE.md` for complete overview

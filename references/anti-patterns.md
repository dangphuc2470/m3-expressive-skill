# Material 3 Expressive Anti-Patterns & Slop Prevention

This document establishes the boundaries of Material 3 Expressive. During generation and code reviews, designs that exhibit any of these anti-patterns must be rejected and corrected immediately.

---

## 1. AI Slop & Self-Referential Artifacts

### 1.1. Self-Labeling & Meta Branding
- **Anti-Pattern:** Putting "Material 3", "M3", "M3 Expressive", or "Expressive Edition" into application titles, navigation headers, logo badges, or footer credits.
- **Why It Fails:** Users care about their actual product and tasks (e.g., "Audio Converter", "Trip Navigator", "Server Metrics"). Real design systems are invisible infrastructure, never decorative branding plastered across the UI.
- **Rule:** Never print design system names on user interfaces. All titles and labels must describe actual domain features.

### 1.2. Landing Page Disease on Utility Tools
- **Anti-Pattern:** Wrapping productivity tools, data dashboards, image editors, or admin screens in SaaS landing page templates (e.g., floating badge "100% Secure & On-Device", centered H1 headline with one gradient-colored word, followed by three decorative feature cards before reaching the workspace).
- **Why It Fails:** Utility screens exist for high-speed manipulation and dense information scanning. Forcing users to scroll past decorative promotional fluff destroys productivity and signals amateur AI-generated scaffolding.
- **Rule:** Tools must load directly into the active workspace, editor canvas, or functional data table. Place status indicators (like offline state or encryption) in standard status bars or compact chips, not in hero marketing banners.

### 1.3. Bureaucratic Template Regurgitation
- **Anti-Pattern:** Outputting boilerplate analysis blocks like "Intensity Level: Foundational", "Target WindowSizeClass: Compact", or regurgitating user instructions back to the user before providing code.
- **Why It Fails:** It wastes context window, inflates response latency, and provides zero engineering value.
- **Rule:** Deliver clean, production-ready code with concise, technical reasoning explaining specific component and token decisions.

### 1.4. Screen Header Icon Gimmicks
- **Anti-Pattern:** Slapping an oversized decorative shape or novelty icon (e.g., 58px 6-sided cookie, star, or giant emoji badge) directly beside the primary screen `h1` title in professional productivity tools or dashboards.
- **Why It Fails:** Gives the interface a frivolous, casual-game or toy-like appearance, creates visual competition with subordinate card badges, and wastes valuable horizontal header space.
- **Rule:** Screen Headers in professional tools must rely on **Pure Typography**: a crisp `Headline Medium/Large` (`h1`) paired with a muted `Body Medium` subtitle, aligned cleanly to the left margin. Reserve icons strictly for functional action buttons, navigation items, or status chips.

---

## 2. Fake-Material Styling

### 2.1. The Universal Rounded Card Fallacy
- **Anti-Pattern:** Enclosing every list item, row, and text block inside its own elevated, high-radius card.
- **Why It Fails:** Produces visual fragmentation, noise, and destroys content scanning.
- **Correction:** Use flat list items, subtle dividers, or clean spatial grouping. Reserve cards for distinct, self-contained functional entities.

### 2.2. The Universal Pill / Capsule Fallacy
- **Anti-Pattern:** Making every button, chip, text field, search box, and container a 100px / 50% pill.
- **Why It Fails:** Eliminates visual hierarchy. When all elements share the exact same pill geometry, none of them stand out.
- **Correction:** Use standard corner radiuses (8dp, 12dp, 16dp, 20dp, 28dp) according to the 10-step scale. Pair rounded controls with square or rectangular containers to produce intentional visual tension.

### 2.3. Hardcoded Default Purple
- **Anti-Pattern:** Hardcoding `#6750A4`, `#D0BCFF`, or Google sample blues (`#0B57D0`) across files without semantic variables.
- **Why It Fails:** `#6750A4` is merely Google's baseline placeholder seed. Genuine M3 relies on dynamic tonal palettes derived from wallpaper, product branding, or domain themes (e.g., Botanical green for outdoor tracking, Slate for code editing).
- **Correction:** Reference semantic tokens (`MaterialTheme.colorScheme.primary`, `var(--md-sys-color-primary)`).

### 2.4. Elevation Shadow Clutter (M2 Hangover)
- **Anti-Pattern:** Adding dark drop shadows (`box-shadow: 0 4px 12px rgba(0,0,0,0.15)`) to every container.
- **Why It Fails:** Material 3 replaced elevation shadows with **Tone-Based Surface Containers**.
- **Correction:** Differentiate depth using the 5 surface container roles (`surface-container-lowest` up to `highest`). Shadows are reserved solely for floating modal elements (dialogs, menus, floating toolbars).

---

## 3. Expressive Misuse & Overload

### 3.1. Everything is a Hero
- **Anti-Pattern:** Giving every section vibrant contrasting colors, rotating badges, and morphing shapes.
- **Why It Fails:** "If everything is expressive, nothing is expressive." Visual overstimulation causes cognitive fatigue and ruins usability.
- **Rule:** Strict limit of **1 to 2 Hero Moments per product**. 90% of screens (settings, data grids, forms, logs) must remain quiet, disciplined, and utilitarian.

### 3.2. Unconventional Shapes on Text Containers
- **Anti-Pattern:** Placing paragraphs, form inputs, or complex data tables inside cookies, stars, clovers, or slanted shapes.
- **Why It Fails:** Geometric distortion clips text, breaks baseline alignment, and creates severe legibility barriers.
- **Rule:** The 35 expressive shapes are reserved exclusively for non-text containers, hero badges, avatar masks, graphic imagery, icon backgrounds, and loading indicators.

### 3.3. Chaotic Motion Physics
- **Anti-Pattern:** Applying bouncy overshoot springs to color transitions, text fades, or opacity changes.
- **Why It Fails:** Causes visual flickering, jitter, and perceived rendering bugs.
- **Rule:**
  - **Spatial movement (x, y, scale, corner radius, shape morph):** Spatial spring with subtle overshoot allowed (`damping < 1.0`).
  - **Effects (color, alpha/opacity):** Effects spring strictly critically damped with zero overshoot (`damping = 1.0`).

### 3.4. Metric Card Watermarks & Graphic Duplication
- **Anti-Pattern:** 
  1. Duplicating the exact same graphic watermark across different semantic cards (e.g., using signal bars for both Network Latency and Speed metrics).
  2. Guessing complex multi-curve Bezier coordinates manually in SVG when replicating reference assets, causing distorted, paper-clipped, or pinched geometry.
  3. Allowing background watermarks to bleed carelessly over card borders or crowd out primary numeric metric typography.
- **Why It Fails:** Graphic duplication confuses users who rely on visual landmarks for quick scanning. Manual Bezier coordinate guessing introduces jarring aesthetic defects.
- **Rule:**
  - **Distinct Domain Semantics:** Every metric card must feature a distinct visual metaphor: Distance = Winding S-curve road ribbon; Speed = Aerodynamic wind streaks or speedometer gauge; Latency/Connection = Rounded signal bars.
  - **Quadrant Discipline:** Watermarks belong strictly in the right or bottom-right quadrant of the card. Preserve a respectful inner margin (~8px - 14px) from outer card borders.
  - **Asset Extraction over Coordinate Guessing:** When replicating an existing graphic asset, extract clean transparent vector/raster assets directly or use single centerline strokes with uniform/perspective linecaps. Never invent dozens of freehand Bezier coordinates blindly.

---

## 4. Component Misuse

| Anti-Pattern | Correct M3 Expressive Implementation |
|---|---|
| Using Segmented Buttons | Replace with **Connected Button Group** (2dp inner gap, shape morph on selection). Segmented buttons are deprecated. |
| Using Bottom App Bar | Replace with **Docked Toolbar** (full width, 64dp height, standard/vibrant color options). |
| Competing FABs on screen | Exactly 1 FAB per screen for the primary action. Use a **FAB Menu** if multiple subordinate actions are needed. |
| Chips used as primary action buttons | Use **Filled Button** or **Tonal Button**. Chips are for filtering, input tags, or contextual suggestions only. |
| Chips used for primary navigation | Use **Navigation Bar** (bottom mobile), **Navigation Rail** (tablet), or **Navigation Drawer** (desktop). |
| Showing Toolbar and Navigation Bar together | Never show both at the bottom simultaneously. Navigation bar is for top destinations; Toolbar is for contextual action screens. |
| Square icon buttons inside a Floating Toolbar | Use fully rounded (pill) icon buttons. Square buttons conflict with the 32dp pill container of the floating toolbar. |

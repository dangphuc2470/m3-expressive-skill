# Material 3 Screen Archetypes & Page Blueprints

Architectural guidance and structural layout archetypes for production applications in Material Design 3 Expressive. Applies across Web (Responsive) and Mobile (Android Compose, Flutter).

---

## 1. Landing Pages & Product Showcases (Anti-Slop Guidelines)

When designing marketing landing pages or showcasing an M3 design system:

- **Core Aesthetic Philosophy:** Avoid generic AI boilerplate layouts (centered low-contrast H1 slogans, rows of 3 gradient icon cards, and artificial glowing borders).
- **Hero Section Rules:**
  - **Live Product Fragment:** The centerpiece of the hero section must be an authentic, functional slice of the interface (e.g., interactive data dashboard, live metric feed, or working navigation controls). Show users the real application rather than decorative stock illustrations.
  - **Pure Typography:** Large, authoritative headings (`Headline Large` or `Display Medium`). Avoid decorative badges, emojis, or whimsical novelty icons next to primary titles.
  - **Expressive Material Surfaces:** Anchor content within structured `surface-container-low` containers with `corner-extra-large` (28px) rounding and subtle 1px `outline-variant` borders to establish clean tactile elevation.

---

## 2. Archetype 1: Analytics & Operational Dashboards

Recommended for fleet management, telemetry monitoring, financial portfolios, and system health consoles.

- **Layout Structure:**
  1. **Sticky Header:** Pure Typography (`Display Small` or `Headline Medium`), with contextual range/time filters aligned on the right (`Segmented Button` or `Filter Chips`).
  2. **Metric Summary Grid:** Responsive stat card grid (2 columns on mobile, 3–4 columns on tablet/desktop).
     - Surface: `surface-container-lowest` or `surface-container-low`.
     - Corner Radius: 16px (`corner-large`).
     - **Background & Ambient Treatments:**
       - Focus remains strictly on primary numeric values (`Headline Medium/Large`) and readable labels.
       - Where graphical backdrops are introduced to heighten visual storytelling, vector paths must maintain subtle opacity (`0.10 - 0.20`), anchor continuously to container borders (`top`, `bottom`, `right`), and clip cleanly via `overflow: hidden`.
       - Vector artwork must bind dynamically to system color tokens (`currentColor` or CSS variables) to adapt across light and dark theme shifts.
  3. **Visual Data Representation:** Primary charts, maps, or topological logs housed in dedicated large panels with 24–28px corner rounding.
  4. **Activity Stream / Recent Log:** Chronological table or list with semantic status dots and leading entity avatars.

---

## 3. Archetype 2: Settings & Structured Form Flows

Recommended for account configuration, profile editing, purchase checkout, and data entry workflows.

- **Layout Structure:**
  1. **Top App Bar:** Left-aligned `Title Large` headline with an optional back navigation arrow and secondary overflow actions.
  2. **Grouped Card Surfaces:** Rather than scattering loose input controls across a bare canvas, organize related settings into cohesive `surface-container-low` cards with 16px corner rounding.
  3. **Row Item Architecture (Setting Tiles):**
     - Leading: 24dp entity icon enclosed in a `surface-container-high` circular container.
     - Center: `Title Medium` setting label paired with a `Body Small` supporting caption.
     - Trailing: Switch toggle, segmented choice, or a forward chevron indicating drill-down navigation.
     - Dividers: Inset hairline dividers (`outline-variant`) indented 56dp to align cleanly with the text margin.
  4. **Primary Sticky Action:** Full-width or centered `Filled Button` anchored at the bottom edge or integrated within a floating action capsule.

---

## 4. Archetype 3: Master-Detail Lists & Data Grids

Recommended for inventory catalogs, messaging inboxes, contact directories, and transaction histories.

- **Layout Structure:**
  1. **Search & Filter Surface:**
     - 56dp pill-shaped Search Bar anchored at the top.
     - Horizontally scrollable filter chip row positioned directly below (e.g., "All", "In Progress", "Completed", "Flagged").
  2. **List Tiles:**
     - Row height: 72–88dp for multi-line content with thumbnails; 56dp for single-line items.
     - Leading: 40dp circle avatar or 8dp-rounded image thumbnail.
     - Content: Headline text accompanied by supporting status text.
     - Trailing: Semantic meta pill badge or financial figures.
  3. **Adaptive Master-Detail Architecture:**
     - Narrow viewports (Compact): Sequential list-to-detail navigation stack.
     - Wide viewports (Expanded): Persistent dual-pane view: Left column (360–400dp) displays the navigable list; Right column flexes to display the active item's full detail view.

---

## 5. Archetype 4: Multi-Device Adaptive Scaffold

Responsive layout transitions across phone, foldable, tablet, and desktop viewports:

| Viewport Category | Breakpoint Width | Primary Navigation Component | Canonical Layout Architecture |
| :--- | :--- | :--- | :--- |
| **Compact (Phone)** | `< 600 dp` | **Navigation Bar** (80dp, bottom docked) | Single-column vertical scroll flow |
| **Medium (Foldable / Portrait Tablet)** | `600 - 839 dp` | **Navigation Rail** (80dp, compact left-docked) | Two-column flexible layout grid |
| **Expanded (Landscape Tablet / Laptop)** | `840 - 1199 dp` | **Navigation Rail** (Expanded 256dp) | Master-Detail dual-pane split view |
| **Extra-Large (Desktop / Wide Monitor)** | `>= 1200 dp` | **Standard Navigation Drawer** (Permanent left) | Tri-pane architecture (Nav - List - Detail) |

# Material 3 Expressive Component Catalog

This document details the exact specifications, tokens, and layouts for the 14 new and updated components introduced in Material 3 Expressive.

---

## 1. Toolbars (New)

Toolbars organize contextual actions and replace the legacy Material 2 Bottom App Bar.

### 1.1. Floating Toolbar
Floats above body content at the bottom of the window (or vertically along the edge on larger screens).

- **Container Dimensions:** Height: `64dp`, Minimum Width: Hugs contents, Minimum Window Margin: `16dp` horizontal, `24dp` bottom.
- **Corner Radius:** `32dp` (`--md-sys-shape-corner-extra-large-increased`).
- **Internal Padding:** Top/Bottom: `12dp`, Left/Right: `8dp`.
- **Inner Item Gap:** `4dp`.
- **Background Fill:** `surface-container` (`#F3EDF7` Light / `#211F26` Dark).
- **Elevation / Shadow:** Level 3 (`box-shadow: 0 4px 8px 3px rgba(0,0,0,0.15)`).
- **Child Items:** Fully rounded pill icon buttons (`borderRadius: 100px / 9999px`) or text buttons. Never place sharp square buttons inside a floating toolbar.
- **Scroll Behavior:** Can remain pinned, animate offscreen, or collapse into a single FAB.

### 1.2. Docked Toolbar
Spans the entire viewport width at the bottom of the screen.

- **Container Dimensions:** Height: `64dp`, Width: `100%`.
- **Corner Radius:** `0dp` (`None`).
- **Background Fill:** `surface-container` (Standard) or `surface-container-high` (Vibrant).
- **Elevation:** None (relies on tonal separation).

---

## 2. Button Groups (New)

Button groups manage related actions or selection states.

### 2.1. Connected Button Group (Replaces Segmented Button)
*Note: The legacy Segmented Button is formally deprecated and should be replaced with this component.*

- **Layout:** Contiguous horizontal group with exactly **`2dp` padding/gap** between buttons.
- **Sizes:** Available in XS, S, M, L, XL.
- **Selection Behavior:** Supports single-select or multi-select toggle buttons.
- **Shape Dynamic:** When an item is selected, its shape transitions between rounded and square to emphasize its active state.

### 2.2. Standard Button Group
- **Layout:** Standalone buttons separated by standard spacing.
- **Interactive Morph:** Pressing or selecting a button animates its width and shape morph, causing adjacent buttons to fluidly shift positions.

---

## 3. Split Button (New)

Combines an immediate primary action with an attached dropdown menu for subordinate options.

- **Structure:**
  - **Leading Action Button:** Contains primary label and optional leading icon.
  - **Trailing Trigger Button:** Icon button containing an expand/collapse chevron.
- **Inner Separation:** Exactly **`2dp` gap** between leading and trailing buttons.
- **Menu Motion:** The chevron in the trailing button rotates **180° inwards** using the **Standard Motion Scheme** (not expressive bounce).
- **Menu Alignment:** Aligns directly to the trailing button with a `4dp` vertical offset.

---

## 4. Loading Indicator (New)

Replaces indeterminate circular progress spinners for operations with short, unknown durations (between 200ms and 5 seconds).

- **Animation:** A continuous **looping shape morph** sequence interpolating between 7 distinct Material 3 shapes (e.g., Circle -> 6-Sided Cookie -> Clover -> Sunny -> Morph).
- **Size Range:** Flexible from `24dp` (micro/in-button) to `240dp` (desktop hero). Default: **`48dp`**.
- **Containment:**
  - *Uncontained:* Rendered directly on flat surfaces with `primary` fill.
  - *Contained:* Placed inside a rounded surface container with `on-primary-container` fill (required for pull-to-refresh).
- **Accessibility:** Must include `role="progressbar"` with an explicit aria-label describing the ongoing process (e.g., `aria-label="Updating routes"`).

---

## 5. FAB Menu & Extended FAB

- **Extended FAB:** Combines an icon and text label for the single most critical screen action. Height: `56dp`, Corner Radius: `16dp` or `Full` (28dp).
- **FAB Menu:** Clicking the root FAB rotates the icon 45° (into a close glyph) while unfolding a vertical stack of subordinate action pills with spatial spring physics.

---

## 6. Navigation Bar & Navigation Rail

- **Navigation Bar (Mobile Bottom):**
  - Displays 3 to 5 primary top-level destinations.
  - Height: `80dp`, Fill: `surface-container`.
  - Active destination is highlighted by a **horizontal pill capsule** (`64x32dp`) that glides smoothly across slots using a spatial spring.
- **Navigation Rail (Tablet / Desktop Folded):**
  - Vertical rail placed on the leading edge (left for LTR). Width: `80dp`.
  - Can be paired with a vertical Floating Toolbar on the opposite trailing edge to maintain ergonomic symmetry.

---

## 7. Interactive Sliders

- **Active Track:** Expands to a bold, thick tactile pill during user drag interactions.
- **Inactive Track:** Recesses into a subtle secondary/tertiary container tone.
- **Value Indicator:** Pops out above the thumb thumb using a spatial spring with slight overshoot.

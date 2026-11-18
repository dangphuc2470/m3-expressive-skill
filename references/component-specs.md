# Material 3 Component Specifications & Metrics

Authoritative geometric dimensions, padding rules, and touch target standards derived from Google Material Design 3 (M3). All AI agents generating UI code for Web or Mobile must cross-reference these physical metrics.

---

## 1. Touch Target & Accessibility Principles

- **Mobile Touch Target:** Minimum **48x48 dp** for all interactive targets (Buttons, Icon Buttons, Checkboxes, Switches, Tabs). If visual bounds are smaller (e.g., 24dp icon or 16dp badge), transparent padding must expand the bounding box to 48dp.
- **Desktop / Web Pointer Target:** Minimum **40x40 px** for mouse cursor and stylus interaction.
- **Inter-Element Spacing:** Minimum **8dp** clearance between adjacent interactive elements to prevent mis-clicks.

---

## 2. Buttons & Actions

| Button Variant | Height | Corner Radius | Horizontal Padding | Icon Size |
| :--- | :--- | :--- | :--- | :--- |
| **Standard Button** (Filled, Tonal, Outlined, Text) | 40 dp | 20 dp (Full Pill) | 24 dp (16 dp with icon) | 18 - 20 dp |
| **Small / Dense Button** | 32 dp | 16 dp | 16 dp (12 dp with icon) | 16 dp |
| **Connected Button Item** | 40 dp | Outer edges: 16-20dp, Inner: 0dp | 16 dp | 18 dp |
| **Icon Button** (Standard, Filled, Tonal, Outlined) | 40x40 dp | 20 dp (Circle 50%) | 8 dp (48x48 touch target) | 24 dp |
| **Floating Action Button (FAB) Small** | 40x40 dp | 12 dp | - | 24 dp |
| **Floating Action Button (FAB) Regular** | 56x56 dp | 16 dp | - | 24 dp |
| **Floating Action Button (FAB) Large** | 96x96 dp | 28 dp | - | 36 dp |
| **Extended FAB** | 56 dp | 16 dp | 16 dp leading icon, 20 dp trailing text | 24 dp |

---

## 3. Cards & Containers

- **Standard Card (Elevated / Filled / Outlined):**
  - **Default Corner Radius:** `corner-large` (**16 dp**).
  - **Internal Padding:** **16 dp** (compact viewports) or **20 - 24 dp** (expanded viewports).
  - **Outlined Card Border:** Stroke width `1 dp`, color `outline-variant`.
- **Hero Card / Primary Metric Card:**
  - **Corner Radius:** `corner-extra-large` (**28 dp**).
  - **Internal Padding:** **24 dp**.
- **Bottom Sheet / Modal Dialog:**
  - **Corner Radius:** `corner-extra-large` (**28 dp**). Dialogs round all 4 corners; Bottom Sheets round the top corners only (`28dp 28dp 0 0`).
  - **Internal Padding:** **24 dp**.

---

## 4. Input Fields & Search Bars

- **Text Field (Filled / Outlined):**
  - **Minimum Height:** **56 dp**.
  - **Outlined Field Corner Radius:** `corner-extra-small` (**4 dp**) or `corner-small` (**8 dp**).
  - **Filled Field Corner Radius:** Top corners 4dp (`4dp 4dp 0 0`), flat bottom with a 1dp indicator bar (2dp when focused).
  - **Internal Horizontal Padding:** **16 dp**.
  - **Supporting & Error Text:** `body-small` (12sp), top padding 4dp, horizontal indent 16dp.
- **Search Bar (M3 Search Pill):**
  - **Standard Height:** **56 dp**.
  - **Corner Radius:** `corner-full` (**28 dp**).
  - **Horizontal Padding:** **16 dp** (Leading search icon 24dp, Trailing avatar/filter icon 24dp).
  - **Background Surface:** `surface-container-high`.

---

## 5. Navigation Components

- **Navigation Bar (Mobile Bottom Bar):**
  - **Standard Height:** **80 dp** (includes a 32dp x 64dp pill-shaped active indicator).
  - **Background:** `surface-container`. Clean flat separation via background tone or subtle `outline-variant` hairline.
- **Navigation Rail (Vertical Sidebar for Tablet / Foldable):**
  - **Standard Width:** **80 dp** (compact) or expandable up to **192 - 256 dp**.
  - **Vertical Alignment:** Top-aligned FAB, item icons separated by 12dp intervals.
- **Navigation Drawer:**
  - **Standard Width:** **360 dp** (Modal) or **280 - 320 dp** (Standard docked).
  - **Drawer Sheet Corner Radius:** Right edge rounded with `28 dp`.

---

## 6. State Layer Opacity Standards

State interactions in M3 apply a semi-transparent overlay (`state-layer`) atop the component surface:

| State | State Layer Opacity (Color: On-Surface or On-Primary) |
| :--- | :--- |
| **Hover** | `8%` (0.08) |
| **Focus** | `10%` (0.10) |
| **Press (Active / Ripple)** | `10% - 12%` (0.10 - 0.12) |
| **Drag** | `16%` (0.16) |
| **Disabled Container** | `12%` (0.12) |
| **Disabled Content (Text / Icon)** | `38%` (0.38) |

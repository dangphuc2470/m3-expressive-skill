# Material 3 Expressive Responsive & Adaptive Layouts

Material 3 Expressive rejects fixed, one-size-fits-all mobile screens blown up on desktop. Layouts must respond intelligently across three standardized **Window Size Classes** and adhere to Google's **Canonical Layouts**.

---

## 1. Window Size Classes

| Window Class | Width (dp) | Target Devices | Primary Navigation | Layout Architecture |
|---|---|---|---|---|
| **Compact** | `< 600dp` | Phones in portrait, small foldables folded | Bottom Navigation Bar (80dp) | Single column, vertical scroll, floating/docked toolbar |
| **Medium** | `600dp – 839dp` | Large foldables unfolded, small tablets in portrait | Leading Navigation Rail (80dp) | Dual-pane (List-Detail or Supporting Pane) |
| **Expanded** | `840dp+` | Tablets in landscape, desktop web monitors | Navigation Rail or Permanent Navigation Drawer | Multi-pane canonical layouts, max-width content containers |

---

## 2. Canonical Layout Patterns

### 2.1. List-Detail
- **Ideal For:** Inboxes, settings, trip logs, messaging.
- **Compact:** Clicking an item navigates to a new full-screen detail view.
- **Medium / Expanded:** Renders side-by-side. The list pane takes 40% (min 360dp); the detail pane occupies 60% with its own surface container elevation.

### 2.2. Supporting Pane
- **Ideal For:** Document editors with comments, map navigation with turn telemetry, media player with queue.
- **Structure:** The primary canvas remains focused in the center. An auxiliary supporting pane sits on the trailing side (320dp to 400dp width) to display contextual actions or statistics.

### 2.3. Feed
- **Ideal For:** Dashboards, card streams, image galleries.
- **Reflow:** Scales from a 1-column feed on Compact to a 2-column or 3-column staggered masonry on Medium and Expanded.

---

## 3. Ergonomics & Foldable Postures

### 3.1. Physical Hinge & Seam Avoidance
On dual-screen or foldable hardware, never place interactive controls, floating toolbars, or text baselines directly across the physical hinge. Split content into two natural panes flanked on either side of the fold.

### 3.2. Desktop Max-Width Containment
Never stretch body text or utility cards across ultra-wide monitors (e.g., 1440px+):
- **Body Text Max Line-Length:** Limit to `60ch` to `75ch` (approximately 600–720px) to maintain readability.
- **Utility Tool Workspaces:** Center the active workspace or canvas with responsive gutters:
  ```css
  .m3-content-container {
    width: 100%;
    max-width: 1200px;
    margin-left: auto;
    margin-right: auto;
    padding-left: 24px;
    padding-right: 24px;
  }
  ```

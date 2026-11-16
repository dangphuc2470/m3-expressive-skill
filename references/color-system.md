# Material 3 Expressive Color System

Material 3's color system is rooted in the **HCT (Hue, Chroma, Tone)** color space. It moves away from arbitrary RGB/HSL values to enforce mathematically guaranteed contrast ratios across both light and dark themes.

---

## 1. The HCT Color Space

Unlike HSL or RGB, HCT decouples perceptual lightness (Tone) from color intensity (Chroma):
- **Hue (0–360):** The perceived color family (red, yellow, green, blue).
- **Chroma (0–~120):** Colorful saturation. 0 is pure neutral grey/monochrome; higher values indicate higher saturation.
- **Tone (0–100):** Perceptual luminance. 0 is absolute black; 100 is pure white.
  - Tone difference directly governs accessibility: a 40-point tone delta guarantees a 3:1 contrast ratio; a 50-point delta guarantees 4.5:1 (WCAG AA); a 70-point delta guarantees 7:1 (WCAG AAA).

---

## 2. The 5-Tier Tone-Based Surface Container System

In Material 2, depth was indicated by stacking black drop shadows (`elevation +1 to +5`). In Material 3 Expressive, elevation shadows are eliminated for static layouts and replaced by **Tone-Based Surface Containers**.

The hierarchy from lowest to highest:

| Role Name | CSS Token | Light Tone | Dark Tone | Semantic Usage |
|---|---|---|---|---|
| **Surface Dim** | `--md-sys-color-surface-dim` | Tone 87 | Tone 6 | Backgrounds that need to recess below base surface |
| **Surface** | `--md-sys-color-surface` | Tone 98 | Tone 6 | The default window background canvas |
| **Surface Bright** | `--md-sys-color-surface-bright` | Tone 98 | Tone 24 | Elevated background canvas requiring crispness |
| **Surface Container Lowest** | `--md-sys-color-surface-container-lowest` | Tone 100 | Tone 4 | Cards or panes that need the highest contrast against `surface` |
| **Surface Container Low** | `--md-sys-color-surface-container-low` | Tone 96 | Tone 10 | Subtle grouping containers on top of `surface` |
| **Surface Container** | `--md-sys-color-surface-container` | Tone 94 | Tone 12 | **Default container** for cards, sheets, and toolbars |
| **Surface Container High** | `--md-sys-color-surface-container-high` | Tone 92 | Tone 17 | Prominent containers, dialogs, floating panels |
| **Surface Container Highest** | `--md-sys-color-surface-container-highest` | Tone 90 | Tone 22 | Highest emphasis containers, search bars, inputs |

### Container Stacking Rule
Never stack two identical surface containers directly on top of each other without a border or gap. Always progress by at least 1 tier (e.g., `surface` canvas -> `surface-container` card -> `surface-container-high` inner header).

---

## 3. Accent Roles & Dynamic Theming

### 3.1. The Three Accent Groups
1. **Primary (`primary`, `on-primary`, `primary-container`, `on-primary-container`):**
   - The most prominent brand role. Used for primary filled buttons, active states, key interactive indicators, and FABs.
2. **Secondary (`secondary`, `on-secondary`, `secondary-container`, `on-secondary-container`):**
   - Less prominent actions. Used for filter chips, tonal icon buttons, segmented toggles, and selection tracks.
3. **Tertiary (`tertiary`, `on-tertiary`, `tertiary-container`, `on-tertiary-container`):**
   - Contrasting accents that balance primary. Used for badges, warning-adjacent notifications, creative editorial moments, or highlighting secondary metrics.

### 3.2. Fixed Accent Roles (Cross-Theme Stability)
Fixed roles maintain identical tonal luminance in both light and dark themes:
- `primary-fixed`, `primary-fixed-dim`, `on-primary-fixed`, `on-primary-fixed-variant`
- `secondary-fixed`, `secondary-fixed-dim`, `on-secondary-fixed`, `on-secondary-fixed-variant`
- `tertiary-fixed`, `tertiary-fixed-dim`, `on-tertiary-fixed`, `on-tertiary-fixed-variant`
- **Usage:** Ideal for media players, map overlays, or camera views where elements must maintain constant contrast regardless of system dark mode.

---

## 4. State Layers

Hover, focus, pressed, and dragged states are generated using semi-transparent overlays of the corresponding `on-*` color:

| State | Opacity | Example Application |
|---|---|---|
| **Hover** | 8% (0.08) | `background: rgba(var(--on-surface), 0.08)` |
| **Focus** | 10% (0.10) | Combined with an outline indicator |
| **Pressed** | 10% (0.10) | Accompanied by touch ripple |
| **Dragged** | 16% (0.16) | Accompanied by subtle spatial elevation |

---

## 5. Production Tokens: Web CSS Mapping

```css
:root {
  /* Surface hierarchy (Light Theme) */
  --md-sys-color-surface-dim: #DED8E1;
  --md-sys-color-surface: #FEF7FF;
  --md-sys-color-surface-bright: #FEF7FF;
  --md-sys-color-surface-container-lowest: #FFFFFF;
  --md-sys-color-surface-container-low: #F7F2FA;
  --md-sys-color-surface-container: #F3EDF7;
  --md-sys-color-surface-container-high: #ECE6F0;
  --md-sys-color-surface-container-highest: #E6E0E9;
  
  --md-sys-color-on-surface: #1D1B20;
  --md-sys-color-on-surface-variant: #49454F;
  --md-sys-color-outline: #79747E;
  --md-sys-color-outline-variant: #CAC4D0;
}

@media (prefers-color-scheme: dark) {
  :root {
    /* Surface hierarchy (Dark Theme) */
    --md-sys-color-surface-dim: #141218;
    --md-sys-color-surface: #141218;
    --md-sys-color-surface-bright: #3B383E;
    --md-sys-color-surface-container-lowest: #0F0D13;
    --md-sys-color-surface-container-low: #1D1B20;
    --md-sys-color-surface-container: #211F26;
    --md-sys-color-surface-container-high: #2B2930;
    --md-sys-color-surface-container-highest: #36343B;
    
    --md-sys-color-on-surface: #E6E0E9;
    --md-sys-color-on-surface-variant: #CAC4D0;
    --md-sys-color-outline: #938F99;
    --md-sys-color-outline-variant: #49454F;
  }
}
```

# Material 3 Expressive Typography

Material 3 Expressive expands the typographic scale from 15 styles to **30 distinct styles**, comprising 15 baseline styles and **15 emphasized styles**.

---

## 1. Baseline vs Emphasized Typescale

The emphasized styles maintain identical font sizes to their baseline counterparts but increase font weight, letter-tracking, and optical boldness to establish decisive focal points.

| Role | Size | Baseline Weight | Emphasized Weight | Primary Expressive Use Case |
|---|---|---|---|---|
| **Display Large** | 57sp | Regular (400) | Medium/Bold (500–700) | Single-phrase hero editorial moments |
| **Display Medium** | 45sp | Regular (400) | Medium/Bold (500–700) | Standalone splash headers |
| **Display Small** | 36sp | Regular (400) | Medium/Bold (500–700) | Prominent metric values |
| **Headline Large** | 32sp | Regular (400) | Bold (700) | Top-level screen title |
| **Headline Medium** | 28sp | Regular (400) | Bold (700) | Main section header |
| **Headline Small** | 24sp | Regular (400) | Bold (700) | Card group header |
| **Title Large** | 22sp | Regular (400) | Medium/Bold (500–600) | App bar title, modal dialog title |
| **Title Medium** | 16sp | Medium (500) | Bold (700) | Card title, selected list item title |
| **Title Small** | 14sp | Medium (500) | Bold (700) | Sub-header, grouped list caption |
| **Body Large** | 16sp | Regular (400) | Medium (500) | Primary narrative reading text |
| **Body Medium** | 14sp | Regular (400) | Medium (500) | Standard body copy, table cell content |
| **Body Small** | 12sp | Regular (400) | Medium (500) | Secondary annotation, metadata text |
| **Label Large** | 14sp | Medium (500) | Bold (700) | Primary button labels, active tab text |
| **Label Medium** | 12sp | Medium (500) | Bold (700) | Badges, chips, secondary button labels |
| **Label Small** | 11sp | Medium (500) | Bold (700) | Legal disclaimers, micro timestamps |

---

## 2. Variable Font Strategy

Material 3 recommends using variable font families to dynamically adjust typographic voice:

1. **Roboto Flex:**
   - Default variable font for Android and modern web applications.
   - Key Axes: Weight (`wght`: 100–1000), Width (`wdth`: 25–151%), Optical Size (`opsz`: 8–144), Grade (`GRAD`: -200–150).
2. **Roboto Serif:**
   - Designed specifically for long-form narrative reading and editorial headers.
3. **Roboto Mono:**
   - Monospaced typography for developer tools, real-time coordinate readouts, speeds, timestamps, and tabular data tables.

---

## 3. Critical Language Line-Height Requirements

A frequent layout bug in multi-language interfaces is **diacritic clipping** (accents on tall letters being cut off by tight line-heights or fixed container heights).

Material 3 defines four language height categories:

| Category | Height Adjustment | Supported Scripts / Languages |
|---|---|---|
| **Small (Base)** | Standard (1.0x) | English, Latin-based scripts (except Vietnamese), Greek, Cyrillic, Hebrew |
| **Medium** | **+7% taller line-height** | **Vietnamese**, Arabic, Chinese, Japanese, Korean, Hindi, Thai, Bangla |
| **Large** | +30% taller line-height | Burmese, Telugu |
| **Extra Large** | +100% taller line-height | Nastaliq script |

### Implementation Rule for Vietnamese Text
When rendering Vietnamese text (which contains stacked diacritics such as `ệ`, `ở`, `ữ`, `ẩ`), **never** constrain containers to rigid single-line heights without vertical padding. Ensure `lineHeight` is at least **1.4em to 1.5em** to prevent accent cutoff.

---

## 4. Production Web CSS Mapping

```css
:root {
  --md-ref-typeface-brand: "Roboto Flex", system-ui, sans-serif;
  --md-ref-typeface-plain: "Roboto Flex", system-ui, sans-serif;
  --md-ref-typeface-mono: "Roboto Mono", monospace;

  /* Headline Large - Emphasized */
  --md-sys-typescale-headline-large-font: var(--md-ref-typeface-brand);
  --md-sys-typescale-headline-large-size: 32px;
  --md-sys-typescale-headline-large-line-height: 40px;
  --md-sys-typescale-headline-large-weight: 700;

  /* Title Medium - Emphasized */
  --md-sys-typescale-title-medium-font: var(--md-ref-typeface-brand);
  --md-sys-typescale-title-medium-size: 16px;
  --md-sys-typescale-title-medium-line-height: 24px;
  --md-sys-typescale-title-medium-weight: 700;

  /* Body Medium - Baseline */
  --md-sys-typescale-body-medium-font: var(--md-ref-typeface-plain);
  --md-sys-typescale-body-medium-size: 14px;
  --md-sys-typescale-body-medium-line-height: 20px;
  --md-sys-typescale-body-medium-weight: 400;

  /* Label Large - Emphasized */
  --md-sys-typescale-label-large-font: var(--md-ref-typeface-plain);
  --md-sys-typescale-label-large-size: 14px;
  --md-sys-typescale-label-large-line-height: 20px;
  --md-sys-typescale-label-large-weight: 700;
}
```

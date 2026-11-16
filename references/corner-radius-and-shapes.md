# Material 3 Expressive Corner Radius & Shape Geometry

The shape system in Material 3 Expressive introduces two major advancements over baseline M3:
1. An expanded **10-step Corner Radius Scale** that adds intermediate sizes (20dp, 32dp, 48dp) to create smoother visual transitions.
2. The official **35 Expressive Shapes Catalog**, enabling organic geometry, shape morphing, and brand expression.

---

## 1. The 10-Step Corner Radius Scale

All rectangular containers, controls, and dialogs map to this authoritative 10-tier scale:

| Step Name | Size (dp) | CSS Variable | Semantic Usage |
|---|---|---|---|
| **None** | `0dp` | `--md-sys-shape-corner-none: 0px` | Docked full-width toolbars, flush edges |
| **Extra-small** | `4dp` | `--md-sys-shape-corner-extra-small: 4px` | Snackbars, autocomplete chips, inner items |
| **Small** | `8dp` | `--md-sys-shape-corner-small: 8px` | Tooltips, compact text fields, inner tags |
| **Medium** | `12dp` | `--md-sys-shape-corner-medium: 12px` | Standard cards, small dialogs, dropdown menus |
| **Large** | `16dp` | `--md-sys-shape-corner-large: 16px` | Large cards, navigation rail items |
| **Large-increased** | `20dp` | `--md-sys-shape-corner-large-increased: 20px` | **M3 Expressive:** Prominent cards, banners |
| **Extra-large** | `28dp` | `--md-sys-shape-corner-extra-large: 28px` | Standard dialogs, navigation drawers |
| **Extra-large-increased** | `32dp` | `--md-sys-shape-corner-extra-large-increased: 32px` | **M3 Expressive:** Floating Toolbars, Search bars |
| **Extra-extra-large** | `48dp` | `--md-sys-shape-corner-extra-extra-large: 48px` | **M3 Expressive:** Bottom sheets, hero containers |
| **Full** | `9999px` | `--md-sys-shape-corner-full: 9999px` | Buttons, badges, capsule docks, pill indicators |

---

## 2. Corner Nesting Mathematics

A common visual defect occurs when child containers inside rounded parents do not concentricly follow the parent's curve. 

Material 3 Expressive mandates the **Concentric Corner Formula**:

$$\text{Radius}_{\text{inner}} = \max\left(0\text{dp},\, \text{Radius}_{\text{outer}} - \text{Padding}\right)$$

### Concrete Examples:
- **Floating Toolbar Container (`32dp` outer, `8dp` padding):**
  $$\text{Inner Radius} = 32\text{dp} - 8\text{dp} = 24\text{dp}$$
- **Hero Card (`48dp` outer, `16dp` padding):**
  $$\text{Inner Radius} = 48\text{dp} - 16\text{dp} = 32\text{dp}$$
- If the inner element is a button intended to be a pill, use `Full` (`9999px`).
- If $\text{Padding} \ge \text{Radius}_{\text{outer}}$, the inner corner should be `0dp` (square).

---

## 3. The 35 Official Figma Expressive Shapes

From official Figma Node `#58548:7248` (Shape Set):

### 3.1. Basic & Geometric (14 Shapes)
1. **Circle:** Perfect 1:1 circle.
2. **Square:** 0dp corner square for geometric tension.
3. **Slanted:** Parallelogram with sheared vertical sides.
4. **Arch:** Flat bottom with semicircular rounded top.
5. **Fan:** Quarter circle wedge.
6. **Arrow:** Directional chevron indicator.
7. **Semicircle:** 180° half circle.
8. **Oval:** Stretched elliptical container.
9. **Pill:** Capsule with full-rounded ends.
10. **Triangle:** Equilateral triangle with rounded vertices.
11. **Diamond:** 45° rotated square.
12. **Clamshell:** Curved organic scallop shape.
13. **Pentagon:** 5-sided regular polygon with rounded corners.
14. **Gem:** Octagonal faceted polygon.

### 3.2. Cookies & Clovers (8 Shapes)
15. **4-sided cookie:** Rounded 4-cusp rosette.
16. **6-sided cookie:** Rounded 6-cusp rosette (ideal for wearable watch badges and active avatars).
17. **7-sided cookie:** 7-cusp asymmetrical organic rosette.
18. **9-sided cookie:** 9-cusp fine-wave rosette.
19. **12-sided cookie:** 12-cusp cog/flower rosette.
20. **4-leaf clover:** Traditional lucky clover profile.
21. **8-leaf clover:** Double clover decorative badge.
22. **Flower:** Deep-petal floral silhouette.

### 3.3. Sunny & Bursts (8 Shapes)
23. **Sunny:** Multi-pointed rounded sunburst.
24. **Very sunny:** High-frequency ray sunburst.
25. **Burst:** Sharp, dynamic explosion polygon.
26. **Soft burst:** Rounded-tip burst polygon.
27. **Boom:** Asymmetric comic impact burst.
28. **Soft boom:** Rounded organic impact bubble.
29. **Puffy:** Organic cloud-like bubble contour.
30. **Puffy diamond:** Diamond with bulbous, convex curved edges.

### 3.4. Playful & Iconographic (5 Shapes)
31. **Ghost-ish:** Rounded top with undulating scalloped lower edge.
32. **Pixel circle:** Stepped 8-bit approximation of a circle.
33. **Pixel triangle:** Stepped 8-bit approximation of a triangle.
34. **Bun:** Fluffy bread-bun rounded silhouette.
35. **Heart:** Balanced symmetrical heart shape.

---

## 4. Parametric Rosette Mathematics (Cookie & Flower Shapes)

Organic cookies and flower shapes can be rendered dynamically in Jetpack Compose or Web Canvas using polar harmonic equations:

$$r(\theta) = R_{\text{base}} + A \cdot \cos(N \cdot \theta)$$

Where:
- $N$ is the number of cusps/petals (e.g., $N=4, 6, 7, 8, 12$).
- $R_{\text{base}}$ is the normalized base radius (typically $0.44$ to $0.46$).
- $A$ is the modulation amplitude (typically $0.03$ to $0.05$ for cookies; $0.08$ to $0.12$ for flowers).

### Jetpack Compose Implementation
```kotlin
fun createCookieShape(petals: Int, amplitude: Float = 0.035f, baseRadius: Float = 0.46f): Shape {
    return GenericShape { size, _ ->
        val cx = size.width / 2f
        val cy = size.height / 2f
        val steps = 120
        for (i in 0..steps) {
            val angle = i * 2.0 * Math.PI / steps
            val r = baseRadius + amplitude * kotlin.math.cos(petals * angle).toFloat()
            val x = cx + size.width * r * kotlin.math.cos(angle).toFloat()
            val y = cy + size.height * r * kotlin.math.sin(angle).toFloat()
            if (i == 0) moveTo(x, y) else lineTo(x, y)
        }
        close()
    }
}
```

---

## 5. Shape Morphing Rules
- **Allowed Components:**
  - `LoadingIndicator`: Continuously loops through 7 distinct shapes via path interpolation.
  - `ButtonGroup`: Standard button groups morph selected buttons between square and round on state toggle.
- **Forbidden:** Never apply animated shape morphing to cards or containers that enclose dense body text, tables, or active text fields.

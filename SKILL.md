---
name: m3-expressive
description: "Production-grade Material 3 Expressive (M3X) design and engineering skill. Provides authoritative tokens, motion physics, 10-step corner radius scale, 35 official expressive shapes, and clean Flutter/Compose/Web code templates. Zero AI slop, no bureaucratic output shells, and strictly usability-first."
---

# Material 3 Expressive (M3-Pro) Engineering & Design Guide

Material 3 Expressive is the usability-driven evolution of Google Material Design 3. Based on Google's largest research initiative (46 studies, 18,000+ participants), its purpose is **not decorative styling or visual noise**, but **accelerating visual findability by up to 4x** and guiding user attention through disciplined visual hierarchy.

This skill equips agents with the exact tokens, mathematical formulas, physical motion parameters, and platform implementations (Jetpack Compose and Web CSS) required to build genuine Material 3 Expressive interfaces without falling into AI slop.

---

## 1. Absolute Anti-Slop Directive

Reject and forbid these patterns in all generated code and UI:

1. **Never print "Material 3" or "Expressive" on the UI:**
   - Real applications display user-facing business nouns and actions ("Search", "Filter", "Recent trips", "Export").
   - Putting "M3", "M3 Expressive Edition", or "Material 3 Engine" as logos, headers, or subtitles is AI slop.
2. **No bureaucratic output shells:**
   - Deliver clean, production-grade, compile-ready code and concise technical rationale.
   - Never output boilerplate inspection templates (such as copying "Intensity level: Foundational", "WindowSizeClass: Compact", or regurgitating the user's prompt).
3. **No landing page disease on utility tools:**
   - Utility screens (forms, tables, image editors, data logs, settings) must never be wrapped in marketing landing page scaffolding (such as hero shield badges, centered H1 slogans with gradient words, or 3-card feature showcases).
   - Get straight to the user's primary interactive canvas or functional layout.
4. **No hardcoded default purple:**
   - Never hardcode `#6750A4` or Google sample blues (`#0B57D0`) arbitrarily.
   - Always derive palettes dynamically from semantic tokens (`primary`, `surface-container-high`, etc.) or contextual product themes.
5. **No universal pill or rounded card spam:**
   - Not every container is a card; not every button is a pill. Shape contrast requires square shapes next to rounded shapes to generate visual tension.
6. **No screen header icon gimmicks:**
   - Professional dashboards and utility screens rely on **Pure Typography** (`Headline Medium/Large` + `Body Medium` subtitle), left-aligned and clean. Never slap oversized novelty badges or decorative cookies beside the primary screen `h1`.
7. **Ambient graphics & vector discipline:**
   - Background vectors and ambient layers must remain strictly secondary (`opacity: 0.08 - 0.20`), preserving immediate contrast and legibility of primary data.
   - Anchor continuous flow paths and silhouettes cleanly to container edges (`overflow: hidden`) rather than floating abruptly within content areas.
   - Bind all vector assets to semantic theme tokens (`currentColor` or CSS variables) so they adapt automatically across themes.

8. **Never leak prompts, technical jargon, or tutorials into UI copywriting:**
   - Real products use concise, functional domain labels ("Theme", "Primary color", "Filter by date", "Export").
   - Putting prompt instructions, engine explanations, or technical lectures on UI labels (such as "HCT Seed Color: Change 1 variable to generate the entire theme like Material Theme Builder", "Optimized with 5-tier Surface Algorithm", or "Click here to test dynamic color generation") is classic AI slop.
   - UI text must always be strictly user-facing, professional, and minimal.

---

## 2. Seven Core Expressive Tactics

Every expressive element must serve one of Google's seven core tactics:

1. **Shape Tension:** Contrast square and organic shapes (from the 35-shape catalog) to create visual tension and break monotony.
2. **Nuanced Color:** Anchor backgrounds with the 5-tier Surface Container system; use primary/tertiary accents exclusively on high-priority targets.
3. **Emphasized Typography:** Employ the Emphasized Typescale (increased weight/width) for key editorial headers and active selection states.
4. **Prioritized Containment:** Enclose related items in semantic containers; grant the largest surface and highest tonal contrast to the primary task.
5. **Fluid Motion Springs:** Separate **spatial springs** (overshoot allowed for position/scale/shape) from **effects springs** (strictly zero overshoot for color/opacity).
6. **Adaptive Flexibility:** Reposition and reflow components cleanly across Compact, Medium, and Expanded window size classes.
7. **Hero Moments (Strictly 1-2 per product):** Concentrate combined tactics (shape + motion + color + type) on at most 1 or 2 focal points across the whole application. If everything is hero, nothing is hero.

---

## 3. Platform Architecture

### Android (Compose-First)
Google's official stance: *Material Android is Compose-first. MDC-Android Views is in maintenance mode.*
- Rely on Jetpack Compose `MaterialTheme`, `ColorScheme`, and `Shapes`.
- Floating toolbars use `height = 64.dp`, `shape = RoundedCornerShape(32.dp)` (Extra-large-increased).
- Connected button groups replace segmented buttons with a `2.dp` internal gap.
- Shape morphing is applied to `LoadingIndicator` and `ButtonGroup`.

### Mobile Cross-Platform (Flutter Material 3)
- Use `useMaterial3: true` with complete 5-tier `ColorScheme` mapping (`surfaceContainerLowest` through `surfaceContainerHighest`).
- Strict component styling: Zero elevation cards with `outlineVariant` border, pill search bars (56dp), and custom Expressive floating toolbars.

### Web (CSS Tokens & Modern Standards)
- Root CSS custom properties declare the 5 surface container tiers and 10 corner radius tokens.
- One-variable dynamic theming engine powered by Google `@material/material-color-utilities` (single Source Color / Seed dynamically recalculates entire 35-token system).
- Motion springs map to official cubic-bezier transition curves.
- Semantic HTML elements (`<nav>`, `<header>`, `<main>`, `<dialog>`) with full keyboard accessibility.

---

## 4. Multi-Platform Design Tokens

A centralized token catalog ready for instant import or copy-paste:
- [tokens/tokens.json](file:///d:/Project/Material%203/m3-pro/tokens/tokens.json): Standard W3C Design Tokens JSON format.
- [tokens/tokens.css](file:///d:/Project/Material%203/m3-pro/tokens/tokens.css): Pure CSS root custom properties with Light and Dark mode variables.
- [tokens/Tokens.kt](file:///d:/Project/Material%203/m3-pro/tokens/Tokens.kt): Jetpack Compose constants (dimensions, shapes, durations, cubic-bezier).
- [tokens/tokens.dart](file:///d:/Project/Material%203/m3-pro/tokens/tokens.dart): Flutter M3Tokens constants (BorderRadius, Duration, Cubic, TouchTarget).

---

## 5. Reference Library Map

Navigate into specialized references for precise specifications:

- [anti-patterns.md](file:///d:/Project/Material%203/m3-pro/references/anti-patterns.md): Exhaustive catalog of design mistakes, AI slop markers, and corrective rules.
- [component-specs.md](file:///d:/Project/Material%203/m3-pro/references/component-specs.md): Authoritative physical metrics (heights, touch targets 48dp, paddings, state layer opacities).
- [screen-archetypes.md](file:///d:/Project/Material%203/m3-pro/references/screen-archetypes.md): Blueprints for Anti-slop Landing Pages, Analytics Dashboards, Form/Settings flows, List/Master-Detail, and Adaptive Scaffolds.
- [color-system.md](file:///d:/Project/Material%203/m3-pro/references/color-system.md): 5-tier surface containers, HCT color space, tonal contrast levels, and dynamic color logic.
- [corner-radius-and-shapes.md](file:///d:/Project/Material%203/m3-pro/references/corner-radius-and-shapes.md): The official 10-step scale (including 20dp, 32dp, 48dp), nesting math formula (`inner = outer - padding`), and the 35 official Figma shapes.
- [motion-physics.md](file:///d:/Project/Material%203/m3-pro/references/motion-physics.md): Spatial vs effects spring dynamics, damping, stiffness, and Web cubic-bezier equivalents.
- [typography.md](file:///d:/Project/Material%203/m3-pro/references/typography.md): Baseline vs emphasized typescales, variable font axes, and language line-height rules (including Vietnamese +7% clearance).
- [component-catalog.md](file:///d:/Project/Material%203/m3-pro/references/component-catalog.md): Specifications for all 14 new and updated M3 Expressive components.
- [responsive-adaptive.md](file:///d:/Project/Material%203/m3-pro/references/responsive-adaptive.md): Window size classes, canonical layouts, and foldable/tablet ergonomics.

---

## 6. Working Examples

Refer to verified, compile-ready code templates:
- [examples/flutter/](file:///d:/Project/Material%203/m3-pro/examples/flutter/): Complete Flutter setup: `theme.dart` (ThemeData with 5-tier containers), `components.dart` (M3MetricCard, M3FloatingToolbar, M3ConnectedButtonGroup, M3SearchBarPill), plus full reference screens for mobile (`mobile_dashboard.dart`) and adaptive desktop (`desktop_dashboard.dart`).
- [examples/compose/](file:///d:/Project/Material%203/m3-pro/examples/compose/): Jetpack Compose implementations of 35 expressive shapes (`Shapes.kt`), custom organic panels and floating toolbars (`Components.kt`), dynamic theming (`Theme.kt`), and a full telemetry dashboard screen (`DashboardScreen.kt`).
- [examples/web/](file:///d:/Project/Material%203/m3-pro/examples/web/): Production CSS design tokens (`tokens.css`), component styles (`components.css`), clean transparent watermarks (`assets/`), and interactive demo showcase (`index.html`).

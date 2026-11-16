# Material 3 Expressive Motion Physics

Material 3 Expressive replaces legacy duration-and-easing curves with a unified **Spring Physics System**. Springs provide natural, momentum-preserving responses to user touch, velocity, and interruption.

---

## 1. Physics Fundamentals: Springs

Spring behavior is governed by three physical variables:
- **Stiffness:** How rapidly the spring snaps toward its target.
- **Damping Ratio:** The rate at which oscillations decay.
  - $\zeta < 1.0$ (Underdamped): Allows subtle overshoot/bounce.
  - $\zeta = 1.0$ (Critically damped): Approaches the target in minimum time without overshooting.
- **Velocity:** Carries forward continuous momentum from touch gestures.

---

## 2. Spatial Springs vs Effects Springs

Google establishes a strict functional demarcation between spatial and effects animations:

| Dimension | Spatial Springs | Effects Springs |
|---|---|---|
| **Animated Properties** | X/Y translation, width/height, scale, rotation, corner radius, shape morph | Color transitions, opacity/alpha fades, surface tints, shadow blur |
| **Overshoot Behavior** | **Allowed and encouraged:** Soft overshoot conveys physical mass and tactile feedback. | **Strictly forbidden:** Must be critically damped ($\zeta = 1.0$). Overshooting color causes flashing and perceived glitches. |
| **Token Family** | `md.sys.motion.spring.*.spatial` | `md.sys.motion.spring.*.effects` |

---

## 3. Speed Tiers & Semantic Allocation

Both spatial and effects springs are categorized into three speeds:

| Speed | Duration Target | Spatial Applications | Effects Applications |
|---|---|---|---|
| **Fast** | 150ms – 350ms | Switches, icon buttons, checkboxes, micro-interactions | Button hover/pressed color change, switch thumb tint |
| **Default** | 200ms – 500ms | Bottom sheets, expanded navigation rails, floating toolbars, dialogs | Opacity of modal scrims, cross-fades within content panels |
| **Slow** | 300ms – 650ms | Full-screen page transitions, shared element transitions | Full-screen refresh fades, theme switching transitions |

---

## 4. Web CSS Conversion Specifications

Because native Web CSS does not have built-in spring solvers, Google established official cubic-bezier approximations that replicate the physical deceleration profiles:

### 4.1. Expressive Scheme (The Recommended Default)

```css
:root {
  /* Spatial Springs (Overshoot enabled) */
  --md-sys-motion-spring-fast-spatial: cubic-bezier(0.42, 1.67, 0.21, 0.90);
  --md-sys-motion-spring-fast-spatial-duration: 350ms;

  --md-sys-motion-spring-default-spatial: cubic-bezier(0.38, 1.21, 0.22, 1.00);
  --md-sys-motion-spring-default-spatial-duration: 500ms;

  --md-sys-motion-spring-slow-spatial: cubic-bezier(0.39, 1.29, 0.35, 0.98);
  --md-sys-motion-spring-slow-spatial-duration: 650ms;

  /* Effects Springs (Zero overshoot, critically damped) */
  --md-sys-motion-spring-fast-effects: cubic-bezier(0.31, 0.94, 0.34, 1.00);
  --md-sys-motion-spring-fast-effects-duration: 150ms;

  --md-sys-motion-spring-default-effects: cubic-bezier(0.34, 0.80, 0.34, 1.00);
  --md-sys-motion-spring-default-effects-duration: 200ms;

  --md-sys-motion-spring-slow-effects: cubic-bezier(0.34, 0.88, 0.34, 1.00);
  --md-sys-motion-spring-slow-effects-duration: 300ms;
}
```

### 4.2. Standard Scheme (Utility / Dense Data)

```css
:root {
  /* Standard Spatial */
  --md-sys-motion-spring-standard-fast-spatial: cubic-bezier(0.27, 1.06, 0.18, 1.00); /* 350ms */
  --md-sys-motion-spring-standard-default-spatial: cubic-bezier(0.27, 1.06, 0.18, 1.00); /* 500ms */
  --md-sys-motion-spring-standard-slow-spatial: cubic-bezier(0.27, 1.06, 0.18, 1.00); /* 750ms */

  /* Standard Effects */
  --md-sys-motion-spring-standard-fast-effects: cubic-bezier(0.31, 0.94, 0.34, 1.00); /* 150ms */
  --md-sys-motion-spring-standard-default-effects: cubic-bezier(0.34, 0.80, 0.34, 1.00); /* 200ms */
  --md-sys-motion-spring-standard-slow-effects: cubic-bezier(0.34, 0.88, 0.34, 1.00); /* 300ms */
}
```

---

## 5. Reduced Motion Compliance

Whenever a user enables reduced motion in their OS or browser, disable spatial translation and scale springs, replacing them with subtle, instantaneous cross-fades:

```css
@media (prefers-reduced-motion: reduce) {
  *, ::before, ::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

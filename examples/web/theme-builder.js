/**
 * Material 3 Expressive Dynamic Theming Engine
 * Powered by Google @material/material-color-utilities
 * Allows changing a single Source Color (Seed) to dynamically restyle the entire application.
 */
(function() {
  function initThemeEngine() {
    const MCU = window.MaterialColorUtilities;
    if (!MCU) {
      console.warn('MaterialColorUtilities library not yet loaded, retrying in 50ms...');
      setTimeout(initThemeEngine, 50);
      return;
    }

    const { argbFromHex, hexFromArgb, Hct, SchemeTonalSpot } = MCU;

    window.applyDynamicTheme = function(sourceHex, isDark = false) {
      try {
        const sourceHct = Hct.fromInt(argbFromHex(sourceHex));
        const scheme = new SchemeTonalSpot(sourceHct, isDark, 0);
        const root = document.documentElement;

        const tokenMap = {
          '--md-sys-color-primary': hexFromArgb(scheme.primary),
          '--md-sys-color-on-primary': hexFromArgb(scheme.onPrimary),
          '--md-sys-color-primary-container': hexFromArgb(scheme.primaryContainer),
          '--md-sys-color-on-primary-container': hexFromArgb(scheme.onPrimaryContainer),

          '--md-sys-color-secondary': hexFromArgb(scheme.secondary),
          '--md-sys-color-on-secondary': hexFromArgb(scheme.onSecondary),
          '--md-sys-color-secondary-container': hexFromArgb(scheme.secondaryContainer),
          '--md-sys-color-on-secondary-container': hexFromArgb(scheme.onSecondaryContainer),

          '--md-sys-color-tertiary': hexFromArgb(scheme.tertiary),
          '--md-sys-color-on-tertiary': hexFromArgb(scheme.onTertiary),
          '--md-sys-color-tertiary-container': hexFromArgb(scheme.tertiaryContainer),
          '--md-sys-color-on-tertiary-container': hexFromArgb(scheme.onTertiaryContainer),

          '--md-sys-color-surface': hexFromArgb(scheme.surface),
          '--md-sys-color-surface-dim': hexFromArgb(scheme.surfaceDim),
          '--md-sys-color-surface-bright': hexFromArgb(scheme.surfaceBright),
          '--md-sys-color-surface-container-lowest': hexFromArgb(scheme.surfaceContainerLowest),
          '--md-sys-color-surface-container-low': hexFromArgb(scheme.surfaceContainerLow),
          '--md-sys-color-surface-container': hexFromArgb(scheme.surfaceContainer),
          '--md-sys-color-surface-container-high': hexFromArgb(scheme.surfaceContainerHigh),
          '--md-sys-color-surface-container-highest': hexFromArgb(scheme.surfaceContainerHighest),

          '--md-sys-color-on-surface': hexFromArgb(scheme.onSurface),
          '--md-sys-color-on-surface-variant': hexFromArgb(scheme.onSurfaceVariant),
          '--md-sys-color-outline': hexFromArgb(scheme.outline),
          '--md-sys-color-outline-variant': hexFromArgb(scheme.outlineVariant)
        };

        for (const [key, value] of Object.entries(tokenMap)) {
          root.style.setProperty(key, value);
        }

        // Dynamically tint ambient background waves
        const wave1 = document.querySelector('.bg-wave-top-right path:first-child');
        const wave2 = document.querySelector('.bg-wave-top-right path:last-child');
        const wave3 = document.querySelector('.bg-wave-left path');
        const wave4 = document.querySelector('.bg-wave-bottom-right path');
        if (wave1) wave1.setAttribute('fill', tokenMap['--md-sys-color-surface-container-high']);
        if (wave2) wave2.setAttribute('fill', tokenMap['--md-sys-color-primary-container']);
        if (wave3) wave3.setAttribute('fill', tokenMap['--md-sys-color-surface-container']);
        if (wave4) wave4.setAttribute('fill', tokenMap['--md-sys-color-surface-container-low']);

        // Update UI displays
        const hexDisplay = document.getElementById('hexCodeDisplay');
        if (hexDisplay) hexDisplay.textContent = sourceHex.toUpperCase();
        const colorInput = document.getElementById('sourceColorInput');
        if (colorInput && colorInput.value.toLowerCase() !== sourceHex.toLowerCase()) {
          colorInput.value = sourceHex;
        }
      } catch (err) {
        console.error('Error applying dynamic theme:', err);
      }
    };

    // Attach click and input listeners
    const chips = document.querySelectorAll('.theme-chip-btn');
    chips.forEach(chip => {
      chip.addEventListener('click', () => {
        chips.forEach(c => c.classList.remove('active'));
        chip.classList.add('active');
        const color = chip.getAttribute('data-color');
        window.applyDynamicTheme(color);
      });
    });

    const customInput = document.getElementById('sourceColorInput');
    if (customInput) {
      customInput.addEventListener('input', (e) => {
        chips.forEach(c => c.classList.remove('active'));
        window.applyDynamicTheme(e.target.value);
      });
    }

    // Default initialization: Soft Olive (Xanh reu) #4C662B
    window.applyDynamicTheme('#4C662B');
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initThemeEngine);
  } else {
    initThemeEngine();
  }
})();

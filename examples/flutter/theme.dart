import 'package:flutter/material.dart';

/// Material Design 3 (M3 Expressive) - Production-ready ThemeData setup
abstract final class M3AppTheme {
  // Light Color Scheme with all 5 Surface Container roles
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006C4C),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF89F8C7),
    onPrimaryContainer: Color(0xFF002114),
    secondary: Color(0xFF4D6357),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFCFE9D9),
    onSecondaryContainer: Color(0xFF092016),
    tertiary: Color(0xFF3D6373),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFC1E8FB),
    onTertiaryContainer: Color(0xFF001F29),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    surface: Color(0xFFF6FBF6),
    onSurface: Color(0xFF181D1A),
    onSurfaceVariant: Color(0xFF414943),
    outline: Color(0xFF717973),
    outlineVariant: Color(0xFFC0C9C2),
    surfaceDim: Color(0xFFD7DCD8),
    surfaceBright: Color(0xFFF6FBF6),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF0F5F1),
    surfaceContainer: Color(0xFFEBEFEA),
    surfaceContainerHigh: Color(0xFFE5EAE5),
    surfaceContainerHighest: Color(0xFFDFE4DF),
    inverseSurface: Color(0xFF2D322F),
    onInverseSurface: Color(0xFFEEF2ED),
    inversePrimary: Color(0xFF6CDBAC),
  );

  // Dark Color Scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF6CDBAC),
    onPrimary: Color(0xFF003825),
    primaryContainer: Color(0xFF005138),
    onPrimaryContainer: Color(0xFF89F8C7),
    secondary: Color(0xFFB3CCBE),
    onSecondary: Color(0xFF1F352A),
    secondaryContainer: Color(0xFF354B3F),
    onSecondaryContainer: Color(0xFFCFE9D9),
    tertiary: Color(0xFFA5CDDE),
    onTertiary: Color(0xFF063544),
    tertiaryContainer: Color(0xFF234C5B),
    onTertiaryContainer: Color(0xFFC1E8FB),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: Color(0xFF0F1512),
    onSurface: Color(0xFFDFE4DF),
    onSurfaceVariant: Color(0xFFC0C9C2),
    outline: Color(0xFF8A938C),
    outlineVariant: Color(0xFF414943),
    surfaceDim: Color(0xFF0F1512),
    surfaceBright: Color(0xFF353B37),
    surfaceContainerLowest: Color(0xFF0A0F0D),
    surfaceContainerLow: Color(0xFF181D1A),
    surfaceContainer: Color(0xFF1C211E),
    surfaceContainerHigh: Color(0xFF262B28),
    surfaceContainerHighest: Color(0xFF313633),
    inverseSurface: Color(0xFFDFE4DF),
    onInverseSurface: Color(0xFF2D322F),
    inversePrimary: Color(0xFF006C4C),
  );

  static ThemeData get lightTheme {
    return _buildTheme(lightColorScheme);
  }

  static ThemeData get darkTheme {
    return _buildTheme(darkColorScheme);
  }

  static ThemeData _buildTheme(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      cardTheme: CardTheme(
        elevation: 0,
        color: colorScheme.surfaceContainerLowest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: colorScheme.outlineVariant.withValues(alpha: 0.5), width: 1),
        ),
        margin: EdgeInsets.zero,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(48, 40),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 40),
          shape: const StadiumBorder(),
          side: BorderSide(color: colorScheme.outline, width: 1),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 2,
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHigh,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        backgroundColor: colorScheme.surfaceContainer,
        indicatorColor: colorScheme.secondaryContainer,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: colorScheme.onSurface);
          }
          return TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant);
        }),
      ),
    );
  }
}

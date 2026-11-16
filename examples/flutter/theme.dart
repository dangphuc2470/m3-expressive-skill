import 'package:flutter/material.dart';

/// Material Design 3 (M3 Expressive) - Production-ready ThemeData setup
/// Seed Color: #63A002 (Calculated via Google Material Color Utilities HCT)
abstract final class M3AppTheme {
  // Light Color Scheme with all 5 Surface Container roles
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF3F6900),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFB2F65F),
    onPrimaryContainer: Color(0xFF102000),
    secondary: Color(0xFF586249),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFDCE7C8),
    onSecondaryContainer: Color(0xFF151E0B),
    tertiary: Color(0xFF386663),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFBCECE7),
    onTertiaryContainer: Color(0xFF00201E),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    surface: Color(0xFFFDFCF5),
    onSurface: Color(0xFF1B1C18),
    onSurfaceVariant: Color(0xFF44483D),
    outline: Color(0xFF75796C),
    outlineVariant: Color(0xFFC5C8BA),
    surfaceDim: Color(0xFFDDDED6),
    surfaceBright: Color(0xFFFDFCF5),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF7F7EF),
    surfaceContainer: Color(0xFFF2F1E9),
    surfaceContainerHigh: Color(0xFFECECE3),
    surfaceContainerHighest: Color(0xFFE6E6DE),
    inverseSurface: Color(0xFF30312C),
    onInverseSurface: Color(0xFFF2F1E9),
    inversePrimary: Color(0xFF97D945),
  );

  // Dark Color Scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF97D945),
    onPrimary: Color(0xFF1F3700),
    primaryContainer: Color(0xFF2F4F00),
    onPrimaryContainer: Color(0xFFB2F65F),
    secondary: Color(0xFFBFCBAD),
    onSecondary: Color(0xFF2A331E),
    secondaryContainer: Color(0xFF404A33),
    onSecondaryContainer: Color(0xFFDCE7C8),
    tertiary: Color(0xFFA0D0CB),
    onTertiary: Color(0xFF003735),
    tertiaryContainer: Color(0xFF1F4E4B),
    onTertiaryContainer: Color(0xFFBCECE7),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: Color(0xFF13140F),
    onSurface: Color(0xFFE3E3DB),
    onSurfaceVariant: Color(0xFFC5C8BA),
    outline: Color(0xFF8F9285),
    outlineVariant: Color(0xFF44483D),
    surfaceDim: Color(0xFF13140F),
    surfaceBright: Color(0xFF3A3A34),
    surfaceContainerLowest: Color(0xFF0E0F0B),
    surfaceContainerLow: Color(0xFF1B1C18),
    surfaceContainer: Color(0xFF1F201B),
    surfaceContainerHigh: Color(0xFF2A2A25),
    surfaceContainerHighest: Color(0xFF353530),
    inverseSurface: Color(0xFFE3E3DB),
    onInverseSurface: Color(0xFF30312C),
    inversePrimary: Color(0xFF3F6900),
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

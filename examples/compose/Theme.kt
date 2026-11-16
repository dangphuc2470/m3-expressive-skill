package com.google.material.expressive.theme

import android.os.Build
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp

/**
 * Botanical Dynamic Theme Scheme (Natural Forest Green tone)
 * Demonstrating semantic color roles without hardcoding default purple.
 */
private val LightBotanicalColorScheme = lightColorScheme(
    primary = Color(0xFF1B6B46),
    onPrimary = Color(0xFFFFFFFF),
    primaryContainer = Color(0xFFA3F2C2),
    onPrimaryContainer = Color(0xFF002111),

    secondary = Color(0xFF4F6354),
    onSecondary = Color(0xFFFFFFFF),
    secondaryContainer = Color(0xFFD2E8D5),
    onSecondaryContainer = Color(0xFF0D1F13),

    tertiary = Color(0xFF3C6472),
    onTertiary = Color(0xFFFFFFFF),
    tertiaryContainer = Color(0xFFBFE9F9),
    onTertiaryContainer = Color(0xFF001F28),

    surface = Color(0xFFF7FBF4),
    onSurface = Color(0xFF181D19),
    surfaceVariant = Color(0xFFDCE5DC),
    onSurfaceVariant = Color(0xFF414942),

    // 5-Tier Surface Containers
    surfaceContainerLowest = Color(0xFFFFFFFF),
    surfaceContainerLow = Color(0xFFF1F5EE),
    surfaceContainer = Color(0xFFEBEFE8),
    surfaceContainerHigh = Color(0xFFE5EAE2),
    surfaceContainerHighest = Color(0xFFDFE4DD),

    outline = Color(0xFF717971),
    outlineVariant = Color(0xFFC0C9BF)
)

private val DarkBotanicalColorScheme = darkColorScheme(
    primary = Color(0xFF88D5A7),
    onPrimary = Color(0xFF003820),
    primaryContainer = Color(0xFF005232),
    onPrimaryContainer = Color(0xFFA3F2C2),

    secondary = Color(0xFFB6CCBA),
    onSecondary = Color(0xFF223528),
    secondaryContainer = Color(0xFF384B3D),
    onSecondaryContainer = Color(0xFFD2E8D5),

    tertiary = Color(0xFFA3CDDC),
    onTertiary = Color(0xFF053542),
    tertiaryContainer = Color(0xFF234C5A),
    onTertiaryContainer = Color(0xFFBFE9F9),

    surface = Color(0xFF101411),
    onSurface = Color(0xFFDFE4DD),
    surfaceVariant = Color(0xFF414942),
    onSurfaceVariant = Color(0xFFC0C9BF),

    // 5-Tier Surface Containers (Dark)
    surfaceContainerLowest = Color(0xFF0B0F0C),
    surfaceContainerLow = Color(0xFF181D19),
    surfaceContainer = Color(0xFF1C211D),
    surfaceContainerHigh = Color(0xFF272B27),
    surfaceContainerHighest = Color(0xFF313631),

    outline = Color(0xFF8B938A),
    outlineVariant = Color(0xFF414942)
)

/**
 * Material 3 Expressive Typography Scale
 * Includes +7% line-height clearance for Vietnamese and complex scripts to prevent diacritic clipping.
 */
val ExpressiveTypography = Typography(
    headlineLarge = TextStyle(
        fontFamily = FontFamily.SansSerif,
        fontWeight = FontWeight.Bold,
        fontSize = 32.sp,
        lineHeight = 44.sp // +10% clearance
    ),
    headlineMedium = TextStyle(
        fontFamily = FontFamily.SansSerif,
        fontWeight = FontWeight.Bold,
        fontSize = 28.sp,
        lineHeight = 38.sp
    ),
    titleLarge = TextStyle(
        fontFamily = FontFamily.SansSerif,
        fontWeight = FontWeight.SemiBold,
        fontSize = 22.sp,
        lineHeight = 30.sp
    ),
    titleMedium = TextStyle(
        fontFamily = FontFamily.SansSerif,
        fontWeight = FontWeight.Bold,
        fontSize = 16.sp,
        lineHeight = 24.sp
    ),
    bodyLarge = TextStyle(
        fontFamily = FontFamily.SansSerif,
        fontWeight = FontWeight.Normal,
        fontSize = 16.sp,
        lineHeight = 24.sp
    ),
    bodyMedium = TextStyle(
        fontFamily = FontFamily.SansSerif,
        fontWeight = FontWeight.Normal,
        fontSize = 14.sp,
        lineHeight = 22.sp
    ),
    labelLarge = TextStyle(
        fontFamily = FontFamily.SansSerif,
        fontWeight = FontWeight.Bold,
        fontSize = 14.sp,
        lineHeight = 20.sp
    )
)

@Composable
fun Material3ExpressiveTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    dynamicColor: Boolean = true,
    content: @Composable () -> Unit
) {
    val context = LocalContext.current
    val colorScheme = when {
        dynamicColor && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S -> {
            if (darkTheme) dynamicDarkColorScheme(context) else dynamicLightColorScheme(context)
        }
        darkTheme -> DarkBotanicalColorScheme
        else -> LightBotanicalColorScheme
    }

    MaterialTheme(
        colorScheme = colorScheme,
        typography = ExpressiveTypography,
        content = content
    )
}

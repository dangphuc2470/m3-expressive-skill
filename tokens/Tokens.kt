package com.example.m3pro.tokens

import androidx.compose.animation.core.CubicBezierEasing
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.ui.unit.dp

/**
 * Material Design 3 (M3 Expressive) - Android Jetpack Compose Tokens
 */
object M3Tokens {
    // Corner Shape Tokens
    val CornerNone = 0.dp
    val CornerExtraSmall = 4.dp
    val CornerSmall = 8.dp
    val CornerMedium = 12.dp
    val CornerLarge = 16.dp
    val CornerExtraLarge = 28.dp
    val CornerFull = 9999.dp

    val ShapeExtraSmall = RoundedCornerShape(CornerExtraSmall)
    val ShapeSmall = RoundedCornerShape(CornerSmall)
    val ShapeMedium = RoundedCornerShape(CornerMedium)
    val ShapeLarge = RoundedCornerShape(CornerLarge)
    val ShapeExtraLarge = RoundedCornerShape(CornerExtraLarge)
    val ShapeFull = RoundedCornerShape(CornerFull)

    // Motion Durations in Milliseconds
    const val DurationShort1 = 50
    const val DurationShort2 = 100
    const val DurationShort3 = 150
    const val DurationShort4 = 200

    const val DurationMedium1 = 250
    const val DurationMedium2 = 300
    const val DurationMedium3 = 350
    const val DurationMedium4 = 400

    const val DurationLong1 = 450
    const val DurationLong2 = 500
    const val DurationLong3 = 550
    const val DurationLong4 = 600

    // Motion Easing Curves
    val EasingEmphasized = CubicBezierEasing(0.2f, 0.0f, 0.0f, 1.0f)
    val EasingEmphasizedDecelerate = CubicBezierEasing(0.05f, 0.7f, 0.1f, 1.0f)
    val EasingEmphasizedAccelerate = CubicBezierEasing(0.3f, 0.0f, 0.8f, 0.15f)
    val EasingStandard = CubicBezierEasing(0.2f, 0.0f, 0.0f, 1.0f)

    // Component Dimensions
    val MinTouchTarget = 48.dp
    val ButtonHeight = 40.dp
    val SearchBarHeight = 56.dp
    val FabSmall = 40.dp
    val FabMedium = 56.dp
    val FabLarge = 96.dp
}

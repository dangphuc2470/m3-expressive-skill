package com.google.material.expressive.shapes

import androidx.compose.foundation.shape.GenericShape
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.Shape
import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin

/**
 * Production-ready Jetpack Compose Shape implementations for the official
 * Material 3 Expressive 35-Shape Catalog (from Google Figma Node 58548:7248).
 */
object ExpressiveShapes {

    /**
     * Generic harmonic rosette generator for Cookie and Clover shapes.
     * @param petals Number of lobes/petals (e.g. 4, 6, 7, 8, 9, 12)
     * @param amplitude Depth of petal indentations
     * @param baseRadius Base circular radius factor
     */
    fun cookie(petals: Int, amplitude: Float = 0.038f, baseRadius: Float = 0.46f): Shape {
        return GenericShape { size, _ ->
            val cx = size.width / 2f
            val cy = size.height / 2f
            val steps = 144
            for (i in 0..steps) {
                val angle = i * 2.0 * PI / steps
                val r = baseRadius + amplitude * cos(petals * angle).toFloat()
                val x = cx + size.width * r * cos(angle).toFloat()
                val y = cy + size.height * r * sin(angle).toFloat()
                if (i == 0) moveTo(x, y) else lineTo(x, y)
            }
            close()
        }
    }

    // --- Official Cookies & Clovers ---
    val Cookie4Sided: Shape = cookie(petals = 4, amplitude = 0.06f, baseRadius = 0.44f)
    val Cookie6Sided: Shape = cookie(petals = 6, amplitude = 0.035f, baseRadius = 0.46f)
    val Cookie7Sided: Shape = cookie(petals = 7, amplitude = 0.035f, baseRadius = 0.46f)
    val Cookie9Sided: Shape = cookie(petals = 9, amplitude = 0.030f, baseRadius = 0.47f)
    val Cookie12Sided: Shape = cookie(petals = 12, amplitude = 0.025f, baseRadius = 0.47f)
    val Clover4Leaf: Shape = cookie(petals = 4, amplitude = 0.09f, baseRadius = 0.41f)
    val Clover8Leaf: Shape = cookie(petals = 8, amplitude = 0.05f, baseRadius = 0.45f)
    val Flower: Shape = cookie(petals = 6, amplitude = 0.10f, baseRadius = 0.40f)

    // --- Official Sunny & Bursts ---
    val Sunny: Shape = cookie(petals = 16, amplitude = 0.04f, baseRadius = 0.46f)
    val VerySunny: Shape = cookie(petals = 24, amplitude = 0.035f, baseRadius = 0.46f)

    val Burst: Shape = GenericShape { size, _ ->
        val cx = size.width / 2f; val cy = size.height / 2f
        val points = 8
        for (i in 0 until points * 2) {
            val angle = i * PI / points
            val r = if (i % 2 == 0) 0.50f else 0.32f
            val x = cx + size.width * r * cos(angle).toFloat()
            val y = cy + size.height * r * sin(angle).toFloat()
            if (i == 0) moveTo(x, y) else lineTo(x, y)
        }
        close()
    }

    // --- Official Playful Shapes ---
    val Heart: Shape = GenericShape { size, _ ->
        val w = size.width; val h = size.height
        moveTo(w * 0.5f, h * 0.85f)
        cubicTo(w * 0.1f, h * 0.6f, 0f, h * 0.35f, 0f, h * 0.2f)
        cubicTo(0f, 0f, w * 0.45f, 0f, w * 0.5f, h * 0.25f)
        cubicTo(w * 0.55f, 0f, w, 0f, w, h * 0.2f)
        cubicTo(w, h * 0.35f, w * 0.9f, h * 0.6f, w * 0.5f, h * 0.85f)
        close()
    }

    val Arch: Shape = GenericShape { size, _ ->
        val w = size.width; val h = size.height
        moveTo(0f, h)
        lineTo(0f, w / 2f)
        cubicTo(0f, 0f, w, 0f, w, w / 2f)
        lineTo(w, h)
        close()
    }

    val Slanted: Shape = GenericShape { size, _ ->
        val w = size.width; val h = size.height
        val offset = w * 0.16f
        moveTo(offset, 0f)
        lineTo(w, 0f)
        lineTo(w - offset, h)
        lineTo(0f, h)
        close()
    }
}

package com.google.material.expressive.components

import androidx.compose.animation.core.*
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.unit.dp

/**
 * Official Material 3 Expressive Floating Toolbar.
 * Specs from Google Figma Node 58295:22726:
 * - Height: 64dp
 * - Outer Corner Radius: 32dp (Extra-large-increased)
 * - Surface Fill: Surface Container
 * - Padding: 12dp vertical, 8dp horizontal
 * - Gap: 4dp
 */
@Composable
fun ExpressiveFloatingToolbar(
    modifier: Modifier = Modifier,
    containerColor: Color = MaterialTheme.colorScheme.surfaceContainer,
    content: @Composable RowScope.() -> Unit
) {
    Surface(
        modifier = modifier
            .height(64.dp)
            .shadow(elevation = 6.dp, shape = RoundedCornerShape(32.dp)),
        shape = RoundedCornerShape(32.dp),
        color = containerColor,
        tonalElevation = 3.dp
    ) {
        Row(
            modifier = Modifier
                .padding(horizontal = 8.dp, vertical = 12.dp),
            horizontalArrangement = Arrangement.spacedBy(4.dp),
            verticalAlignment = Alignment.CenterVertically,
            content = content
        )
    }
}

/**
 * Connected Button Group (Formally replaces deprecated Segmented Button).
 * - Gap: exactly 2dp
 * - Shape: Toggles between square and rounded upon selection
 */
@Composable
fun ConnectedButtonGroup(
    options: List<String>,
    selectedIndex: Int,
    onSelect: (Int) -> Unit,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier
            .clip(RoundedCornerShape(16.dp))
            .background(MaterialTheme.colorScheme.surfaceContainerHigh)
            .padding(2.dp),
        horizontalArrangement = Arrangement.spacedBy(2.dp)
    ) {
        options.forEachIndexed { index, label ->
            val isSelected = index == selectedIndex
            val itemShape = if (isSelected) RoundedCornerShape(12.dp) else RoundedCornerShape(4.dp)
            val bgColor = if (isSelected) MaterialTheme.colorScheme.secondaryContainer else Color.Transparent
            val textColor = if (isSelected) MaterialTheme.colorScheme.onSecondaryContainer else MaterialTheme.colorScheme.onSurfaceVariant

            Box(
                modifier = Modifier
                    .clip(itemShape)
                    .background(bgColor)
                    .clickable { onSelect(index) }
                    .padding(horizontal = 16.dp, vertical = 10.dp),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    text = label,
                    style = MaterialTheme.typography.labelLarge,
                    color = textColor
                )
            }
        }
    }
}

/**
 * Split Button (Primary Action + Trailing Menu Dropdown).
 * - Gap: 2dp
 * - Trailing chevron rotates 180° inwards using standard motion
 */
@Composable
fun ExpressiveSplitButton(
    label: String,
    onPrimaryClick: () -> Unit,
    onMenuToggle: (Boolean) -> Unit,
    isMenuExpanded: Boolean,
    modifier: Modifier = Modifier,
    icon: ImageVector? = null
) {
    val rotation by animateFloatAsState(
        targetValue = if (isMenuExpanded) 180f else 0f,
        animationSpec = tween(durationMillis = 200, easing = FastOutSlowInEasing),
        label = "SplitButtonChevron"
    )

    Row(
        modifier = modifier,
        horizontalArrangement = Arrangement.spacedBy(2.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Button(
            onClick = onPrimaryClick,
            shape = RoundedCornerShape(topStart = 20.dp, bottomStart = 20.dp, topEnd = 4.dp, bottomEnd = 4.dp),
            contentPadding = PaddingValues(horizontal = 16.dp, vertical = 10.dp)
        ) {
            if (icon != null) {
                Icon(icon, contentDescription = null, modifier = Modifier.size(18.dp))
                Spacer(Modifier.width(8.dp))
            }
            Text(label)
        }

        FilledTonalIconButton(
            onClick = { onMenuToggle(!isMenuExpanded) },
            shape = RoundedCornerShape(topStart = 4.dp, bottomStart = 4.dp, topEnd = 20.dp, bottomEnd = 20.dp),
            modifier = Modifier.size(40.dp)
        ) {
            Icon(
                imageVector = Icons.Default.ArrowDropDown,
                contentDescription = "Expand options",
                modifier = Modifier.rotate(rotation)
            )
        }
    }
}

/**
 * Expressive Panel Container with optional subtle organic canvas background ornament.
 */
@Composable
fun ExpressivePanel(
    modifier: Modifier = Modifier,
    containerColor: Color = MaterialTheme.colorScheme.surfaceContainer,
    tonal: Boolean = false,
    content: @Composable ColumnScope.() -> Unit
) {
    Surface(
        modifier = modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(28.dp)),
        color = if (tonal) MaterialTheme.colorScheme.surfaceContainerHigh else containerColor,
        shape = RoundedCornerShape(28.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(20.dp),
            content = content
        )
    }
}

package com.google.material.expressive.screens

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.DirectionsCar
import androidx.compose.material.icons.filled.Download
import androidx.compose.material.icons.filled.Map
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material.icons.filled.Search
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material.icons.filled.Speed
import androidx.compose.material.icons.filled.Watch
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.CornerRadius
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.StrokeCap
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.google.material.expressive.components.ConnectedButtonGroup
import com.google.material.expressive.components.ExpressiveFloatingToolbar
import com.google.material.expressive.components.ExpressiveSplitButton
import com.google.material.expressive.theme.Material3ExpressiveTheme

data class TripLogRecord(
    val timestamp: String,
    val origin: String,
    val destination: String,
    val status: String,
    val isSynced: Boolean
)

private val sampleTrips = listOf(
    TripLogRecord("07:15:22", "Hang Xanh Junction, Binh Thanh", "Hi-Tech Park, Thu Duc", "Synced", true),
    TripLogRecord("12:30:45", "Ben Luc Bridge, Long An", "Cai Rang Floating Market", "Synced", true),
    TripLogRecord("18:05:10", "An Lac Roundabout, Binh Tan", "Ba Tri Fishing Port, Ben Tre", "Streaming", false)
)

@Composable
fun NavigationDashboardScreen() {
    var selectedFilterIndex by remember { mutableIntStateOf(0) }
    var isExportMenuOpen by remember { mutableStateOf(false) }
    var activeToolbarIndex by remember { mutableIntStateOf(0) }

    val filteredTrips = remember(selectedFilterIndex) {
        when (selectedFilterIndex) {
            1 -> sampleTrips.filter { !it.isSynced }
            2 -> sampleTrips.filter { it.isSynced }
            else -> sampleTrips
        }
    }

    Scaffold(
        containerColor = MaterialTheme.colorScheme.surface
    ) { innerPadding ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(innerPadding)
        ) {
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                contentPadding = PaddingValues(
                    start = 20.dp,
                    end = 20.dp,
                    top = 24.dp,
                    bottom = 112.dp
                ),
                verticalArrangement = Arrangement.spacedBy(20.dp)
            ) {
                // Pure Typography Header + Split Action
                item {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column(modifier = Modifier.weight(1f)) {
                            Text(
                                text = "Navigation Telemetry",
                                style = MaterialTheme.typography.headlineMedium,
                                color = MaterialTheme.colorScheme.onSurface
                            )
                            Spacer(modifier = Modifier.height(4.dp))
                            Text(
                                text = "Live Connect IQ sync and route diagnostics",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                        Spacer(modifier = Modifier.width(12.dp))
                        ExpressiveSplitButton(
                            label = "Export GPX",
                            icon = Icons.Default.Download,
                            onPrimaryClick = {},
                            onMenuToggle = { isExportMenuOpen = it },
                            isMenuExpanded = isExportMenuOpen
                        )
                    }
                }

                // Telemetry KPI Cards
                item {
                    Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                        TelemetryMetricCard(
                            label = "CUMULATIVE DISTANCE",
                            value = "42.8",
                            unit = "km",
                            icon = Icons.Default.DirectionsCar,
                            ambientPainterType = AmbientType.PATH_FLOW
                        )
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(12.dp)
                        ) {
                            TelemetryMetricCard(
                                label = "AVG SPEED",
                                value = "26.4",
                                unit = "km/h",
                                icon = Icons.Default.Speed,
                                ambientPainterType = AmbientType.WIND_SWEEP,
                                modifier = Modifier.weight(1f)
                            )
                            TelemetryMetricCard(
                                label = "PACKET LATENCY",
                                value = "120",
                                unit = "ms",
                                icon = Icons.Default.Watch,
                                ambientPainterType = AmbientType.SIGNAL_BARS,
                                modifier = Modifier.weight(1f)
                            )
                        }
                    }
                }

                // Filter Controls
                item {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        ConnectedButtonGroup(
                            options = listOf("All trips", "Active", "Synced"),
                            selectedIndex = selectedFilterIndex,
                            onSelect = { selectedFilterIndex = it }
                        )
                        Text(
                            text = "${filteredTrips.size} items",
                            style = MaterialTheme.typography.labelMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }

                // Trip History Container
                item {
                    Surface(
                        color = MaterialTheme.colorScheme.surfaceContainerLowest,
                        shape = RoundedCornerShape(20.dp),
                        tonalElevation = 1.dp,
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Column(modifier = Modifier.fillMaxWidth()) {
                            filteredTrips.forEachIndexed { index, trip ->
                                TripLogRow(trip = trip)
                                if (index < filteredTrips.lastIndex) {
                                    HorizontalDivider(
                                        color = MaterialTheme.colorScheme.outlineVariant.copy(alpha = 0.45f),
                                        modifier = Modifier.padding(horizontal = 16.dp)
                                    )
                                }
                            }
                        }
                    }
                }
            }

            // Floating Action Toolbar anchored at bottom center
            ExpressiveFloatingToolbar(
                modifier = Modifier
                    .align(Alignment.BottomCenter)
                    .padding(bottom = 24.dp),
                containerColor = MaterialTheme.colorScheme.surfaceContainerHigh
            ) {
                val navIcons = listOf(
                    Icons.Default.Map to "Map",
                    Icons.Default.Search to "Search",
                    Icons.Default.Refresh to "Sync",
                    Icons.Default.Settings to "Settings"
                )
                navIcons.forEachIndexed { index, (icon, desc) ->
                    val isSelected = activeToolbarIndex == index
                    FilledIconButton(
                        onClick = { activeToolbarIndex = index },
                        colors = IconButtonDefaults.filledIconButtonColors(
                            containerColor = if (isSelected) MaterialTheme.colorScheme.primaryContainer else Color.Transparent,
                            contentColor = if (isSelected) MaterialTheme.colorScheme.onPrimaryContainer else MaterialTheme.colorScheme.onSurfaceVariant
                        ),
                        modifier = Modifier.size(44.dp)
                    ) {
                        Icon(icon, contentDescription = desc, modifier = Modifier.size(20.dp))
                    }
                }
            }
        }
    }
}

private enum class AmbientType {
    PATH_FLOW,
    WIND_SWEEP,
    SIGNAL_BARS
}

@Composable
private fun TelemetryMetricCard(
    label: String,
    value: String,
    unit: String,
    icon: ImageVector,
    ambientPainterType: AmbientType,
    modifier: Modifier = Modifier
) {
    val primaryColor = MaterialTheme.colorScheme.primary
    val containerAccent = MaterialTheme.colorScheme.primaryContainer

    Surface(
        modifier = modifier
            .fillMaxWidth()
            .height(132.dp)
            .clip(RoundedCornerShape(24.dp)),
        color = MaterialTheme.colorScheme.surfaceContainerLow,
        shape = RoundedCornerShape(24.dp)
    ) {
        Box(modifier = Modifier.fillMaxSize()) {
            // Ambient Background Vector strictly anchored to container boundaries
            Canvas(modifier = Modifier.fillMaxSize()) {
                val w = size.width
                val h = size.height

                when (ambientPainterType) {
                    AmbientType.PATH_FLOW -> {
                        val hillPath = Path().apply {
                            moveTo(w * 0.42f, h)
                            cubicTo(w * 0.56f, h * 0.25f, w * 0.80f, 0f, w, 0f)
                            lineTo(w, h)
                            close()
                        }
                        drawPath(hillPath, color = containerAccent.copy(alpha = 0.25f))

                        val roadPath = Path().apply {
                            moveTo(w * 0.52f, h)
                            cubicTo(w * 0.65f, h * 0.72f, w * 0.88f, h * 0.78f, w * 0.85f, h * 0.58f)
                            cubicTo(w * 0.82f, h * 0.42f, w * 0.66f, h * 0.36f, w * 0.74f, h * 0.24f)
                            cubicTo(w * 0.80f, h * 0.14f, w * 0.92f, h * 0.16f, w, h * 0.16f)
                        }
                        drawPath(
                            path = roadPath,
                            color = primaryColor.copy(alpha = 0.16f),
                            style = Stroke(width = 18.dp.toPx(), cap = StrokeCap.Round)
                        )
                    }
                    AmbientType.WIND_SWEEP -> {
                        val swoosh1 = Path().apply {
                            moveTo(w * 0.45f, h * 0.48f)
                            cubicTo(w * 0.68f, h * 0.52f, w * 0.82f, h * 0.28f, w, h * 0.22f)
                        }
                        val swoosh2 = Path().apply {
                            moveTo(w * 0.56f, h * 0.72f)
                            cubicTo(w * 0.75f, h * 0.74f, w * 0.86f, h * 0.56f, w, h * 0.52f)
                        }
                        drawPath(swoosh1, color = primaryColor.copy(alpha = 0.14f), style = Stroke(width = 8.dp.toPx(), cap = StrokeCap.Round))
                        drawPath(swoosh2, color = primaryColor.copy(alpha = 0.10f), style = Stroke(width = 6.dp.toPx(), cap = StrokeCap.Round))
                    }
                    AmbientType.SIGNAL_BARS -> {
                        val barCount = 4
                        val barWidth = 8.dp.toPx()
                        val gap = 6.dp.toPx()
                        val startX = w - (barCount * (barWidth + gap)) - 14.dp.toPx()
                        for (i in 0 until barCount) {
                            val barHeight = (16 + i * 14).dp.toPx()
                            drawRoundRect(
                                color = primaryColor.copy(alpha = 0.12f + i * 0.03f),
                                topLeft = Offset(startX + i * (barWidth + gap), h - barHeight - 12.dp.toPx()),
                                size = Size(barWidth, barHeight),
                                cornerRadius = CornerRadius(4.dp.toPx(), 4.dp.toPx())
                            )
                        }
                    }
                }
            }

            // Foreground Typography & Icon
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(18.dp),
                verticalArrangement = Arrangement.SpaceBetween
            ) {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Box(
                        modifier = Modifier
                            .size(28.dp)
                            .clip(CircleShape)
                            .background(MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.6f)),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = icon,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.onPrimaryContainer,
                            modifier = Modifier.size(16.dp)
                        )
                    }
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        text = label,
                        style = MaterialTheme.typography.labelMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }

                Row(verticalAlignment = Alignment.Bottom) {
                    Text(
                        text = value,
                        style = MaterialTheme.typography.headlineMedium.copy(fontWeight = FontWeight.Bold),
                        color = MaterialTheme.colorScheme.onSurface
                    )
                    Spacer(modifier = Modifier.width(4.dp))
                    Text(
                        text = unit,
                        style = MaterialTheme.typography.titleSmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        modifier = Modifier.padding(bottom = 4.dp)
                    )
                }
            }
        }
    }
}

@Composable
private fun TripLogRow(trip: TripLogRecord) {
    val badgeBg = if (trip.isSynced) {
        MaterialTheme.colorScheme.primaryContainer
    } else {
        MaterialTheme.colorScheme.tertiaryContainer
    }
    val badgeText = if (trip.isSynced) {
        MaterialTheme.colorScheme.onPrimaryContainer
    } else {
        MaterialTheme.colorScheme.onTertiaryContainer
    }

    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp, vertical = 14.dp),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = "${trip.origin} -> ${trip.destination}",
                style = MaterialTheme.typography.bodyMedium.copy(fontWeight = FontWeight.Medium),
                color = MaterialTheme.colorScheme.onSurface,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
            Spacer(modifier = Modifier.height(2.dp))
            Text(
                text = trip.timestamp,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
        Spacer(modifier = Modifier.width(12.dp))
        Surface(
            color = badgeBg,
            shape = CircleShape
        ) {
            Text(
                text = trip.status,
                style = MaterialTheme.typography.labelSmall.copy(fontWeight = FontWeight.SemiBold),
                color = badgeText,
                modifier = Modifier.padding(horizontal = 10.dp, vertical = 4.dp)
            )
        }
    }
}

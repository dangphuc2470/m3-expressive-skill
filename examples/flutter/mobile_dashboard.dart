import 'package:flutter/material.dart';
import 'components.dart';
import 'theme.dart';

/// Material 3 Expressive - Mobile Reference Screen
/// Domain: Navigation Telemetry & Garmin Sync Logs
class NavigationMobileDashboard extends StatefulWidget {
  const NavigationMobileDashboard({super.key});

  @override
  State<NavigationMobileDashboard> createState() => _NavigationMobileDashboardState();
}

class _NavigationMobileDashboardState extends State<NavigationMobileDashboard> {
  int _selectedFilter = 0;
  int _activeNavIndex = 0;

  static const _trips = [
    _TripRecord(
      timestamp: '07:15:22',
      origin: 'Hang Xanh Junction, Binh Thanh',
      destination: 'Hi-Tech Park, Thu Duc',
      status: 'Synced',
      isSynced: true,
    ),
    _TripRecord(
      timestamp: '12:30:45',
      origin: 'Ben Luc Bridge, Long An',
      destination: 'Cai Rang Floating Market',
      status: 'Synced',
      isSynced: true,
    ),
    _TripRecord(
      timestamp: '18:05:10',
      origin: 'An Lac Roundabout, Binh Tan',
      destination: 'Ba Tri Fishing Port, Ben Tre',
      status: 'Streaming',
      isSynced: false,
    ),
  ];

  List<_TripRecord> get _filteredTrips {
    if (_selectedFilter == 1) return _trips.where((t) => !t.isSynced).toList();
    if (_selectedFilter == 2) return _trips.where((t) => t.isSynced).toList();
    return _trips;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // Pure Typographic Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Navigation Telemetry',
                                style: theme.textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Live Connect IQ sync and route diagnostics',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        FilledButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.download_rounded, size: 18),
                          label: const Text('Export'),
                        ),
                      ],
                    ),
                  ),
                ),

                // Telemetry Metric Cards
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        _AmbientTelemetryCard(
                          label: 'CUMULATIVE DISTANCE',
                          value: '42.8',
                          unit: 'km',
                          icon: Icons.route_rounded,
                          ambientType: _AmbientVectorType.pathFlow,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _AmbientTelemetryCard(
                                label: 'AVG SPEED',
                                value: '26.4',
                                unit: 'km/h',
                                icon: Icons.speed_rounded,
                                ambientType: _AmbientVectorType.windSweep,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _AmbientTelemetryCard(
                                label: 'LATENCY',
                                value: '120',
                                unit: 'ms',
                                icon: Icons.watch_rounded,
                                ambientType: _AmbientVectorType.signalBars,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Filter Controls
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        M3ConnectedButtonGroup(
                          options: const ['All trips', 'Active', 'Synced'],
                          selectedIndex: _selectedFilter,
                          onSelected: (index) => setState(() => _selectedFilter = index),
                        ),
                        Text(
                          '${_filteredTrips.length} items',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Trip History List
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 110),
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: colorScheme.outlineVariant.withValues(alpha: 0.45),
                        ),
                      ),
                      child: Column(
                        children: List.generate(_filteredTrips.length, (index) {
                          final trip = _filteredTrips[index];
                          final isLast = index == _filteredTrips.length - 1;
                          return Column(
                            children: [
                              _TripListItem(trip: trip),
                              if (!isLast)
                                Divider(
                                  height: 1,
                                  indent: 16,
                                  endIndent: 16,
                                  color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                                ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Floating Action Toolbar anchored at bottom center
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Center(
                child: M3FloatingToolbar(
                  children: [
                    _ToolbarIconButton(
                      icon: Icons.map_rounded,
                      isSelected: _activeNavIndex == 0,
                      onTap: () => setState(() => _activeNavIndex = 0),
                    ),
                    const SizedBox(width: 4),
                    _ToolbarIconButton(
                      icon: Icons.search_rounded,
                      isSelected: _activeNavIndex == 1,
                      onTap: () => setState(() => _activeNavIndex = 1),
                    ),
                    const SizedBox(width: 4),
                    _ToolbarIconButton(
                      icon: Icons.sync_rounded,
                      isSelected: _activeNavIndex == 2,
                      onTap: () => setState(() => _activeNavIndex = 2),
                    ),
                    const SizedBox(width: 4),
                    _ToolbarIconButton(
                      icon: Icons.settings_rounded,
                      isSelected: _activeNavIndex == 3,
                      onTap: () => setState(() => _activeNavIndex = 3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ToolbarIconButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ToolbarIconButton({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return IconButton(
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: isSelected ? colorScheme.primaryContainer : Colors.transparent,
        foregroundColor: isSelected ? colorScheme.onPrimaryContainer : colorScheme.onSurfaceVariant,
        minimumSize: const Size(44, 44),
      ),
      icon: Icon(icon, size: 20),
    );
  }
}

enum _AmbientVectorType { pathFlow, windSweep, signalBars }

class _AmbientTelemetryCard extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final IconData icon;
  final _AmbientVectorType ambientType;

  const _AmbientTelemetryCard({
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
    required this.ambientType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 132,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.35),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _AmbientCardPainter(
                primary: colorScheme.primary,
                containerAccent: colorScheme.primaryContainer,
                type: ambientType,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer.withValues(alpha: 0.65),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        icon,
                        size: 16,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      value,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      unit,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AmbientCardPainter extends CustomPainter {
  final Color primary;
  final Color containerAccent;
  final _AmbientVectorType type;

  _AmbientCardPainter({
    required this.primary,
    required this.containerAccent,
    required this.type,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    switch (type) {
      case _AmbientVectorType.pathFlow:
        final hillPaint = Paint()..color = containerAccent.withValues(alpha: 0.28);
        final hillPath = Path()
          ..moveTo(w * 0.42, h)
          ..cubicTo(w * 0.56, h * 0.25, w * 0.80, 0, w, 0)
          ..lineTo(w, h)
          ..close();
        canvas.drawPath(hillPath, hillPaint);

        final roadPaint = Paint()
          ..color = primary.withValues(alpha: 0.16)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 16
          ..strokeCap = StrokeCap.round;
        final roadPath = Path()
          ..moveTo(w * 0.52, h)
          ..cubicTo(w * 0.65, h * 0.72, w * 0.88, h * 0.78, w * 0.85, h * 0.58)
          ..cubicTo(w * 0.82, h * 0.42, w * 0.66, h * 0.36, w * 0.74, h * 0.24)
          ..cubicTo(w * 0.80, h * 0.14, w * 0.92, h * 0.16, w, h * 0.16);
        canvas.drawPath(roadPath, roadPaint);

      case _AmbientVectorType.windSweep:
        final paint1 = Paint()
          ..color = primary.withValues(alpha: 0.14)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 7
          ..strokeCap = StrokeCap.round;
        final paint2 = Paint()
          ..color = primary.withValues(alpha: 0.10)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round;

        final s1 = Path()
          ..moveTo(w * 0.45, h * 0.48)
          ..cubicTo(w * 0.68, h * 0.52, w * 0.82, h * 0.28, w, h * 0.22);
        final s2 = Path()
          ..moveTo(w * 0.56, h * 0.72)
          ..cubicTo(w * 0.75, h * 0.74, w * 0.86, h * 0.56, w, h * 0.52);

        canvas.drawPath(s1, paint1);
        canvas.drawPath(s2, paint2);

      case _AmbientVectorType.signalBars:
        const barCount = 4;
        const barWidth = 7.0;
        const gap = 5.0;
        final startX = w - (barCount * (barWidth + gap)) - 14;
        for (int i = 0; i < barCount; i++) {
          final barHeight = 16.0 + i * 13.0;
          final barPaint = Paint()..color = primary.withValues(alpha: 0.12 + i * 0.03);
          canvas.drawRRect(
            RRect.fromRectAndRadius(
              Rect.fromLTWH(startX + i * (barWidth + gap), h - barHeight - 12, barWidth, barHeight),
              const Radius.circular(3.5),
            ),
            barPaint,
          );
        }
    }
  }

  @override
  bool shouldRepaint(covariant _AmbientCardPainter oldDelegate) {
    return oldDelegate.primary != primary ||
        oldDelegate.containerAccent != containerAccent ||
        oldDelegate.type != type;
  }
}

class _TripRecord {
  final String timestamp;
  final String origin;
  final String destination;
  final String status;
  final bool isSynced;

  const _TripRecord({
    required this.timestamp,
    required this.origin,
    required this.destination,
    required this.status,
    required this.isSynced,
  });
}

class _TripListItem extends StatelessWidget {
  final _TripRecord trip;

  const _TripListItem({required this.trip});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final badgeBg = trip.isSynced ? colorScheme.primaryContainer : colorScheme.tertiaryContainer;
    final badgeFg = trip.isSynced ? colorScheme.onPrimaryContainer : colorScheme.onTertiaryContainer;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${trip.origin} -> ${trip.destination}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  trip.timestamp,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: badgeBg,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              trip.status,
              style: theme.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: badgeFg,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Optional entry point to preview the mobile screen directly.
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: M3AppTheme.lightTheme,
      darkTheme: M3AppTheme.darkTheme,
      home: const NavigationMobileDashboard(),
    ),
  );
}

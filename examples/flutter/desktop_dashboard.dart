import 'package:flutter/material.dart';
import 'components.dart';
import 'theme.dart';

/// Material 3 Expressive - Desktop Reference Application
/// Adaptive NavigationRail, Multi-Column Telemetry Grid, and Desktop Data Table
class NavigationDesktopApp extends StatefulWidget {
  const NavigationDesktopApp({super.key});

  @override
  State<NavigationDesktopApp> createState() => _NavigationDesktopAppState();
}

class _NavigationDesktopAppState extends State<NavigationDesktopApp> {
  int _selectedRailIndex = 0;
  int _selectedFilter = 0;
  bool _isRailExtended = true;
  bool _isDarkMode = false;
  String _searchQuery = '';

  static const _trips = [
    _DesktopTripRow(
      timestamp: '07:15:22',
      origin: 'Hang Xanh Junction, Binh Thanh',
      destination: 'Hi-Tech Park, Thu Duc',
      distance: '14.2 km',
      status: 'Synced',
      isSynced: true,
    ),
    _DesktopTripRow(
      timestamp: '12:30:45',
      origin: 'Ben Luc Bridge, Long An',
      destination: 'Cai Rang Floating Market',
      distance: '18.6 km',
      status: 'Synced',
      isSynced: true,
    ),
    _DesktopTripRow(
      timestamp: '18:05:10',
      origin: 'An Lac Roundabout, Binh Tan',
      destination: 'Ba Tri Fishing Port, Ben Tre',
      distance: '10.0 km',
      status: 'Streaming',
      isSynced: false,
    ),
  ];

  List<_DesktopTripRow> get _filteredTrips {
    return _trips.where((trip) {
      final matchesFilter = switch (_selectedFilter) {
        1 => !trip.isSynced,
        2 => trip.isSynced,
        _ => true,
      };
      final q = _searchQuery.trim().toLowerCase();
      final matchesQuery = q.isEmpty ||
          trip.origin.toLowerCase().contains(q) ||
          trip.destination.toLowerCase().contains(q);
      return matchesFilter && matchesQuery;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: M3AppTheme.lightTheme,
      darkTheme: M3AppTheme.darkTheme,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          final colorScheme = theme.colorScheme;
          final width = MediaQuery.sizeOf(context).width;
          final extended = _isRailExtended && width >= 1024;

          return Scaffold(
            backgroundColor: colorScheme.surface,
            body: Row(
              children: [
                // Adaptive Desktop Navigation Rail
                NavigationRail(
                  extended: extended,
                  backgroundColor: colorScheme.surfaceContainerLow,
                  selectedIndex: _selectedRailIndex,
                  onDestinationSelected: (index) => setState(() => _selectedRailIndex = index),
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        IconButton(
                          tooltip: extended ? 'Collapse navigation' : 'Expand navigation',
                          onPressed: () => setState(() => _isRailExtended = !_isRailExtended),
                          icon: Icon(extended ? Icons.menu_open_rounded : Icons.menu_rounded),
                        ),
                        const SizedBox(height: 12),
                        if (extended)
                          FloatingActionButton.extended(
                            elevation: 0,
                            onPressed: () {},
                            icon: const Icon(Icons.sync_rounded),
                            label: const Text('Sync Watch'),
                          )
                        else
                          FloatingActionButton(
                            elevation: 0,
                            onPressed: () {},
                            child: const Icon(Icons.sync_rounded),
                          ),
                      ],
                    ),
                  ),
                  trailing: Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: IconButton(
                          tooltip: _isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
                          onPressed: () => setState(() => _isDarkMode = !_isDarkMode),
                          icon: Icon(_isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
                        ),
                      ),
                    ),
                  ),
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.navigation_outlined),
                      selectedIcon: Icon(Icons.navigation_rounded),
                      label: Text('Dashboard'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.watch_outlined),
                      selectedIcon: Icon(Icons.watch_rounded),
                      label: Text('Watch Studio'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings_outlined),
                      selectedIcon: Icon(Icons.settings_rounded),
                      label: Text('System'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.terminal_outlined),
                      selectedIcon: Icon(Icons.terminal_rounded),
                      label: Text('Console Logs'),
                    ),
                  ],
                ),

                // Subtle vertical divider
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                ),

                // Main Desktop Workspace Canvas
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Top Header & Actions
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Navigation Telemetry',
                                        style: theme.textTheme.headlineLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: colorScheme.onSurface,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Live Connect IQ device link, trip logs, and packet diagnostics',
                                        style: theme.textTheme.bodyMedium?.copyWith(
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 280,
                                  child: M3SearchBarPill(
                                    hintText: 'Search origin or destination...',
                                    onChanged: (val) => setState(() => _searchQuery = val),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                FilledButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.download_rounded, size: 18),
                                  label: const Text('Export GPX'),
                                ),
                              ],
                            ),

                            const SizedBox(height: 28),

                            // 3-Column KPI Metric Grid
                            LayoutBuilder(
                              builder: (context, constraints) {
                                final isCompact = constraints.maxWidth < 760;
                                final cards = [
                                  const _DesktopMetricCard(
                                    label: 'CUMULATIVE DISTANCE',
                                    value: '42.8',
                                    unit: 'km',
                                    icon: Icons.route_rounded,
                                    type: _DesktopAmbientType.pathFlow,
                                  ),
                                  const _DesktopMetricCard(
                                    label: 'AVERAGE SPEED',
                                    value: '26.4',
                                    unit: 'km/h',
                                    icon: Icons.speed_rounded,
                                    type: _DesktopAmbientType.windSweep,
                                  ),
                                  const _DesktopMetricCard(
                                    label: 'PACKET LATENCY',
                                    value: '120',
                                    unit: 'ms',
                                    icon: Icons.watch_rounded,
                                    type: _DesktopAmbientType.signalBars,
                                  ),
                                ];

                                if (isCompact) {
                                  return Column(
                                    children: [
                                      cards[0],
                                      const SizedBox(height: 16),
                                      cards[1],
                                      const SizedBox(height: 16),
                                      cards[2],
                                    ],
                                  );
                                }

                                return Row(
                                  children: [
                                    Expanded(child: cards[0]),
                                    const SizedBox(width: 20),
                                    Expanded(child: cards[1]),
                                    const SizedBox(width: 20),
                                    Expanded(child: cards[2]),
                                  ],
                                );
                              },
                            ),

                            const SizedBox(height: 28),

                            // Filter Toolbar & Connection Status Chip
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                M3ConnectedButtonGroup(
                                  options: const ['All trips', 'Active', 'Synced'],
                                  selectedIndex: _selectedFilter,
                                  onSelected: (index) => setState(() => _selectedFilter = index),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: colorScheme.secondaryContainer,
                                        borderRadius: BorderRadius.circular(999),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.bluetooth_connected_rounded,
                                            size: 15,
                                            color: colorScheme.onSecondaryContainer,
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            'Garmin Watch Connected',
                                            style: theme.textTheme.labelMedium?.copyWith(
                                              color: colorScheme.onSecondaryContainer,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      '${_filteredTrips.length} records',
                                      style: theme.textTheme.bodySmall?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // Desktop Data Table Container
                            Container(
                              width: double.infinity,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceContainerLowest,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: colorScheme.outlineVariant.withValues(alpha: 0.45),
                                ),
                              ),
                              child: Column(
                                children: [
                                  // Table Header
                                  Container(
                                    color: colorScheme.surfaceContainerHigh,
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                                    child: Row(
                                      children: [
                                        _headerCell(theme, 'Timestamp', flex: 2),
                                        _headerCell(theme, 'Origin', flex: 4),
                                        _headerCell(theme, 'Destination', flex: 4),
                                        _headerCell(theme, 'Distance', flex: 2),
                                        _headerCell(theme, 'Sync Status', flex: 2),
                                      ],
                                    ),
                                  ),
                                  // Table Rows
                                  if (_filteredTrips.isEmpty)
                                    Padding(
                                      padding: const EdgeInsets.all(32),
                                      child: Text(
                                        'No matching telemetry logs',
                                        style: theme.textTheme.bodyMedium?.copyWith(
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    )
                                  else
                                    ...List.generate(_filteredTrips.length, (index) {
                                      final row = _filteredTrips[index];
                                      final isLast = index == _filteredTrips.length - 1;
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                                              child: Row(
                                                children: [
                                                  _bodyCell(theme, row.timestamp, flex: 2, muted: true),
                                                  _bodyCell(theme, row.origin, flex: 4),
                                                  _bodyCell(theme, row.destination, flex: 4),
                                                  _bodyCell(theme, row.distance, flex: 2, bold: true),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: _StatusBadge(
                                                        label: row.status,
                                                        isSynced: row.isSynced,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          if (!isLast)
                                            Divider(
                                              height: 1,
                                              color: colorScheme.outlineVariant.withValues(alpha: 0.35),
                                            ),
                                        ],
                                      );
                                    }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _headerCell(ThemeData theme, String label, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Text(
        label,
        style: theme.textTheme.labelLarge?.copyWith(
          color: theme.colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _bodyCell(
    ThemeData theme,
    String text, {
    required int flex,
    bool muted = false,
    bool bold = false,
  }) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: muted ? theme.colorScheme.onSurfaceVariant : theme.colorScheme.onSurface,
          fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;
  final bool isSynced;

  const _StatusBadge({required this.label, required this.isSynced});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bg = isSynced ? colorScheme.primaryContainer : colorScheme.tertiaryContainer;
    final fg = isSynced ? colorScheme.onPrimaryContainer : colorScheme.onTertiaryContainer;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: fg, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: fg,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}

enum _DesktopAmbientType { pathFlow, windSweep, signalBars }

class _DesktopMetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final IconData icon;
  final _DesktopAmbientType type;

  const _DesktopMetricCard({
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 140,
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
              painter: _DesktopAmbientPainter(
                primary: colorScheme.primary,
                containerAccent: colorScheme.primaryContainer,
                type: type,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer.withValues(alpha: 0.65),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, size: 16, color: colorScheme.onPrimaryContainer),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      label,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
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
                      style: theme.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      unit,
                      style: theme.textTheme.titleMedium?.copyWith(
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

class _DesktopAmbientPainter extends CustomPainter {
  final Color primary;
  final Color containerAccent;
  final _DesktopAmbientType type;

  _DesktopAmbientPainter({
    required this.primary,
    required this.containerAccent,
    required this.type,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    switch (type) {
      case _DesktopAmbientType.pathFlow:
        final hillPaint = Paint()..color = containerAccent.withValues(alpha: 0.25);
        final hillPath = Path()
          ..moveTo(w * 0.44, h)
          ..cubicTo(w * 0.58, h * 0.25, w * 0.80, 0, w, 0)
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

      case _DesktopAmbientType.windSweep:
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
          ..moveTo(w * 0.48, h * 0.48)
          ..cubicTo(w * 0.68, h * 0.52, w * 0.82, h * 0.28, w, h * 0.22);
        final s2 = Path()
          ..moveTo(w * 0.58, h * 0.72)
          ..cubicTo(w * 0.75, h * 0.74, w * 0.86, h * 0.56, w, h * 0.52);

        canvas.drawPath(s1, paint1);
        canvas.drawPath(s2, paint2);

      case _DesktopAmbientType.signalBars:
        const barCount = 4;
        const barWidth = 8.0;
        const gap = 6.0;
        final startX = w - (barCount * (barWidth + gap)) - 16;
        for (int i = 0; i < barCount; i++) {
          final barHeight = 16.0 + i * 14.0;
          final barPaint = Paint()..color = primary.withValues(alpha: 0.12 + i * 0.03);
          canvas.drawRRect(
            RRect.fromRectAndRadius(
              Rect.fromLTWH(startX + i * (barWidth + gap), h - barHeight - 14, barWidth, barHeight),
              const Radius.circular(4),
            ),
            barPaint,
          );
        }
    }
  }

  @override
  bool shouldRepaint(covariant _DesktopAmbientPainter oldDelegate) {
    return oldDelegate.primary != primary ||
        oldDelegate.containerAccent != containerAccent ||
        oldDelegate.type != type;
  }
}

class _DesktopTripRow {
  final String timestamp;
  final String origin;
  final String destination;
  final String distance;
  final String status;
  final bool isSynced;

  const _DesktopTripRow({
    required this.timestamp,
    required this.origin,
    required this.destination,
    required this.distance,
    required this.status,
    required this.isSynced,
  });
}

void main() {
  runApp(const NavigationDesktopApp());
}

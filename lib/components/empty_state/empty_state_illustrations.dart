import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// Base class for empty state illustrations.
/// All illustrations are built with Flutter widgets (no external assets).
abstract class EmptyStateIllustration extends StatelessWidget {
  const EmptyStateIllustration({super.key});
}

/// Illustration for "No Data" states - shows a document with dashed lines.
class NoDataIllustration extends EmptyStateIllustration {
  const NoDataIllustration({super.key, this.size = 120});

  final double size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: size * 0.9,
            height: size * 0.9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primary.withValues(alpha: 0.08),
            ),
          ),
          // Document body
          Container(
            width: size * 0.55,
            height: size * 0.7,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: colorScheme.outlineVariant,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Top folded corner
                Align(
                  alignment: Alignment.topRight,
                  child: ClipPath(
                    clipper: _CornerClipper(),
                    child: Container(
                      width: 24,
                      height: 24,
                      color: colorScheme.outlineVariant,
                    ),
                  ),
                ),
                const Spacer(),
                // Dashed lines representing content
                _DashedLine(width: size * 0.35, color: colorScheme.outline),
                const SizedBox(height: 8),
                _DashedLine(width: size * 0.25, color: colorScheme.outline),
                const SizedBox(height: 8),
                _DashedLine(width: size * 0.3, color: colorScheme.outline),
                const Spacer(),
              ],
            ),
          ),
          // Floating search icon
          Positioned(
            bottom: size * 0.15,
            right: size * 0.1,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                shape: BoxShape.circle,
                border: Border.all(
                  color: colorScheme.surface,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.search,
                size: 16,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Illustration for "No Search Results" - shows a magnifying glass with items.
class NoSearchResultsIllustration extends EmptyStateIllustration {
  const NoSearchResultsIllustration({super.key, this.size = 120});

  final double size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: size * 0.9,
            height: size * 0.9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primary.withValues(alpha: 0.08),
            ),
          ),
          // Floating items around
          Positioned(
            top: size * 0.2,
            left: size * 0.15,
            child: _FloatingItem(
              icon: Icons.sports_soccer,
              color: colorScheme.outline,
              size: 20,
            ),
          ),
          Positioned(
            top: size * 0.25,
            right: size * 0.2,
            child: _FloatingItem(
              icon: Icons.location_on,
              color: colorScheme.outline,
              size: 18,
            ),
          ),
          Positioned(
            bottom: size * 0.25,
            left: size * 0.2,
            child: _FloatingItem(
              icon: Icons.calendar_today,
              color: colorScheme.outline,
              size: 16,
            ),
          ),
          // Magnifying glass
          Container(
            width: size * 0.5,
            height: size * 0.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: colorScheme.primary,
                width: 4,
              ),
            ),
          ),
          Positioned(
            bottom: size * 0.15,
            right: size * 0.2,
            child: Transform.rotate(
              angle: 0.8,
              child: Container(
                width: 4,
                height: size * 0.2,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Illustration for "Error" states - shows a warning/alert symbol.
class ErrorIllustration extends EmptyStateIllustration {
  const ErrorIllustration({super.key, this.size = 120});

  final double size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: size * 0.9,
            height: size * 0.9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.error.withValues(alpha: 0.08),
            ),
          ),
          // Warning triangle
          Container(
            width: size * 0.5,
            height: size * 0.45,
            child: CustomPaint(
              painter: _TrianglePainter(color: colorScheme.error),
            ),
          ),
          // Exclamation mark
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 28,
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Illustration for "No Notifications" - shows a bell with no entries.
class NoNotificationsIllustration extends EmptyStateIllustration {
  const NoNotificationsIllustration({super.key, this.size = 120});

  final double size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: size * 0.9,
            height: size * 0.9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primary.withValues(alpha: 0.08),
            ),
          ),
          // Bell container
          Container(
            width: size * 0.5,
            height: size * 0.55,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Bell body
                Container(
                  width: size * 0.4,
                  height: size * 0.45,
                  decoration: BoxDecoration(
                    color: colorScheme.outline.withValues(alpha: 0.3),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(40),
                      bottom: Radius.circular(8),
                    ),
                  ),
                ),
                // Bell bottom
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: size * 0.15,
                    height: size * 0.08,
                    decoration: BoxDecoration(
                      color: colorScheme.outline.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                // Cross mark
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: colorScheme.outlineVariant,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.close,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Illustration for "No Bookings" - shows a calendar with no events.
class NoBookingsIllustration extends EmptyStateIllustration {
  const NoBookingsIllustration({super.key, this.size = 120});

  final double size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: size * 0.9,
            height: size * 0.9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primary.withValues(alpha: 0.08),
            ),
          ),
          // Calendar
          Container(
            width: size * 0.5,
            height: size * 0.55,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: colorScheme.outlineVariant,
                width: 2,
              ),
            ),
            child: Column(
              children: [
                // Header
                Container(
                  height: size * 0.15,
                  decoration: BoxDecoration(
                    color: colorScheme.outline.withValues(alpha: 0.3),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(6),
                    ),
                  ),
                ),
                // Grid dots
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        9,
                        (index) => Container(
                          decoration: BoxDecoration(
                            color: index == 4
                                ? colorScheme.error.withValues(alpha: 0.2)
                                : colorScheme.outline.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: index == 4
                              ? Center(
                                  child: Icon(
                                    Icons.close,
                                    size: 10,
                                    color: colorScheme.error,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Illustration for "No Internet/Offline" - shows disconnected signal.
class OfflineIllustration extends EmptyStateIllustration {
  const OfflineIllustration({super.key, this.size = 120});

  final double size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: size * 0.9,
            height: size * 0.9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.error.withValues(alpha: 0.08),
            ),
          ),
          // Signal waves (fading)
          _SignalWave(
            size: size * 0.7,
            color: colorScheme.outline.withValues(alpha: 0.3),
          ),
          _SignalWave(
            size: size * 0.55,
            color: colorScheme.outline.withValues(alpha: 0.5),
          ),
          _SignalWave(
            size: size * 0.4,
            color: colorScheme.outline.withValues(alpha: 0.7),
          ),
          // Cross mark overlay
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: colorScheme.errorContainer,
              shape: BoxShape.circle,
              border: Border.all(
                color: colorScheme.error,
                width: 2,
              ),
            ),
            child: Icon(
              Icons.wifi_off,
              size: 20,
              color: colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}

/// Illustration for "Success/Completed" - shows a checkmark in circle.
class SuccessIllustration extends EmptyStateIllustration {
  const SuccessIllustration({super.key, this.size = 120});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: size * 0.9,
            height: size * 0.9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.success.withValues(alpha: 0.08),
            ),
          ),
          // Checkmark circle
          Container(
            width: size * 0.5,
            height: size * 0.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.success.withValues(alpha: 0.2),
              border: Border.all(
                color: AppColors.success,
                width: 3,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.check,
                size: 28,
                color: AppColors.success,
                weight: 700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Private helpers

class _CornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _DashedLine extends StatelessWidget {
  const _DashedLine({required this.width, required this.color});

  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 4,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

class _FloatingItem extends StatelessWidget {
  const _FloatingItem({
    required this.icon,
    required this.color,
    required this.size,
  });

  final IconData icon;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, size: size, color: color),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  const _TrianglePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SignalWave extends StatelessWidget {
  const _SignalWave({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 3),
      ),
    );
  }
}

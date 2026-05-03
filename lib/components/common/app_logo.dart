import 'package:flutter/material.dart';

/// Animated Futsmandu logo that automatically switches between the light and
/// dark-mode variants based on the current [ThemeData.brightness].
///
/// Asset paths must exist in the host app's asset bundle:
///   - `assets/black_logo.png`  (used in light mode)
///   - `assets/White_logo.png`  (used in dark mode)
class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size = 72.0});

  final double size;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final logoPath =
        isDark ? 'assets/White_logo.png' : 'assets/black_logo.png';

    return ClipRRect(
      borderRadius: BorderRadius.circular(size * 0.25),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        child: Image.asset(
          logoPath,
          key: ValueKey<String>(logoPath),
          width: size,
          height: size,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

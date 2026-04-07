import 'package:flutter/material.dart';

class AppElevation {
  AppElevation._();

  static const double level0 = 0;
  static const double level1 = 1;
  static const double level2 = 3;
  static const double level3 = 6;

  static List<BoxShadow> shadowLevel1(Color color) {
    return [
      BoxShadow(
        color: color.withValues(alpha: 0.08),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ];
  }

  static List<BoxShadow> shadowLevel2(Color color) {
    return [
      BoxShadow(
        color: color.withValues(alpha: 0.12),
        blurRadius: 14,
        offset: const Offset(0, 6),
      ),
    ];
  }
}

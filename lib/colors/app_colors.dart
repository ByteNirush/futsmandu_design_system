import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color primary = Color(0xFF0B63F6);
  static const Color onPrimary = Colors.white;

  static const Color secondary = Color(0xFF12B76A);
  static const Color onSecondary = Colors.white;

  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Colors.white;

  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color border = Color(0xFFE5E7EB);
  static const Color error = Color(0xFFDC2626);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      error: error,
      onError: Colors.white,
      surface: surface,
      onSurface: textPrimary,
    );
  }
}

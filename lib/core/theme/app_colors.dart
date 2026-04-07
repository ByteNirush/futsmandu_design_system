import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF0F9D8A);
  static const Color onPrimary = Color(0xFFFFFFFF);

  static const Color secondary = Color(0xFF1E3A8A);
  static const Color onSecondary = Color(0xFFFFFFFF);

  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF2563EB);
  static const Color error = Color(0xFFDC2626);

  static const Color lightBackground = Color(0xFFEDF1F5);
  static const Color darkBackground = Color(0xFF0B1220);

  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color darkSurface = Color(0xFF111827);

  static const Color lightTextPrimary = Color(0xFF0D1B3D);
  static const Color darkTextPrimary = Color(0xFFE5E7EB);

  static const Color lightTextSecondary = Color(0xFF4F607A);
  static const Color darkTextSecondary = Color(0xFF94A3B8);

  static const Color lightTextDisabled = Color(0xFF8CA0BA);
  static const Color darkTextDisabled = Color(0xFF64748B);

  static ColorScheme get lightScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      error: error,
      onError: onPrimary,
      surface: lightSurface,
      onSurface: lightTextPrimary,
      onSurfaceVariant: lightTextSecondary,
      outline: lightTextDisabled,
      shadow: Color(0x1F000000),
      inverseSurface: darkSurface,
      onInverseSurface: darkTextPrimary,
      inversePrimary: Color(0xFF5EEAD4),
      scrim: Color(0x80000000),
      tertiary: success,
      onTertiary: onPrimary,
      surfaceTint: primary,
    );
  }

  static ColorScheme get darkScheme {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF2DD4BF),
      onPrimary: Color(0xFF052A26),
      secondary: Color(0xFF93C5FD),
      onSecondary: Color(0xFF0F172A),
      error: Color(0xFFF87171),
      onError: Color(0xFF450A0A),
      surface: darkSurface,
      onSurface: darkTextPrimary,
      onSurfaceVariant: darkTextSecondary,
      outline: darkTextDisabled,
      shadow: Color(0x4D000000),
      inverseSurface: lightSurface,
      onInverseSurface: lightTextPrimary,
      inversePrimary: primary,
      scrim: Color(0xB3000000),
      tertiary: Color(0xFF4ADE80),
      onTertiary: Color(0xFF052E16),
      surfaceTint: Color(0xFF2DD4BF),
    );
  }
}

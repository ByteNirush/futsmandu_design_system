import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Brand Palette ─────────────────────────────────────────────────────────
  static const Color primary   = Color(0xFF0B6E2E); // Green
  static const Color onPrimary = Color(0xFFFFFFFF);

  static const Color secondary   = Color(0xFF212529); // Dark almost black
  static const Color onSecondary = Color(0xFFFFFFFF);

  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color info    = Color(0xFF17A2B8);
  static const Color error   = Color(0xFFDC3545);

  // ── Backgrounds ───────────────────────────────────────────────────────────
  static const Color lightBackground = Color(0xFFF4F6F8); // Light clean gray
  static const Color darkBackground  = Color(0xFF121212); // Grayish-black

  // ── Surfaces ──────────────────────────────────────────────────────────────
  static const Color lightSurface = Color(0xFFFFFFFF); // Stark white
  static const Color darkSurface  = Color(0xFF1E1E1E);

  // ── Text ──────────────────────────────────────────────────────────────────
  static const Color lightTextPrimary   = Color(0xFF1F2937); // Very dark gray for high readability
  static const Color darkTextPrimary    = Color(0xFFF9FAFB); // High contrast white
  static const Color lightTextSecondary = Color(0xFF6B7280);
  static const Color darkTextSecondary  = Color(0xFF9CA3AF);
  static const Color lightTextDisabled  = Color(0xFF9CA3AF);
  static const Color darkTextDisabled   = Color(0xFF6B7280);

  // ── Light ColorScheme ─────────────────────────────────────────────────────
  static ColorScheme get lightScheme {
    return const ColorScheme(
      brightness: Brightness.light,

      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: Color(0xFFE8F5E9),      // very light green
      onPrimaryContainer: Color(0xFF1B5E20),    // very dark green

      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: Color(0xFFE2E8F0),
      onSecondaryContainer: Color(0xFF0F172A),

      tertiary: success,
      onTertiary: onPrimary,
      tertiaryContainer: Color(0xFFDCFCE7),
      onTertiaryContainer: Color(0xFF14532D),

      error: error,
      onError: onPrimary,
      errorContainer: Color(0xFFFFE4E6),
      onErrorContainer: Color(0xFF881337),

      surface: lightSurface,
      onSurface: lightTextPrimary,
      onSurfaceVariant: lightTextSecondary,

      outline: Color(0xFFE5E7EB),               // clean light borders
      outlineVariant: Color(0xFFD1D5DB),

      shadow: Color(0x1A000000),                // light, subtle shadows
      scrim: Color(0x80000000),

      inverseSurface: darkSurface,
      onInverseSurface: darkTextPrimary,
      inversePrimary: Color(0xFF8CE376),

      surfaceTint: lightSurface, // Prevents material 3 tinting pure white cards
    );
  }

  // ── Dark ColorScheme ──────────────────────────────────────────────────────
  static ColorScheme get darkScheme {
    return const ColorScheme(
      brightness: Brightness.dark,

      primary: Color(0xFF10B981),
      onPrimary: Color(0xFFFFFFFF),             // keep text white on primary emerald
      primaryContainer: Color(0xFF065F46),
      onPrimaryContainer: Color(0xFFD1FAE5),

      secondary: Color(0xFF9CA3AF),
      onSecondary: Color(0xFF111827),
      secondaryContainer: Color(0xFF374151),
      onSecondaryContainer: Color(0xFFF3F4F6),

      tertiary: Color(0xFF4ADE80),
      onTertiary: Color(0xFF064E3B),
      tertiaryContainer: Color(0xFF065F46),
      onTertiaryContainer: Color(0xFFD1FAE5),

      error: Color(0xFFF87171),
      onError: Color(0xFF450A0A),
      errorContainer: Color(0xFF7F1D1D),
      onErrorContainer: Color(0xFFFECACA),

      surface: darkSurface,
      onSurface: darkTextPrimary,
      onSurfaceVariant: darkTextSecondary,

      outline: darkTextDisabled,
      outlineVariant: Color(0xFF374151),

      shadow: Color(0x80000000),                // deeper shadows in dark mode
      scrim: Color(0xB3000000),

      inverseSurface: lightSurface,
      onInverseSurface: lightTextPrimary,
      inversePrimary: primary,

      surfaceTint: darkSurface, // Keeps dark cards actually dark
    );
  }
}

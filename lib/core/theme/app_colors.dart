import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Legacy Color Aliases ─────────────────────────────────────────────────
  static const Color green = primary;
  static const Color amber = warning;
  static const Color red = error;
  static const Color blue = info;
  static const Color danger = error;

  // ── App-Specific Colors ──────────────────────────────────────────────────
  static const Color khalti = Color(0xFF5C2D91);
  static const Color esewa = Color(0xFF60BB46);
  static const Color ratingStar = warning;

  // ── Brand Palette ─────────────────────────────────────────────────────────
  static const Color primary = Color(0xFF3CC850); // Darker Green from screenshots
  static const Color onPrimary = Color(0xFFFFFFFF);

  static const Color secondary = Color(0xFF212529); // Dark almost black
  static const Color onSecondary = Color(0xFFFFFFFF);

  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF17A2B8);
  static const Color error = Color(0xFFDC3545);

  // ── Backgrounds ───────────────────────────────────────────────────────────
  static const Color lightBackground = Color(0xFFF8F9FA); // Very light gray from screenshots
  static const Color darkBackground = Color(0xFF111111); // Dark background from screenshots

  // ── Surfaces ──────────────────────────────────────────────────────────────
  static const Color lightSurface = Color(0xFFFFFFFF); // Stark white
  static const Color darkSurface = Color(0xFF252525); // Card/box color from screenshots

  // ── Text ──────────────────────────────────────────────────────────────────
  static const Color lightTextPrimary =
      Color(0xFF1F2937); // Very dark gray for high readability
  static const Color darkTextPrimary = Color(0xFFF9FAFB); // High contrast white
  static const Color lightTextSecondary = Color(0xFF6B7280);
  static const Color darkTextSecondary = Color(0xFF9CA3AF);
  static const Color lightTextDisabled = Color(0xFF9CA3AF);
  static const Color darkTextDisabled = Color(0xFF6B7280);

  // ── Light ColorScheme ─────────────────────────────────────────────────────
  static ColorScheme get lightScheme {
    return const ColorScheme(
      brightness: Brightness.light,

      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: Color(0xFFE8F5E9), // very light green
      onPrimaryContainer: Color(0xFF1B5E20), // very dark green

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

      outline: Color(0xFFE5E7EB), // clean light borders
      outlineVariant: Color(0xFFD1D5DB),

      shadow: Color(0x1A000000), // light, subtle shadows
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

      primary: Color(0xFF3CC850),
      onPrimary: Color(0xFF052E16),

      primaryContainer: Color(0xFF0D3D1F),
      onPrimaryContainer: Color(0xFF22C55E),

      secondary: Color(0xFF9CA3AF),
      onSecondary: Color(0xFF111827),
      secondaryContainer: Color(0xFF1E2A38),
      onSecondaryContainer: Color(0xFFE2E8F0),

      tertiary: Color(0xFF34D399),
      onTertiary: Color(0xFF052E16),
      tertiaryContainer: Color(0xFF083D2A),
      onTertiaryContainer: Color(0xFFA7F3D0),

      error: Color(0xFFFF4444),
      onError: Color(0xFF2D0000),
      errorContainer: Color(0xFF3D0000),
      onErrorContainer: Color(0xFFFFCDD2),

      surface: darkSurface,
      onSurface: darkTextPrimary,

      onSurfaceVariant: Color(0xFFB0B8C4),

      outline: Color(0xFF4A5568),
      outlineVariant: Color(0xFF2D3748),

      shadow: Color(0x80000000),

      inverseSurface: lightSurface,
      onInverseSurface: lightTextPrimary,
      inversePrimary: primary,

      surfaceTint: darkSurface,
    );
  }

  // ── System Brightness Helper ────────────────────────────────────────────
  static Brightness get _systemBrightness =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  // ── Theme-Aware Color Getters ─────────────────────────────────────────────
  /// Returns the appropriate background color based on brightness (defaults to system)
  static Color background([Brightness? brightness]) =>
      (brightness ?? _systemBrightness) == Brightness.dark
          ? darkSurface
          : lightSurface;

  /// Returns the appropriate surface color based on brightness (defaults to system)
  static Color surface([Brightness? brightness]) =>
      (brightness ?? _systemBrightness) == Brightness.dark
          ? darkSurface
          : lightSurface;

  /// Returns the appropriate card color based on brightness (defaults to system)
  static Color card([Brightness? brightness]) =>
      (brightness ?? _systemBrightness) == Brightness.dark
          ? darkSurface
          : lightSurface;

  /// Returns the appropriate primary text color based on brightness (defaults to system)
  static Color textPrimary([Brightness? brightness]) =>
      (brightness ?? _systemBrightness) == Brightness.dark
          ? darkTextPrimary
          : lightTextPrimary;

  /// Returns the appropriate secondary text color based on brightness (defaults to system)
  static Color textSecondary([Brightness? brightness]) =>
      (brightness ?? _systemBrightness) == Brightness.dark
          ? darkTextSecondary
          : lightTextSecondary;

  /// Returns the appropriate border color based on brightness (defaults to system)
  static Color border([Brightness? brightness]) =>
      (brightness ?? _systemBrightness) == Brightness.dark
          ? darkScheme.outline
          : lightScheme.outline;

  /// Returns the appropriate outline variant color based on brightness (defaults to system)
  static Color borderVariant([Brightness? brightness]) =>
      (brightness ?? _systemBrightness) == Brightness.dark
          ? darkScheme.outlineVariant
          : lightScheme.outlineVariant;

  /// Returns the appropriate disabled text color based on brightness (defaults to system)
  static Color textDisabled([Brightness? brightness]) =>
      (brightness ?? _systemBrightness) == Brightness.dark
          ? darkTextDisabled
          : lightTextDisabled;

  // ── Legacy Background Aliases (Getters for backward compatibility) ──────────
  static Color get bgPrimary => background();
  static Color get bgSurface => surface();
  static Color get bgElevated => card();

  // ── Legacy Text Aliases (Getters for backward compatibility) ──────────────
  static Color get txtPrimary => textPrimary();
  static Color get txtDisabled => textDisabled();

  // ── Legacy Border Aliases (Getters for backward compatibility) ──────────────
  static Color get borderClr => borderVariant();

  // ── Status Color Helper ───────────────────────────────────────────────────
  static Color statusColor(String status, [Brightness? brightness]) =>
      switch (status) {
        'AVAILABLE' => green,
        'HELD' => amber,
        'CONFIRMED' => green,
        'CANCELLED' => red,
        'EXPIRED' => textDisabled(brightness),
        'COMPLETED' => blue,
        'NO_SHOW' => red,
        _ => textDisabled(brightness),
      };

  // ── Reliability Color Helper ──────────────────────────────────────────────
  static Color reliabilityColor(int score) => score >= 70
      ? green
      : score >= 40
          ? amber
          : red;
}

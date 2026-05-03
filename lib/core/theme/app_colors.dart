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

    // Slightly softened from the original overly-saturated value —
    // readable and vibrant without feeling harsh on dark backgrounds.
    primary: Color(0xFF18C35A),
    onPrimary: Color(0xFF003517),

    // Fixed: was reusing the light-mode value (very light green = jarring).
    // Now a deep forest green that actually suits dark surfaces.
    primaryContainer: Color(0xFF0A3D20),
    // Contrast pair: light mint reads clearly on the deep green container.
    onPrimaryContainer: Color(0xFF18C35A),

    secondary: Color(0xFF9CA3AF),
    onSecondary: Color(0xFF111827),
    // Bumped from #374151 to a richer slate — more presence on dark surfaces.
    secondaryContainer: Color(0xFF2D3748),
    onSecondaryContainer: Color(0xFFE2E8F0),

    // Pulled slightly toward emerald for harmony with the new primary.
    tertiary: Color(0xFF34D399),
    onTertiary: Color(0xFF052E16),
    // Deeper and more saturated container — consistent with primaryContainer logic.
    tertiaryContainer: Color(0xFF083D2A),
    onTertiaryContainer: Color(0xFFA7F3D0),

    // Softened from #F87171 to #FC8181 — less alarming, still clearly an error.
    error: Color(0xFFFF4444),
    onError: Color(0xFF2D0000),
    errorContainer: Color(0xFFFF4444),
    onErrorContainer: Color(0xFFFFCDD2),

    surface: darkSurface,
    onSurface: darkTextPrimary,

    // Bumped from #9CA3AF (too muted) to #D1D5DB — secondary text is now
    // meaningfully distinct from disabled text, improving the 3-tier hierarchy.
    onSurfaceVariant: Color(0xFFD1D5DB),

    // Bumped from #6B7280 to #4B5563 — borders now show up on dark surfaces.
    outline: Color(0xFF4B5563),
    outlineVariant: Color(0xFF374151),

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
  /// Returns the appropriate color scheme based on brightness (defaults to system)
  static ColorScheme scheme([Brightness? brightness]) =>
      (brightness ?? _systemBrightness) == Brightness.dark
          ? darkScheme
          : lightScheme;

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

  /// Returns the appropriate primary variant color based on brightness (defaults to system)
  static Color primaryVariant([Brightness? brightness]) =>
      (brightness ?? _systemBrightness) == Brightness.dark
          ? darkScheme.onPrimaryContainer
          : lightScheme.onPrimaryContainer;

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
  static Color statusColor(String status, [Brightness? brightness]) => switch (status) {
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
  static Color reliabilityColor(int score) =>
      score >= 70 ? green : score >= 40 ? amber : red;
}

// ── Color Scheme Accessors ─────────────────────────────────────────────────
class AppColorSchemes {
  AppColorSchemes._();

  static ColorScheme get light => AppColors.lightScheme;
  static ColorScheme get dark => AppColors.darkScheme;
}

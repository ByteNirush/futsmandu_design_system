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

  // ── Chat Specific Colors ──────────────────────────────────────────────────
  static const Color chatSentBubble = Color(0xFFDCF8C6);
  static const Color chatReceivedBubble = Color(0xFFFFFFFF);
  static const Color chatBackground = Color(0xFFE5DDD5);
  static const Color chatDateBackground = Color(0xFFFFFFFF);
  static const Color chatReadTick = Color(0xFF34B7F1);

  // ── Brand Palette ─────────────────────────────────────────────────────────
  static const Color primary =
      Color(0xFF31AD43); // Darker Green from screenshots
  static const Color onPrimary = Color(0xFFFFFFFF);

  static const Color secondary = Color(0xFF000000); // Dark almost black
  static const Color onSecondary = Color(0xFFFFFFFF);

  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF17A2B8);
  static const Color error = Color(0xFFDC3545);

  // ── Backgrounds ───────────────────────────────────────────────────────────
  static const Color lightBackground =
      Color(0xFFF8F9FA); // Very light gray from screenshots
  static const Color darkBackground = Color(0xFF070707); // Dark background from screenshots

  // ── Surfaces ──────────────────────────────────────────────────────────────
  static const Color lightSurface = Color(0xFFFFFFFF); // Stark white
    static const Color darkSurface = Color(0xFF000000); // Card/box color from screenshots

  // ── Text ──────────────────────────────────────────────────────────────────
  static const Color lightTextPrimary =
      Color(0xFF1F2937); // Very dark gray for high readability
  static const Color darkTextPrimary = Color(0xFFF9FAFB); // High contrast white
  static const Color lightTextSecondary = Color(0xFF6B7280);
  static const Color darkTextSecondary = Color(0xFF9CA3AF);
  static const Color lightTextDisabled = Color(0xFF9CA3AF);
  static const Color darkTextDisabled = Color(0xFF6B7280);

    // ── Derived / Scheme Helper Colors ──────────────────────────────────────
    static const Color primaryContainerLight = Color(0xFFE8F5E9);
    static const Color onPrimaryContainerLight = Color(0xFF1B5E20);

    static const Color secondaryContainerLight = Color(0xFFE2E8F0);
    static const Color onSecondaryContainerLight = Color(0xFF0F172A);

    static const Color tertiaryContainerLight = Color(0xFFDCFCE7);
    static const Color onTertiaryContainerLight = Color(0xFF14532D);

    static const Color errorContainerLight = Color(0xFFFFE4E6);
    static const Color onErrorContainerLight = Color(0xFF881337);

    static const Color outlineLight = Color(0xFFE5E7EB);
    static const Color outlineVariantLight = Color(0xFFD1D5DB);

    static const Color shadowLight = Color(0x1A000000);
    static const Color scrimLight = Color(0x80000000);

    static const Color inversePrimaryLight = Color(0xFF8CE376);

    // Dark scheme helper colors
    static const Color onPrimaryDark = Color(0xFF052E16);
    static const Color primaryContainerDark = Color(0xFF0D3D1F);
    static const Color onPrimaryContainerDark = Color(0xFF22C55E);

    static const Color secondaryDark = Color(0xFF9CA3AF);
    static const Color onSecondaryDark = Color(0xFF111827);
    static const Color secondaryContainerDark = Color(0xFF1E2A38);
    static const Color onSecondaryContainerDark = Color(0xFFE2E8F0);

    static const Color tertiaryDark = Color(0xFF34D399);
    static const Color onTertiaryDark = Color(0xFF052E16);
    static const Color tertiaryContainerDark = Color(0xFF083D2A);
    static const Color onTertiaryContainerDark = Color(0xFFA7F3D0);

    static const Color errorDark = Color(0xFFFF4444);
    static const Color onErrorDark = Color(0xFF2D0000);
    static const Color errorContainerDark = Color(0xFF3D0000);
    static const Color onErrorContainerDark = Color(0xFFFFCDD2);

    static const Color onSurfaceVariantDark = Color(0xFFB0B8C4);
    static const Color outlineDark = Color(0xFF4A5568);
    static const Color outlineVariantDark = Color(0xFF2D3748);
    static const Color shadowDark = Color(0x80000000);

  // ── Light ColorScheme ─────────────────────────────────────────────────────
  static ColorScheme get lightScheme {
    return const ColorScheme(
      brightness: Brightness.light,

            primary: primary,
            onPrimary: onPrimary,
            primaryContainer: primaryContainerLight, // very light green
            onPrimaryContainer: onPrimaryContainerLight, // very dark green

            secondary: secondary,
            onSecondary: onSecondary,
            secondaryContainer: secondaryContainerLight,
            onSecondaryContainer: onSecondaryContainerLight,

            tertiary: success,
            onTertiary: onPrimary,
            tertiaryContainer: tertiaryContainerLight,
            onTertiaryContainer: onTertiaryContainerLight,

            error: error,
            onError: onPrimary,
            errorContainer: errorContainerLight,
            onErrorContainer: onErrorContainerLight,

            surface: lightSurface,
            onSurface: lightTextPrimary,
            onSurfaceVariant: lightTextSecondary,

            outline: outlineLight, // clean light borders
            outlineVariant: outlineVariantLight,

            shadow: shadowLight, // light, subtle shadows
            scrim: scrimLight,

            inverseSurface: darkSurface,
            onInverseSurface: darkTextPrimary,
            inversePrimary: inversePrimaryLight,

            surfaceTint: lightSurface, // Prevents material 3 tinting pure white cards
    );
  }

  // ── Dark ColorScheme ──────────────────────────────────────────────────────
  static ColorScheme get darkScheme {
    return const ColorScheme(
            brightness: Brightness.dark,
            primary: primary,
            onPrimary: onPrimaryDark,
            primaryContainer: primaryContainerDark,
            onPrimaryContainer: onPrimaryContainerDark,

            secondary: secondaryDark,
            onSecondary: onSecondaryDark,
            secondaryContainer: secondaryContainerDark,
            onSecondaryContainer: onSecondaryContainerDark,

            tertiary: tertiaryDark,
            onTertiary: onTertiaryDark,
            tertiaryContainer: tertiaryContainerDark,
            onTertiaryContainer: onTertiaryContainerDark,

            error: errorDark,
            onError: onErrorDark,
            errorContainer: errorContainerDark,
            onErrorContainer: onErrorContainerDark,

            surface: darkSurface,
            onSurface: darkTextPrimary,
            onSurfaceVariant: onSurfaceVariantDark,

            outline: outlineDark,
            outlineVariant: outlineVariantDark,

            shadow: shadowDark,
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

  static Color get outlineVariant => borderVariant();

  static Color errorContainerColor([Brightness? brightness]) =>
      (brightness ?? _systemBrightness) == Brightness.dark
          ? darkScheme.errorContainer
          : lightScheme.errorContainer;

  static Color get errorContainer => errorContainerColor();

  static Color onErrorContainerColor([Brightness? brightness]) =>
      (brightness ?? _systemBrightness) == Brightness.dark
          ? darkScheme.onErrorContainer
          : lightScheme.onErrorContainer;

  static Color get onErrorContainer => onErrorContainerColor();

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
        'PENDING' => warning,
        'PENDING_PAYMENT' => warning,
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

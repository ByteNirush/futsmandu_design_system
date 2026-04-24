import 'package:flutter/material.dart';

class AppFontWeights {
  AppFontWeights._();

  static const FontWeight light    = FontWeight.w300;
  static const FontWeight regular  = FontWeight.w400;
  static const FontWeight medium   = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold     = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}

class AppTypographyScale {
  AppTypographyScale._();

  static double fromWidth(double width) {
    final normalized = ((width - 360) / 70).clamp(0.0, 1.0);
    return 0.97 + ((1.06 - 0.97) * normalized);
  }

  static double fromContext(BuildContext context) {
    final mediaQuery = MediaQuery.maybeOf(context);
    if (mediaQuery == null) return 1;
    final widthScale = fromWidth(mediaQuery.size.width);
    final accessibilityScale = mediaQuery.textScaler.scale(1).clamp(1.0, 1.3);
    return widthScale * accessibilityScale;
  }
}

class AppTypography {
  AppTypography._();

  static TextStyle _style({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    double height = 1.4,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // ── Contextual helpers (use inside widgets that have BuildContext) ─────────

  static TextStyle heading(BuildContext context, ColorScheme scheme, {Color? color}) {
    final s = AppTypographyScale.fromContext(context);
    return _style(
      fontSize: 28 * s,
      fontWeight: AppFontWeights.bold,
      color: color ?? scheme.onSurface,
      height: 1.22,
      letterSpacing: -0.5,
    );
  }

  static TextStyle subHeading(BuildContext context, ColorScheme scheme, {Color? color}) {
    final s = AppTypographyScale.fromContext(context);
    return _style(
      fontSize: 22 * s,
      fontWeight: AppFontWeights.semiBold,
      color: color ?? scheme.onSurface,
      height: 1.28,
      letterSpacing: -0.3,
    );
  }

  static TextStyle body(BuildContext context, ColorScheme scheme, {Color? color}) {
    final s = AppTypographyScale.fromContext(context);
    return _style(
      fontSize: 15 * s,
      fontWeight: AppFontWeights.regular,
      color: color ?? scheme.onSurface,
      height: 1.55,
    );
  }

  static TextStyle caption(BuildContext context, ColorScheme scheme, {Color? color}) {
    final s = AppTypographyScale.fromContext(context);
    return _style(
      fontSize: 12 * s,
      fontWeight: AppFontWeights.regular,
      color: color ?? scheme.onSurfaceVariant,
      height: 1.4,
      letterSpacing: 0.1,
    );
  }

  static TextStyle button(BuildContext context, ColorScheme scheme, {Color? color}) {
    final s = AppTypographyScale.fromContext(context);
    return _style(
      fontSize: 14 * s,
      fontWeight: AppFontWeights.semiBold,
      color: color ?? scheme.onPrimary,
      height: 1.3,
      letterSpacing: 0.1,
    );
  }

  // ── TextTheme (used by AppTheme) ──────────────────────────────────────────
  static TextTheme textTheme(ColorScheme scheme, {double scale = 1}) {
    // Intentional type scale:
    //   • Negative letter-spacing on large sizes → tighter, more refined
    //   • Height tuned per role — tighter for display, looser for body
    //   • Weights: display/headline = bold, title = semiBold, body = regular
    return TextTheme(
      // Display
      displayLarge: _style(fontSize: 52 * scale, fontWeight: AppFontWeights.bold,    color: scheme.onSurface, height: 1.08, letterSpacing: -0.8),
      displayMedium: _style(fontSize: 42 * scale, fontWeight: AppFontWeights.bold,   color: scheme.onSurface, height: 1.10, letterSpacing: -0.5),
      displaySmall: _style(fontSize: 34 * scale, fontWeight: AppFontWeights.bold,    color: scheme.onSurface, height: 1.14, letterSpacing: -0.3),

      // Headline
      headlineLarge: _style(fontSize: 28 * scale, fontWeight: AppFontWeights.bold,   color: scheme.onSurface, height: 1.20, letterSpacing: -0.4),
      headlineMedium: _style(fontSize: 24 * scale, fontWeight: AppFontWeights.bold,  color: scheme.onSurface, height: 1.24, letterSpacing: -0.3),
      headlineSmall: _style(fontSize: 20 * scale, fontWeight: AppFontWeights.bold,   color: scheme.onSurface, height: 1.28, letterSpacing: -0.2),

      // Title — semi-bold, tighter than body
      titleLarge: _style(fontSize: 18 * scale, fontWeight: AppFontWeights.semiBold,  color: scheme.onSurface, height: 1.30, letterSpacing: -0.2),
      titleMedium: _style(fontSize: 16 * scale, fontWeight: AppFontWeights.semiBold, color: scheme.onSurface, height: 1.40, letterSpacing: -0.1),
      titleSmall: _style(fontSize: 14 * scale, fontWeight: AppFontWeights.semiBold,  color: scheme.onSurface, height: 1.40, letterSpacing: 0.0),

      // Body — readable, relaxed line height
      bodyLarge: _style(fontSize: 16 * scale, fontWeight: AppFontWeights.regular,    color: scheme.onSurface,        height: 1.60),
      bodyMedium: _style(fontSize: 15 * scale, fontWeight: AppFontWeights.regular,   color: scheme.onSurface,        height: 1.55),
      bodySmall: _style(fontSize: 13 * scale, fontWeight: AppFontWeights.regular,    color: scheme.onSurfaceVariant, height: 1.45),

      // Label — semibold, used for chips, buttons, nav items
      labelLarge: _style(fontSize: 14 * scale, fontWeight: AppFontWeights.semiBold,  color: scheme.onPrimary,        height: 1.30, letterSpacing: 0.1),
      labelMedium: _style(fontSize: 12 * scale, fontWeight: AppFontWeights.semiBold, color: scheme.onSurface,        height: 1.30, letterSpacing: 0.2),
      labelSmall: _style(fontSize: 11 * scale, fontWeight: AppFontWeights.medium,    color: scheme.onSurfaceVariant, height: 1.30, letterSpacing: 0.3),
    );
  }
}
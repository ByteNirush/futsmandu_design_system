import 'package:flutter/material.dart';

class AppFontWeights {
  AppFontWeights._();

  static const FontWeight regular = FontWeight.w400;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}

class AppTypographyScale {
  AppTypographyScale._();

  static double fromWidth(double width) {
    final normalized = ((width - 360) / 70).clamp(0.0, 1.0);
    return 0.94 + ((1.06 - 0.94) * normalized);
  }

  static double fromContext(BuildContext context) {
    final mediaQuery = MediaQuery.maybeOf(context);
    if (mediaQuery == null) {
      return 1;
    }

    final widthScale = fromWidth(mediaQuery.size.width);
    final accessibilityScale = mediaQuery.textScaler.scale(1).clamp(1.0, 1.3);
    return widthScale * accessibilityScale;
  }
}

class AppTypography {
  AppTypography._();

  static TextStyle _poppinsStyle({
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

  static TextStyle heading(
    BuildContext context,
    ColorScheme scheme, {
    Color? color,
  }) {
    final scale = AppTypographyScale.fromContext(context);
    return _poppinsStyle(
      fontSize: 34 * scale,
      fontWeight: AppFontWeights.extraBold,
      color: color ?? scheme.onSurface,
      height: 1.18,
      letterSpacing: -0.2,
    );
  }

  static TextStyle subHeading(
    BuildContext context,
    ColorScheme scheme, {
    Color? color,
  }) {
    final scale = AppTypographyScale.fromContext(context);
    return _poppinsStyle(
      fontSize: 22 * scale,
      fontWeight: AppFontWeights.bold,
      color: color ?? scheme.onSurface,
      height: 1.24,
      letterSpacing: -0.1,
    );
  }

  static TextStyle body(
    BuildContext context,
    ColorScheme scheme, {
    Color? color,
  }) {
    final scale = AppTypographyScale.fromContext(context);
    return _poppinsStyle(
      fontSize: 15 * scale,
      fontWeight: AppFontWeights.regular,
      color: color ?? scheme.onSurface,
      height: 1.45,
    );
  }

  static TextStyle caption(
    BuildContext context,
    ColorScheme scheme, {
    Color? color,
  }) {
    final scale = AppTypographyScale.fromContext(context);
    return _poppinsStyle(
      fontSize: 12 * scale,
      fontWeight: AppFontWeights.regular,
      color: color ?? scheme.onSurfaceVariant,
      height: 1.3,
      letterSpacing: 0.2,
    );
  }

  static TextStyle button(
    BuildContext context,
    ColorScheme scheme, {
    Color? color,
  }) {
    final scale = AppTypographyScale.fromContext(context);
    return _poppinsStyle(
      fontSize: 15 * scale,
      fontWeight: AppFontWeights.semiBold,
      color: color ?? scheme.onPrimary,
      height: 1.2,
      letterSpacing: 0.25,
    );
  }

  static TextTheme textTheme(
    ColorScheme scheme, {
    double scale = 1,
  }) {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      brightness: scheme.brightness,
      fontFamily: 'Poppins',
    ).textTheme;

    return base.copyWith(
      displayLarge: _poppinsStyle(
        fontSize: 57 * scale,
        fontWeight: AppFontWeights.bold,
        color: scheme.onSurface,
        height: 1.12,
        letterSpacing: -0.25,
      ),
      displayMedium: _poppinsStyle(
        fontSize: 45 * scale,
        fontWeight: AppFontWeights.bold,
        color: scheme.onSurface,
        height: 1.16,
      ),
      displaySmall: _poppinsStyle(
        fontSize: 36 * scale,
        fontWeight: AppFontWeights.bold,
        color: scheme.onSurface,
        height: 1.22,
      ),
      headlineLarge: _poppinsStyle(
        fontSize: 32 * scale,
        fontWeight: AppFontWeights.extraBold,
        color: scheme.onSurface,
        height: 1.25,
      ),
      headlineMedium: _poppinsStyle(
        fontSize: 28 * scale,
        fontWeight: AppFontWeights.extraBold,
        color: scheme.onSurface,
        height: 1.29,
      ),
      headlineSmall: _poppinsStyle(
        fontSize: 24 * scale,
        fontWeight: AppFontWeights.bold,
        color: scheme.onSurface,
        height: 1.33,
      ),
      titleLarge: _poppinsStyle(
        fontSize: 22 * scale,
        fontWeight: AppFontWeights.semiBold,
        color: scheme.onSurface,
        height: 1.27,
      ),
      titleMedium: _poppinsStyle(
        fontSize: 16 * scale,
        fontWeight: AppFontWeights.semiBold,
        color: scheme.onSurface,
        height: 1.5,
        letterSpacing: 0.15,
      ),
      titleSmall: _poppinsStyle(
        fontSize: 14 * scale,
        fontWeight: AppFontWeights.semiBold,
        color: scheme.onSurface,
        height: 1.43,
        letterSpacing: 0.1,
      ),
      bodyLarge: _poppinsStyle(
        fontSize: 16 * scale,
        fontWeight: AppFontWeights.regular,
        color: scheme.onSurface,
        height: 1.5,
      ),
      bodyMedium: _poppinsStyle(
        fontSize: 14 * scale,
        fontWeight: AppFontWeights.regular,
        color: scheme.onSurface,
        height: 1.43,
      ),
      bodySmall: _poppinsStyle(
        fontSize: 12 * scale,
        fontWeight: AppFontWeights.regular,
        color: scheme.onSurfaceVariant,
        height: 1.33,
      ),
      labelLarge: _poppinsStyle(
        fontSize: 14 * scale,
        fontWeight: AppFontWeights.semiBold,
        color: scheme.onPrimary,
        height: 1.43,
        letterSpacing: 0.1,
      ),
      labelMedium: _poppinsStyle(
        fontSize: 12 * scale,
        fontWeight: AppFontWeights.semiBold,
        color: scheme.onSurface,
        height: 1.33,
        letterSpacing: 0.5,
      ),
      labelSmall: _poppinsStyle(
        fontSize: 11 * scale,
        fontWeight: AppFontWeights.semiBold,
        color: scheme.onSurfaceVariant,
        height: 1.3,
        letterSpacing: 0.5,
      ),
    );
  }
}

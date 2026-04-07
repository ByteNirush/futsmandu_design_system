import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  static TextStyle heading(
    BuildContext context,
    ColorScheme scheme, {
    Color? color,
  }) {
    final scale = AppTypographyScale.fromContext(context);
    return GoogleFonts.poppins(
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
    return GoogleFonts.poppins(
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
    return GoogleFonts.poppins(
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
    return GoogleFonts.poppins(
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
    return GoogleFonts.poppins(
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
    final base = GoogleFonts.poppinsTextTheme();

    return base.copyWith(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 36 * scale,
        fontWeight: AppFontWeights.extraBold,
        color: scheme.onSurface,
        height: 1.16,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 34 * scale,
        fontWeight: AppFontWeights.extraBold,
        color: scheme.onSurface,
        height: 1.18,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 22 * scale,
        fontWeight: AppFontWeights.bold,
        color: scheme.onSurface,
        height: 1.24,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16 * scale,
        fontWeight: AppFontWeights.regular,
        color: scheme.onSurface,
        height: 1.45,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14 * scale,
        fontWeight: AppFontWeights.regular,
        color: scheme.onSurface,
        height: 1.42,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12 * scale,
        fontWeight: AppFontWeights.regular,
        color: scheme.onSurfaceVariant,
        height: 1.3,
      ),
      labelLarge: GoogleFonts.poppins(
        fontSize: 16 * scale,
        fontWeight: AppFontWeights.semiBold,
        color: scheme.onPrimary,
        height: 1.2,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 14 * scale,
        fontWeight: AppFontWeights.semiBold,
        color: scheme.onSurface,
        height: 1.2,
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 13 * scale,
        fontWeight: AppFontWeights.semiBold,
        color: scheme.onSurfaceVariant,
        height: 1.2,
      ),
    );
  }
}

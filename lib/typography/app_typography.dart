import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Shared responsive typography scale based on a 390px mobile artboard.
class AppTypographyScale {
  const AppTypographyScale._(this.screenScale, this.userScale);

  static const AppTypographyScale base = AppTypographyScale._(1, 1);

  final double screenScale;
  final double userScale;

  static AppTypographyScale fromContext(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final screenScale = (width / 390).clamp(0.9, 1.15);
    final userScale = (MediaQuery.textScalerOf(context).scale(16) / 16).clamp(
      0.9,
      1.4,
    );
    return AppTypographyScale._(screenScale, userScale);
  }

  double scaled(
    double baseSize, {
    double minFactor = 0.9,
    double maxFactor = 1.2,
  }) {
    final mixed = lerpDouble(1, screenScale, 0.7) ?? 1;
    final combined = mixed * userScale;
    final minSize = baseSize * minFactor;
    final maxSize = baseSize * maxFactor;
    return (baseSize * combined).clamp(minSize, maxSize);
  }
}

class AppTypography {
  const AppTypography({required this.colorScheme, required this.scale});

  final ColorScheme colorScheme;
  final AppTypographyScale scale;

  Color get textPrimary => colorScheme.onSurface;
  Color get textSecondary => colorScheme.onSurfaceVariant;

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  TextStyle _style({
    required double size,
    required FontWeight weight,
    required Color color,
    required double height,
    double letterSpacing = 0,
  }) {
    return GoogleFonts.poppins(
      fontSize: scale.scaled(size),
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  /// Heading: Poppins ExtraBold, scales into ~32-36 range.
  TextStyle get heading => _style(
    size: 34,
    weight: extraBold,
    color: textPrimary,
    height: 1.2,
    letterSpacing: -0.25,
  );

  /// Sub heading: Poppins Bold, scales into ~20-24 range.
  TextStyle get subHeading => _style(
    size: 22,
    weight: bold,
    color: textPrimary,
    height: 1.28,
    letterSpacing: -0.1,
  );

  /// Body: Poppins Regular, scales into ~14-16 range.
  TextStyle get body =>
      _style(size: 15, weight: regular, color: textPrimary, height: 1.5);

  TextStyle get caption => _style(
    size: 12,
    weight: regular,
    color: textSecondary,
    height: 1.35,
    letterSpacing: 0.2,
  );

  TextStyle get buttonText => _style(
    size: 15,
    weight: semiBold,
    color: colorScheme.onPrimary,
    height: 1.2,
    letterSpacing: 0.2,
  );

  TextStyle get label => _style(
    size: 13,
    weight: medium,
    color: textSecondary,
    height: 1.3,
    letterSpacing: 0.15,
  );

  static TextTheme textTheme(ColorScheme colorScheme) {
    final typography = AppTypography(
      colorScheme: colorScheme,
      scale: AppTypographyScale.base,
    );

    final base = GoogleFonts.poppinsTextTheme();
    return base.copyWith(
      displaySmall: typography.heading,
      headlineMedium: typography.heading,
      headlineSmall: typography.subHeading,
      titleLarge: typography.subHeading,
      titleMedium: typography.body.copyWith(fontWeight: medium),
      titleSmall: typography.body.copyWith(fontWeight: medium),
      bodyLarge: typography.body,
      bodyMedium: typography.body.copyWith(fontSize: 14, height: 1.45),
      bodySmall: typography.caption,
      labelLarge: typography.buttonText,
      labelMedium: typography.label,
      labelSmall: typography.caption,
    );
  }
}

extension AppTypographyContextX on BuildContext {
  AppTypography get appTypography => AppTypography(
    colorScheme: Theme.of(this).colorScheme,
    scale: AppTypographyScale.fromContext(this),
  );
}

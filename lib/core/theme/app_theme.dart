import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_elevation.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    return _buildTheme(AppColors.lightScheme);
  }

  static ThemeData dark() {
    return _buildTheme(AppColors.darkScheme);
  }

  static ThemeData _buildTheme(ColorScheme scheme) {
    final baseTextTheme = AppTypography.textTheme(scheme);

    return ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.brightness == Brightness.light
          ? AppColors.lightBackground
          : AppColors.darkBackground,
      textTheme: baseTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.brightness == Brightness.light
            ? AppColors.lightBackground
            : AppColors.darkBackground,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          disabledBackgroundColor: scheme.outline.withValues(alpha: 0.3),
          disabledForegroundColor: scheme.onSurfaceVariant,
          minimumSize: const Size(double.infinity, 48),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          textStyle: baseTextTheme.labelLarge,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.large),
          elevation: AppElevation.level1,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          minimumSize: const Size(double.infinity, 48),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          textStyle: baseTextTheme.labelLarge,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.large),
          side: BorderSide(color: scheme.outline.withValues(alpha: 0.9)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          textStyle: baseTextTheme.labelMedium,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surface.withValues(alpha: 0.88),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        labelStyle: baseTextTheme.bodyMedium?.copyWith(color: scheme.onSurface),
        hintStyle: baseTextTheme.bodyMedium?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
        border: const OutlineInputBorder(borderRadius: AppRadius.medium),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: BorderSide(color: scheme.outline, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: BorderSide(color: scheme.primary, width: 1.8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: BorderSide(color: scheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: BorderSide(color: scheme.error, width: 1.6),
        ),
      ),
      cardTheme: CardThemeData(
        color: scheme.surface,
        elevation: AppElevation.level1,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.large),
        margin: EdgeInsets.zero,
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outline.withValues(alpha: 0.35),
        thickness: 1,
        space: AppSpacing.lg,
      ),
    );
  }
}

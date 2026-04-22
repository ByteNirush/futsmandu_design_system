import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import 'app_role.dart';

/// A clean, borderless container for auth form content.
///
/// Layout (top to bottom):
///   1. [title] in role accent colour (centered, large)
///   2. [subtitle] in muted secondary text (centered)
///   3. [errorWidget] (if provided)
///   4. 24 px gap
///   5. [child] — the form fields and action buttons
class AuthCard extends StatelessWidget {
  const AuthCard({
    super.key,
    required this.role,
    required this.title,
    required this.subtitle,
    required this.child,
    this.errorWidget,
  });

  final AppRole role;
  final String title;
  final String subtitle;

  /// The form body — fields, buttons, and any secondary links.
  final Widget child;

  /// An optional inline error banner shown between the subtitle and the form.
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final accentColor = cs.primary;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Title - centered, large, bold
        Text(
          title,
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall?.copyWith(
            color: accentColor,
            fontWeight: AppFontWeights.bold,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        // Subtitle - centered, muted
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(
            color: cs.onSurfaceVariant,
          ),
        ),
        if (errorWidget != null) ...[
          const SizedBox(height: AppSpacing.lg),
          errorWidget!,
        ],
        const SizedBox(height: AppSpacing.xl),
        child,
      ],
    );
  }
}

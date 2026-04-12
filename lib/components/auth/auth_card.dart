import 'package:flutter/material.dart';

import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../text/custom_text.dart';
import 'app_role.dart';

/// A surface card that wraps the form content of every auth screen.
///
/// Visual differentiation between roles is applied via a 4 px left accent
/// border (teal for Player, navy for Owner) and the title colour.
///
/// Layout (top to bottom inside the card):
///   1. [title] in role accent colour
///   2. [subtitle] in muted secondary text
///   3. [errorWidget] (if provided)
///   4. 16 px gap
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
    final accentColor = role.accentColor(cs);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: AppRadius.extraLarge,
        border: Border.all(
          color: cs.outlineVariant.withValues(alpha: 0.55),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: cs.shadow.withValues(alpha: 0.08),
            blurRadius: 18,
            spreadRadius: 0,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title,
            variant: CustomTextVariant.subHeading,
            color: accentColor,
          ),
          const SizedBox(height: AppSpacing.xs),
          CustomText(
            subtitle,
            variant: CustomTextVariant.body,
            color: cs.onSurfaceVariant,
          ),
          if (errorWidget != null) ...[
            const SizedBox(height: AppSpacing.md),
            errorWidget!,
          ],
          const SizedBox(height: AppSpacing.lg),
          child,
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../text/custom_text.dart';

/// Standalone title + subtitle header used on auth screens that don't use
/// a card layout (e.g. OTP verification).
///
/// For card-based screens use [AuthCard] which embeds its own header.
class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title, variant: CustomTextVariant.heading),
        const SizedBox(height: AppSpacing.xs),
        CustomText(
          subtitle,
          variant: CustomTextVariant.body,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ],
    );
  }
}

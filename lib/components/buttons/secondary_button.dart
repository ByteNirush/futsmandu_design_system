import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../text/custom_text.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.icon,
    this.fullWidth = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: AppSpacing.sm),
          ],
          CustomText(
            label,
            variant: CustomTextVariant.button,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

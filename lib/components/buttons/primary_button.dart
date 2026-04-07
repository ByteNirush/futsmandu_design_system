import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../text/custom_text.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.icon,
    this.isLoading = false,
    this.fullWidth = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool isLoading;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: Row(
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading)
            const SizedBox(
              height: 18,
              width: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          if (isLoading) const SizedBox(width: AppSpacing.sm),
          if (!isLoading && icon != null) ...[
            icon!,
            const SizedBox(width: AppSpacing.sm),
          ],
          CustomText(
            label,
            variant: CustomTextVariant.button,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      ),
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}

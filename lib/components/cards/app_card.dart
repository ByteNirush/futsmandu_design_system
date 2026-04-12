import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    super.key,
    this.padding = AppSpacing.card,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cardTheme = Theme.of(context).cardTheme;
    final borderRadius = cardTheme.shape is RoundedRectangleBorder
        ? (cardTheme.shape as RoundedRectangleBorder).borderRadius
        : BorderRadius.zero;

    return Card(
      // clipBehavior is set on the theme; InkWell splash respects it.
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius is BorderRadius ? borderRadius : null,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

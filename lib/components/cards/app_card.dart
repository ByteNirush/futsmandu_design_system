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
    final borderRadiusGeometry =
        (Theme.of(context).cardTheme.shape as RoundedRectangleBorder?)
            ?.borderRadius;

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadiusGeometry is BorderRadius
            ? borderRadiusGeometry
            : BorderRadius.zero,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

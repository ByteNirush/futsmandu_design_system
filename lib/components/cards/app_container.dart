import 'package:flutter/material.dart';

import '../../core/theme/app_elevation.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    required this.child,
    super.key,
    this.padding = AppSpacing.card,
    this.backgroundColor,
    this.border,
    this.useShadow = false,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final BoxBorder? border;
  final bool useShadow;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? scheme.surface,
        borderRadius: AppRadius.large,
        border: border,
        boxShadow: useShadow ? AppElevation.shadowLevel1(scheme.shadow) : null,
      ),
      child: child,
    );
  }
}

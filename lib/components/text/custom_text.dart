import 'package:flutter/material.dart';

import '../../core/theme/app_typography.dart';

enum CustomTextVariant {
  heading,
  subHeading,
  body,
  caption,
  button,
}

class CustomText extends StatelessWidget {
  const CustomText(
    this.data, {
    super.key,
    this.variant = CustomTextVariant.body,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
  });

  final String data;
  final CustomTextVariant variant;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    TextStyle style;
    switch (variant) {
      case CustomTextVariant.heading:
        style = AppTypography.heading(context, scheme);
      case CustomTextVariant.subHeading:
        style = AppTypography.subHeading(context, scheme);
      case CustomTextVariant.caption:
        style = AppTypography.caption(context, scheme);
      case CustomTextVariant.button:
        style = AppTypography.button(context, scheme);
      case CustomTextVariant.body:
        style = AppTypography.body(context, scheme);
    }

    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style.copyWith(
        color: color ?? style.color,
        fontWeight: fontWeight ?? style.fontWeight,
      ),
    );
  }
}

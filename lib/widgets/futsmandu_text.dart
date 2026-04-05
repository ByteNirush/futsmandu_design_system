import 'package:flutter/material.dart';

import '../typography/app_typography.dart';

enum FutsmanduTextVariant {
  heading,
  subHeading,
  body,
  caption,
  label,
}

class FutsmanduText extends StatelessWidget {
  const FutsmanduText(
    this.data, {
    super.key,
    this.variant = FutsmanduTextVariant.body,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  });

  final String data;
  final FutsmanduTextVariant variant;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final typography = context.appTypography;
    final style = switch (variant) {
      FutsmanduTextVariant.heading => typography.heading,
      FutsmanduTextVariant.subHeading => typography.subHeading,
      FutsmanduTextVariant.body => typography.body,
      FutsmanduTextVariant.caption => typography.caption,
      FutsmanduTextVariant.label => typography.label,
    };

    return Text(
      data,
      style: color == null ? style : style.copyWith(color: color),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

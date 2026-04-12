import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

/// A themed 6-digit OTP pin input using design system color tokens.
///
/// All three states (default, focused, submitted) respond to the current
/// [ThemeData] so the widget is automatically correct in both light and
/// dark mode.
class OtpPinInput extends StatelessWidget {
  const OtpPinInput({
    super.key,
    this.controller,
    this.length = 6,
    this.onCompleted,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final int length;
  final void Function(String)? onCompleted;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    const pinRadius = BorderRadius.all(Radius.circular(12));
    final baseText = theme.textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.bold,
    );

    final defaultTheme = PinTheme(
      width: 50,
      height: 60,
      textStyle: baseText,
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
        border: Border.all(color: cs.outline, width: 1.5),
        borderRadius: pinRadius,
      ),
    );

    return Pinput(
      controller: controller,
      length: length,
      enabled: enabled,
      keyboardType: TextInputType.number,
      onCompleted: onCompleted,
      defaultPinTheme: defaultTheme,
      focusedPinTheme: defaultTheme.copyWith(
        decoration: BoxDecoration(
          color: cs.surface,
          border: Border.all(color: cs.primary, width: 2.5),
          borderRadius: pinRadius,
        ),
      ),
      submittedPinTheme: defaultTheme.copyWith(
        decoration: BoxDecoration(
          color: cs.surfaceContainerHighest,
          border: Border.all(color: cs.primary, width: 1.5),
          borderRadius: pinRadius,
        ),
      ),
    );
  }
}

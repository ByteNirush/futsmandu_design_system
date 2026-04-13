import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

/// A themed 6-digit OTP pin input using design system color tokens.
/// Highly polished with subtle gray borders and a distinct glowing active state.
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
      color: cs.onSurface,
    );

    final defaultTheme = PinTheme(
      width: 52,
      height: 60,
      textStyle: baseText,
      decoration: BoxDecoration(
        color: cs.surface,
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.8), width: 1.5),
        borderRadius: pinRadius,
      ),
    );

    return Pinput(
      controller: controller,
      length: length,
      enabled: enabled,
      keyboardType: TextInputType.number,
      onCompleted: onCompleted,
      cursor: Container(
        height: 24,
        width: 2,
        color: cs.primary,
        margin: const EdgeInsets.only(bottom: 2),
      ),
      defaultPinTheme: defaultTheme,
      focusedPinTheme: defaultTheme.copyWith(
        decoration: BoxDecoration(
          color: cs.surface,
          border: Border.all(color: cs.primary, width: 2),
          borderRadius: pinRadius,
          boxShadow: [
            BoxShadow(
              color: cs.primary.withValues(alpha: 0.25),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
      ),
      submittedPinTheme: defaultTheme.copyWith(
        decoration: BoxDecoration(
          color: cs.surfaceContainerHighest.withValues(alpha: 0.4),
          border: Border.all(color: cs.primary.withValues(alpha: 0.6), width: 1.5),
          borderRadius: pinRadius,
        ),
      ),
      errorPinTheme: defaultTheme.copyWith(
        decoration: BoxDecoration(
          color: cs.errorContainer.withValues(alpha: 0.3),
          border: Border.all(color: cs.error, width: 1.5),
          borderRadius: pinRadius,
        ),
      ),
    );
  }
}

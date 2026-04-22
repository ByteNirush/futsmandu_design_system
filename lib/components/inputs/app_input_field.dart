import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A fully themed text-input field for use across both apps.
///
/// Compared with [AppTextField] this widget:
/// - Accepts [prefixIcon] as an [IconData] for a more ergonomic call-site.
/// - Supports [isPassword] which adds a visibility-toggle suffix icon.
/// - Uses `label` / `hint` parameter names (matching the rest of the codebase).
///
/// All styling is inherited from [InputDecorationTheme] in [AppTheme], so the
/// field responds to light/dark mode automatically.
class AppInputField extends StatefulWidget {
  const AppInputField({
    super.key,
    this.controller,
    required this.label,
    this.showLabelAboveField = false,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    this.textInputAction,
    this.maxLength,
    this.showCounter = true,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.minLines,
    this.autofocus = false,
    this.focusNode,
    this.inputFormatters,
  }) : assert(
          !(isPassword && maxLines != 1),
          'Password fields must have maxLines == 1.',
        );

  final TextEditingController? controller;
  final String label;

  /// Renders the label as static text above the field instead of a floating
  /// label inside the border.
  final bool showLabelAboveField;
  final String? hint;

  /// Leading icon shown inside the field. Receives [ColorScheme.onSurfaceVariant]
  /// as its colour so it adapts to light/dark mode.
  final IconData? prefixIcon;

  /// An explicit suffix widget. Ignored when [isPassword] is `true` (the
  /// visibility toggle is shown instead).
  final Widget? suffixIcon;

  final TextInputType? keyboardType;

  /// When `true` the text is obscured and a visibility toggle icon is added.
  final bool isPassword;

  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final int? maxLength;

  /// Set to `false` to hide the character counter below the field.
  final bool showCounter;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final int maxLines;
  final int? minLines;
  final bool autofocus;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    Widget? resolvedSuffix;
    if (widget.isPassword) {
      resolvedSuffix = IconButton(
        icon: Icon(
          _obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          color: cs.onSurfaceVariant,
          size: 20,
        ),
        onPressed: () => setState(() => _obscure = !_obscure),
        tooltip: _obscure ? 'Show password' : 'Hide password',
      );
    } else {
      resolvedSuffix = widget.suffixIcon;
    }

    final field = TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && _obscure,
      validator: widget.validator,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        labelText: widget.showLabelAboveField ? null : widget.label,
        hintText: widget.hint,
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: cs.onSurfaceVariant)
            : null,
        suffixIcon: resolvedSuffix,
        counterText: widget.showCounter ? null : '',
      ),
    );

    if (!widget.showLabelAboveField) return field;

    final labelStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: cs.onSurface,
      fontWeight: FontWeight.w500,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: labelStyle),
        const SizedBox(height: 6),
        field,
      ],
    );
  }
}

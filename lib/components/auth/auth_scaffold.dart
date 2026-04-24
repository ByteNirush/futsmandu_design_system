import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../common/app_logo.dart';
import 'app_role.dart';

/// The shared screen scaffold for every auth screen in both apps.
///
/// Renders:
/// - A 4 px role-accent strip across the very top (teal for Player, navy for
///   Owner) giving an immediate visual identity cue.
/// - A compact Futsmandu logo header.
/// - A fixed single-page layout (no scrolling) with keyboard-aware compaction
///   of header spacing and logo size.
/// - Optional back [AppBar] for sub-flows (OTP, ForgotPassword, Reset).
///
/// Pass the form card or standalone content as [child].
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.role,
    required this.child,
    this.showAppBar = false,
    this.allowScroll = true,
    this.showAccentStrip = true,
  });

  final AppRole role;
  final Widget child;

  /// When `true` an [AppBar] with a back arrow is shown (sub-flows only).
  final bool showAppBar;

  /// When `false`, vertical scrolling is disabled for fixed pages like login.
  final bool allowScroll;

  /// When `false`, hides the 4px role-accent strip at the top.
  final bool showAccentStrip;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final accentColor = role.accentColor(cs);
    final viewInsets = MediaQuery.of(context).viewInsets;
    final keyboardVisible = viewInsets.bottom > 0;

    final topGap = keyboardVisible ? 0.0 : AppSpacing.xs;
    final logoSize = keyboardVisible ? 32.0 : 48.0;
    final contentTopGap = keyboardVisible ? AppSpacing.xxs : AppSpacing.xs;
    final bottomPadding = viewInsets.bottom + AppSpacing.sm;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: showAppBar
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Role accent strip ──────────────────────────────────────────
          if (showAccentStrip) Container(height: 4, color: accentColor),
          Expanded(
            child: SafeArea(
              // When showAppBar is true the AppBar already handles the top
              // safe-area inset.
              top: !showAppBar,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: allowScroll
                      ? const ClampingScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                    keyboardDismissBehavior: allowScroll
                      ? ScrollViewKeyboardDismissBehavior.onDrag
                      : ScrollViewKeyboardDismissBehavior.manual,
                    padding: EdgeInsets.fromLTRB(
                      AppSpacing.pageHorizontal,
                      0,
                      AppSpacing.pageHorizontal,
                      bottomPadding,
                    ),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 360),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 180),
                                curve: Curves.easeOut,
                                height: topGap,
                              ),
                              // Keep the brand visible while compacting when keyboard is open.
                              Center(
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 180),
                                  curve: Curves.easeOut,
                                  child: AppLogo(size: logoSize),
                                ),
                              ),
                              SizedBox(height: contentTopGap),
                              child,
                              const SizedBox(height: AppSpacing.md),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

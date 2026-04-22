import 'package:flutter/widgets.dart';

class AppSpacing {
  AppSpacing._();

  // ── 4-pt Base Grid ────────────────────────────────────────────────────────
  static const double xxs  = 4;    // micro gap
  static const double xs   = 8;    // tight inline gap
  static const double sm   = 12;   // compact section gap
  static const double md   = 16;   // base component padding
  static const double lg   = 20;   // comfortable spacing
  static const double xl   = 24;   // large spacing
  static const double xxl  = 32;   // section spacing
  static const double xxxl = 40;   // extra large spacing

  // ── Semantic Aliases ──────────────────────────────────────────────────────
  /// Vertical gap between major page sections.
  static const double section = xxl;

  /// Standard horizontal screen inset — use for all screen-edge padding.
  static const double pageHorizontal = 20;

  /// Standard card inner padding.
  static const double cardPadding = md;

  /// Minimum interactive / button height.
  static const double buttonHeight = 48.0;

  // ── EdgeInsets Presets ────────────────────────────────────────────────────
  static const EdgeInsets page = EdgeInsets.symmetric(
    horizontal: pageHorizontal,
    vertical: xl,
  );

  static const EdgeInsets card = EdgeInsets.all(lg);

  static const EdgeInsets screen = EdgeInsets.symmetric(
    horizontal: pageHorizontal,
  );
}

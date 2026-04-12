import 'package:flutter/widgets.dart';

class AppSpacing {
  AppSpacing._();

  // ── 4-pt Base Grid ────────────────────────────────────────────────────────
  static const double xxs  = 2;    // micro gap (hairline spacer)
  static const double xs   = 4;    // tight inline gap
  static const double sm   = 8;    // standard gap
  static const double md   = 12;   // medium gap
  static const double lg   = 16;   // comfortable gap / base padding
  static const double xl   = 24;   // generous spacing
  static const double xxl  = 32;   // large layout spacing
  static const double xxxl = 40;   // extra large

  // ── Semantic Aliases ──────────────────────────────────────────────────────
  /// Vertical gap between major page sections.
  static const double section = 28;

  /// Standard horizontal screen inset — use for all screen-edge padding.
  static const double pageHorizontal = 20;

  /// Standard card inner padding (= lg = 16).
  static const double cardPadding = lg;

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

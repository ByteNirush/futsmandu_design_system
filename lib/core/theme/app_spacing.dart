import 'package:flutter/widgets.dart';

class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;

  static const EdgeInsets page = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: xl,
  );

  static const EdgeInsets card = EdgeInsets.all(lg);
}

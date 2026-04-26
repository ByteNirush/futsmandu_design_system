import 'package:flutter/widgets.dart';

class AppRadius {
  AppRadius._();

  // Premium-friendly rounded system: compact, medium, card, and sheet/dialog.
  static const double xxs = 4;
  static const double sm  = 8;
  static const double md  = 12;
  static const double lg  = 16;
  static const double xl  = 24;
  static const double pill = 999;

  static const BorderRadius extraSmall = BorderRadius.all(Radius.circular(xxs));
  static const BorderRadius small      = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius medium     = BorderRadius.all(Radius.circular(md));
  static const BorderRadius large      = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius extraLarge = BorderRadius.all(Radius.circular(xl));
}

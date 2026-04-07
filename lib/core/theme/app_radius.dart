import 'package:flutter/widgets.dart';

class AppRadius {
  AppRadius._();

  static const double sm = 6;
  static const double md = 10;
  static const double lg = 14;
  static const double xl = 20;

  static const BorderRadius small = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius medium = BorderRadius.all(Radius.circular(md));
  static const BorderRadius large = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius extraLarge = BorderRadius.all(Radius.circular(xl));
}

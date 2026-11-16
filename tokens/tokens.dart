import 'package:flutter/material.dart';

/// Material Design 3 (M3 Expressive) - Dart / Flutter Tokens
abstract final class M3Tokens {
  // Shape Constants
  static const double cornerNone = 0.0;
  static const double cornerExtraSmall = 4.0;
  static const double cornerSmall = 8.0;
  static const double cornerMedium = 12.0;
  static const double cornerLarge = 16.0;
  static const double cornerExtraLarge = 28.0;
  static const double cornerFull = 9999.0;

  static const BorderRadius shapeExtraSmall = BorderRadius.all(Radius.circular(cornerExtraSmall));
  static const BorderRadius shapeSmall = BorderRadius.all(Radius.circular(cornerSmall));
  static const BorderRadius shapeMedium = BorderRadius.all(Radius.circular(cornerMedium));
  static const BorderRadius shapeLarge = BorderRadius.all(Radius.circular(cornerLarge));
  static const BorderRadius shapeExtraLarge = BorderRadius.all(Radius.circular(cornerExtraLarge));
  static const BorderRadius shapeFull = BorderRadius.all(Radius.circular(cornerFull));

  // Motion Durations
  static const Duration durationShort1 = Duration(milliseconds: 50);
  static const Duration durationShort2 = Duration(milliseconds: 100);
  static const Duration durationShort3 = Duration(milliseconds: 150);
  static const Duration durationShort4 = Duration(milliseconds: 200);

  static const Duration durationMedium1 = Duration(milliseconds: 250);
  static const Duration durationMedium2 = Duration(milliseconds: 300);
  static const Duration durationMedium3 = Duration(milliseconds: 350);
  static const Duration durationMedium4 = Duration(milliseconds: 400);

  static const Duration durationLong1 = Duration(milliseconds: 450);
  static const Duration durationLong2 = Duration(milliseconds: 500);
  static const Duration durationLong3 = Duration(milliseconds: 550);
  static const Duration durationLong4 = Duration(milliseconds: 600);

  // Motion Easing Curves
  static const Cubic easingEmphasized = Cubic(0.2, 0.0, 0.0, 1.0);
  static const Cubic easingEmphasizedDecelerate = Cubic(0.05, 0.7, 0.1, 1.0);
  static const Cubic easingEmphasizedAccelerate = Cubic(0.3, 0.0, 0.8, 0.15);
  static const Cubic easingStandard = Cubic(0.2, 0.0, 0.0, 1.0);

  // Component Touch Targets & Dimensions
  static const double minTouchTarget = 48.0;
  static const double buttonHeight = 40.0;
  static const double searchBarHeight = 56.0;
  static const double fabSizeSmall = 40.0;
  static const double fabSizeMedium = 56.0;
  static const double fabSizeLarge = 96.0;
}

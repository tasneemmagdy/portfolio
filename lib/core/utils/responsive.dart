import 'package:flutter/material.dart';

class Responsive {
  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static bool isDesktop(BuildContext context) => getWidth(context) >= 1200;
  static bool isTablet(BuildContext context) =>
      getWidth(context) >= 768 && getWidth(context) < 1200;
  static bool isMobile(BuildContext context) => getWidth(context) < 768;

  /// Returns responsive horizontal padding
  static double horizontalPadding(BuildContext context) {
    if (isDesktop(context)) return 80;
    if (isTablet(context)) return 40;
    return 24;
  }

  /// Returns responsive vertical padding for sections
  static double verticalPadding(BuildContext context) {
    if (isDesktop(context)) return 100;
    if (isTablet(context)) return 60;
    return 40;
  }

  /// Returns responsive section vertical padding (shorter variant)
  static double sectionVerticalPadding(BuildContext context) {
    if (isDesktop(context)) return 80;
    if (isTablet(context)) return 50;
    return 40;
  }
}

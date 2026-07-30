import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle heading1(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium!.copyWith(
          fontSize: 38,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle heading2(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        );
  }

  static TextStyle body(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 16,
          height: 1.7,
        );
  }

  static TextStyle small(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 13,
        );
  }
}
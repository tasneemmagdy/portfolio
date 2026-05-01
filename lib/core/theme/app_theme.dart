import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      useMaterial3: true,
    );
  }
}
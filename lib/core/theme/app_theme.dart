import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      scaffoldBackgroundColor: AppColors.lightBackground,

      colorScheme: const ColorScheme(
        brightness: Brightness.light,

        primary: AppColors.primary,
        onPrimary: Colors.white,

        secondary: AppColors.secondary,
        onSecondary: Colors.white,

        error: AppColors.error,
        onError: Colors.white,

        background: AppColors.lightBackground,
        onBackground: AppColors.lightText,

        surface: AppColors.lightSurface,
        onSurface: AppColors.lightText,
      ),

      dividerColor: AppColors.border,

      cardColor: AppColors.lightCard,

      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.lightText,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: AppColors.lightText,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          color: AppColors.lightText,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: AppColors.lightText,
        ),
        bodyLarge: TextStyle(
          color: AppColors.lightText,
        ),
        bodyMedium: TextStyle(
          color: AppColors.lightSubText,
        ),
        bodySmall: TextStyle(
          color: AppColors.lightSubText,
        ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      scaffoldBackgroundColor: AppColors.darkBackground,

      colorScheme: const ColorScheme(
        brightness: Brightness.dark,

        primary: AppColors.primary,
        onPrimary: Colors.white,

        secondary: AppColors.secondary,
        onSecondary: Colors.white,

        error: AppColors.error,
        onError: Colors.white,

        background: AppColors.darkBackground,
        onBackground: AppColors.darkText,

        surface: AppColors.darkSurface,
        onSurface: AppColors.darkText,
      ),

      dividerColor: AppColors.darkCard,

      cardColor: AppColors.darkCard,

      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.darkText,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: AppColors.darkText,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          color: AppColors.darkText,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: AppColors.darkText,
        ),
        bodyLarge: TextStyle(
          color: AppColors.darkText,
        ),
        bodyMedium: TextStyle(
          color: AppColors.darkSubText,
        ),
        bodySmall: TextStyle(
          color: AppColors.darkSubText,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

// Static renkler - her iki tema için sabit
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF28AF6E);
  static const Color primaryVariant = Color(0xFF3700B3);
  static const Color secondary = Color(0xFF03DAC6);

  // Text Gradient Colors
  static const Color textGradientStart = Color(0xFFE5C990);
  static const Color textGradientEnd = Color(0xFFE4B046);

  static const Color subTextGradientStart = Color(0xFFFFDE9C);
  static const Color subTextGradientEnd = Color(0xFFF5C25B);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFB00020);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // Light Theme Colors
  static const Color lightBackground = Color(0xFFF6F6F6);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightBottomNavBackground = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF13231B);
  static const Color lightTextSecondary = Color(0xFF597165);
  static const Color lightTextTertiary = Color(0xB2597165);
  static const Color lightTextDisabled = Color(0xFFAFAFAF);
  static const Color lightTextHint = Color(0xFF979798);
  static const Color lightDivider = Color(0xFFE0E0E0);
  static const Color lightShadow = Color(0x1A000000);

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF0A1410);
  static const Color darkSurface = Color(0xFF101E17);
  static const Color darkBottomNavBackground = Color(0xFF101E17);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFE0E0E0);
  static const Color darkTextTertiary = Color(0xFF8F9F95);
  static const Color darkTextDisabled = Color(0xFF5F6F65);
  static const Color darkTextHint = Color(0xFF7F8F85);
  static const Color darkDivider = Color(0xFF2F3F35);
  static const Color darkShadow = Color(0x1AFFFFFF);

  // Special purpose colors
  static const Color paywallGradient = Color(0xFF101E17);
}

// BuildContext extension
extension AppColorsExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  // Primary Colors
  Color get primaryColor => AppColors.primary;
  Color get secondaryColor => AppColors.secondary;
  Color get errorColor => AppColors.error;

  // Background Colors
  Color get backgroundColor => isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;

  Color get surfaceColor => isDarkMode ? AppColors.darkSurface : AppColors.lightSurface;

  Color get bottomNavBackgroundColor =>
      isDarkMode ? AppColors.darkBottomNavBackground : AppColors.lightBottomNavBackground;

  // Text Colors
  Color get textPrimaryColor => isDarkMode ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;

  Color get textSecondaryColor =>
      isDarkMode ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

  Color get textTertiaryColor =>
      isDarkMode ? AppColors.darkTextTertiary : AppColors.lightTextTertiary;

  Color get textDisabledColor =>
      isDarkMode ? AppColors.darkTextDisabled : AppColors.lightTextDisabled;

  Color get textHintColor => isDarkMode ? AppColors.darkTextHint : AppColors.lightTextHint;

  // Additional Colors
  Color get dividerColor => isDarkMode ? AppColors.darkDivider : AppColors.lightDivider;

  Color get shadowColor => isDarkMode ? AppColors.darkShadow : AppColors.lightShadow;

  // Card/Container Colors
  Color get cardColor => surfaceColor;
  Color get searchBarColor => surfaceColor;
}

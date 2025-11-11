import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';

class AppTheme {
  AppTheme._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.lightSurface,
      error: AppColors.error,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: AppColors.lightTextPrimary,
      onError: Colors.white,
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
      centerTitle: false,
      iconTheme: const IconThemeData(color: AppColors.lightTextPrimary),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: AppTextStyles.heading3,
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightSurface,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppDimensions.padding16,
        vertical: AppDimensions.padding8,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radius12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radius12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radius12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radius12),
        borderSide: const BorderSide(color: AppColors.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radius12),
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
      hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.lightTextDisabled),
      prefixIconColor: AppColors.lightTextTertiary,
      suffixIconColor: AppColors.lightTextTertiary,
    ),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBottomNavBackground,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.lightTextHint,
      type: BottomNavigationBarType.fixed,
      elevation: 4,
      selectedLabelStyle: AppTextStyles.labelMedium.copyWith(
        fontWeight: FontWeight.w400,
        color: AppColors.primary,
      ),
      unselectedLabelStyle: AppTextStyles.labelMedium.copyWith(color: AppColors.lightTextHint),
    ),

    bottomAppBarTheme: const BottomAppBarThemeData(
      color: AppColors.lightBottomNavBackground,
      elevation: 8,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.black26,
    ),

    // Text Theme
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      displaySmall: AppTextStyles.displaySmall,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
      labelLarge: AppTextStyles.labelLarge,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: Size(double.infinity, AppDimensions.buttonHeight56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radius12)),
        textStyle: AppTextStyles.buttonLarge,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding24,
          vertical: AppDimensions.padding8,
        ),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppTextStyles.buttonLarge,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding16,
          vertical: AppDimensions.padding4,
        ),
      ),
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radius16)),
    ),

    // Icon Theme
    iconTheme: IconThemeData(color: AppColors.lightTextPrimary, size: AppDimensions.icon26),

    // Snackbar Theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.lightSurface,
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.lightTextSecondary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radius12)),
      behavior: SnackBarBehavior.floating,
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.primary),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.darkSurface,
      error: AppColors.error,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: AppColors.darkTextSecondary,
      onError: Colors.white,
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      elevation: 0,
      centerTitle: false,
      iconTheme: const IconThemeData(color: AppColors.darkTextSecondary),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: AppTextStyles.heading3.copyWith(color: AppColors.darkTextSecondary),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurface,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppDimensions.padding16,
        vertical: AppDimensions.padding8,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radius12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radius12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radius12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radius12),
        borderSide: const BorderSide(color: AppColors.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radius12),
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
      hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.darkTextTertiary),
      prefixIconColor: AppColors.darkTextTertiary,
      suffixIconColor: AppColors.darkTextTertiary,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBottomNavBackground,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.darkTextHint,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: AppTextStyles.labelMedium.copyWith(
        fontWeight: FontWeight.w400,
        color: AppColors.primary,
      ),
      unselectedLabelStyle: AppTextStyles.labelMedium.copyWith(color: AppColors.darkTextHint),
    ),
    bottomAppBarTheme: const BottomAppBarThemeData(
      color: AppColors.darkBottomNavBackground,
      elevation: 8,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.black26,
    ),
    // Text Theme
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge.copyWith(color: AppColors.darkTextSecondary),
      displayMedium: AppTextStyles.displayMedium.copyWith(color: AppColors.darkTextSecondary),
      displaySmall: AppTextStyles.displaySmall.copyWith(color: AppColors.darkTextSecondary),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.darkTextSecondary),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.darkTextSecondary),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.darkTextTertiary),
      labelLarge: AppTextStyles.buttonLarge,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: Size(double.infinity, AppDimensions.buttonHeight56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radius12)),
        textStyle: AppTextStyles.buttonLarge,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding24,
          vertical: AppDimensions.padding8,
        ),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppTextStyles.buttonLarge,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding16,
          vertical: AppDimensions.padding4,
        ),
      ),
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radius16)),
    ),

    // Icon Theme
    iconTheme: IconThemeData(color: AppColors.darkTextSecondary, size: AppDimensions.icon26),

    // Snackbar Theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.darkSurface,
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.darkTextSecondary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radius12)),
      behavior: SnackBarBehavior.floating,
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.primary),
  );
}

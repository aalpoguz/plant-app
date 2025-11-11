import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // largeest headings
  static TextStyle displayLarge = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.lightTextPrimary,
    fontFamily: 'Roboto',
  );

  static TextStyle displayMedium = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.lightTextPrimary,
    fontFamily: 'Roboto',
  );

  static TextStyle displaySmall = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.lightTextPrimary,
    fontFamily: 'Roboto',
  );

  // headings
  static TextStyle heading1 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.lightTextPrimary,
    fontFamily: 'Roboto',
  );

  static TextStyle heading1Light = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.lightTextPrimary,
    fontFamily: 'Roboto',
  );

  static TextStyle heading2 = TextStyle(
    fontSize: 27.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.lightTextPrimary,
    fontFamily: 'Roboto',
  );

  static TextStyle heading3 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.lightTextPrimary,
    fontFamily: 'Roboto',
  );

  static TextStyle heading4 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.lightTextPrimary,
    fontFamily: 'Roboto',
  );

  // Body
  static TextStyle bodyLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.lightTextPrimary,
    height: 1,
    fontFamily: 'Roboto',
  );

  static TextStyle bodyLargeMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.lightTextPrimary,
    height: 1.5,
    fontFamily: 'Roboto',
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.lightTextPrimary,
    height: 1,
    fontFamily: 'Roboto',
  );

  static TextStyle bodySmall = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.lightTextSecondary,
    height: 1.5,
    fontFamily: 'Roboto',
  );

  // small labels
  static TextStyle labelLarge = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.lightTextSecondary,
    height: 1,
    fontFamily: 'Roboto',
  );

  static TextStyle labelMedium = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.lightTextPrimary,
    height: 1.5,
    fontFamily: 'Roboto',
  );

  static TextStyle labelSmall = TextStyle(
    fontSize: 9.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.lightTextPrimary,
    height: 1.5,
    fontFamily: 'Roboto',
  );

  // Buttons
  static TextStyle buttonLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0,
    fontFamily: 'Roboto',
  );

  static TextStyle buttonMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0,
    fontFamily: 'Roboto',
  );
}

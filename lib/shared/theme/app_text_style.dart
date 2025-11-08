import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Headings
  static TextStyle h1 = TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: AppColors.textPrimary, height: 1.2);

  static TextStyle h2 = TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w400, color: AppColors.textPrimary, height: 1.3);

  static TextStyle h3 = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600, color: AppColors.textPrimary, height: 1.4);

  // Body Text
  static TextStyle bodyLarge = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.textPrimary, height: 1.5);
  static TextStyle bodyMedium = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.textPrimary, height: 1.5);
  static TextStyle bodySmall = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary, height: 1.5);
  static TextStyle bodyXSmall = TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400, color: AppColors.textPrimary, height: 1.5);

  // Button Text
  static TextStyle button = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white, letterSpacing: 0);

  // Caption
  static TextStyle caption = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal, color: AppColors.textSecondary, height: 1.4);
}

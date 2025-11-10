import 'package:flutter/material.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/theme/app_assets.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class OnboardingTitle extends StatelessWidget {
  final String titleNormal;
  final String titleBold;
  final String? titleContinuation;
  final int pageIndex;
  final bool showBrush;

  const OnboardingTitle({
    super.key,
    required this.titleNormal,
    required this.titleBold,
    this.titleContinuation,
    required this.pageIndex,
    required this.showBrush,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            style: AppTextStyles.heading1Light.copyWith(color: AppColors.textPrimary, height: 1.2),
            children: [
              TextSpan(text: titleNormal),
              TextSpan(
                text: titleBold,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              if (titleContinuation != null && pageIndex != 0)
                TextSpan(
                  text: titleContinuation,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppDimensions.fontSize28),
                ),
            ],
          ),
        ),
        if (showBrush)
          Positioned(
            top: pageIndex == 1 ? 30.h : 28.h,
            right: -30,
            child: Image.asset(AppAssets.brush, width: AppDimensions.width151, height: AppDimensions.height1443, fit: BoxFit.contain),
          ),
      ],
    );
  }
}

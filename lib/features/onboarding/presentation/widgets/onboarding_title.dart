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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final aspectRatio = screenHeight / screenWidth;

    // iOS ve Android için brush pozisyonunu ayarla
    final brushTopOffset = aspectRatio > 2.1 ? 32.h : 34.h;

    final brushLeftOffset = pageIndex == 1
        ? (aspectRatio > 2.1 ? -30.w : -35.w)
        : (aspectRatio > 2.1 ? -5.w : -25.w);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            style: AppTextStyles.heading1Light.copyWith(
              color: AppColors.lightTextPrimary,
              height: 1.1,
            ),
            children: [
              TextSpan(text: titleNormal),
              TextSpan(
                text: titleBold,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              if (titleContinuation != null && pageIndex != 0)
                TextSpan(
                  text: titleContinuation,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28.sp),
                ),
            ],
          ),
        ),
        if (showBrush)
          Positioned(
            top: brushTopOffset,
            right: brushLeftOffset,
            child: Image.asset(
              AppAssets.brush,
              width: AppDimensions.width151,
              height: AppDimensions.height1443,
              fit: BoxFit.contain,
            ),
          ),
      ],
    );
  }
}

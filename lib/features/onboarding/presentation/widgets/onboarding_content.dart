import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/features/onboarding/domain/entities/onboarding_entity.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_background.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_image.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_title.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingEntity onboarding;
  final int pageIndex;

  const OnboardingContent({super.key, required this.onboarding, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OnboardingBackground(
          isFirstPage: pageIndex == 0,
          backgroundImagePath: onboarding.backgroundImagePath,
        ),
        OnboardingImage(
          imagePath: onboarding.imagePath,
          verticalOffset: _getVerticalOffset(),
          alignment: _getAlignment(),
        ),
        SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.only(
              left: AppDimensions.padding24,
              top: 46.h,
              right: AppDimensions.padding24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OnboardingTitle(
                  titleNormal: onboarding.titleNormal,
                  titleBold: onboarding.titleBold,
                  titleContinuation: pageIndex != 0 ? onboarding.description : null,
                  pageIndex: pageIndex,
                  showBrush: pageIndex == 1 || pageIndex == 2,
                ),
                if (pageIndex == 0 &&
                    onboarding.description != null &&
                    onboarding.description!.isNotEmpty) ...[
                  SizedBox(height: AppDimensions.space8),
                  Text(
                    onboarding.description!,
                    style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textPrimary),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Alignment _getAlignment() {
    return pageIndex == 0 ? Alignment.bottomCenter : Alignment.topCenter;
  }

  double _getVerticalOffset() {
    switch (pageIndex) {
      case 0:
        return -40.h;
      case 1:
        return 100.h;
      default:
        return -50.h;
    }
  }
}

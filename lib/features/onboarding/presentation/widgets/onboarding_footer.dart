import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_terms.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/page_indicator.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:plant_app/shared/widgets/app_button.dart';

class OnboardingFooter extends StatelessWidget {
  final bool isFirstPage;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final int currentPageIndex;
  final int totalPages;
  final VoidCallback? onTermsTap;
  final VoidCallback? onPrivacyTap;

  const OnboardingFooter({
    super.key,
    required this.isFirstPage,
    required this.buttonText,
    required this.onButtonPressed,
    required this.currentPageIndex,
    required this.totalPages,
    this.onTermsTap,
    this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      height: 130.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton(
            text: buttonText,
            onPressed: onButtonPressed,
            height: AppDimensions.primaryButtonHeight,
          ),
          SizedBox(height: AppDimensions.spaceS),
          SizedBox(
            height: 38.h,
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: isFirstPage
                    ? OnboardingTerms(
                        key: const ValueKey('terms'),
                        onTermsTap: onTermsTap,
                        onPrivacyTap: onPrivacyTap,
                      )
                    : PageIndicator(
                        key: const ValueKey('indicator'),
                        currentPage: currentPageIndex,
                        pageCount: totalPages,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

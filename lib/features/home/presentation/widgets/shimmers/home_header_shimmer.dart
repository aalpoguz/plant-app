import 'package:flutter/material.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeHeaderShimmer extends StatelessWidget {
  const HomeHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = context.isDarkMode
        ? context.dividerColor
        : Colors.grey.shade300;
    final highlightColor = context.isDarkMode
        ? context.surfaceColor
        : Colors.grey.shade100;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              // Background shimmer
              Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: Container(
                  width: double.infinity,
                  height: 180.h,
                  color: context.surfaceColor,
                ),
              ),
              // Content shimmer
              Positioned(
                left: 16.w,
                right: 16.w,
                top: 36.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Greeting text shimmer
                    Shimmer.fromColors(
                      baseColor: baseColor,
                      highlightColor: highlightColor,
                      child: Container(
                        width: 120.w,
                        height: AppDimensions.height16,
                        decoration: BoxDecoration(
                          color: context.surfaceColor,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.space8),
                    // Good afternoon text shimmer
                    Shimmer.fromColors(
                      baseColor: baseColor,
                      highlightColor: highlightColor,
                      child: Container(
                        width: 180.w,
                        height: AppDimensions.height24,
                        decoration: BoxDecoration(
                          color: context.surfaceColor,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.space16),
                    // Search field shimmer
                    Center(
                      child: Shimmer.fromColors(
                        baseColor: baseColor,
                        highlightColor: highlightColor,
                        child: Container(
                          width: double.infinity,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: context.surfaceColor,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radius12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.space16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:shimmer/shimmer.dart';

class HomeBannerShimmer extends StatelessWidget {
  const HomeBannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = context.isDarkMode ? context.dividerColor : Colors.grey.shade300;
    final highlightColor = context.isDarkMode ? context.surfaceColor : Colors.grey.shade100;

    return SizedBox(
      height: AppDimensions.height164,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: AppDimensions.padding20),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: AppDimensions.padding16),
            child: Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                width: AppDimensions.width240,
                height: AppDimensions.height164,
                decoration: BoxDecoration(
                  color: context.surfaceColor,
                  borderRadius: BorderRadius.circular(AppDimensions.radius12),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

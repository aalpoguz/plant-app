import 'package:flutter/material.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:shimmer/shimmer.dart';

class PremiumOfferShimmer extends StatelessWidget {
  const PremiumOfferShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = context.isDarkMode
        ? context.dividerColor
        : Colors.grey.shade300;
    final highlightColor = context.isDarkMode
        ? context.surfaceColor
        : Colors.grey.shade100;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: AppDimensions.width320,
        height: AppDimensions.height64,
        decoration: BoxDecoration(
          color: context.surfaceColor,
          borderRadius: BorderRadius.circular(AppDimensions.radius12),
        ),
      ),
    );
  }
}

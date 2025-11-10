import 'package:flutter/material.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PremiumOfferShimmer extends StatelessWidget {
  const PremiumOfferShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: AppDimensions.width320,
        height: AppDimensions.height64,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(AppDimensions.radius12)),
      ),
    );
  }
}

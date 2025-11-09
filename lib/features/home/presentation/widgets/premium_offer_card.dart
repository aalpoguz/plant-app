import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/core/router/app_router.dart';
import 'package:plant_app/shared/theme/app_assets.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class PremiumOfferCard extends StatelessWidget {
  const PremiumOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(const PaywallRoute());
      },
      child: Container(
        width: 320.w,
        height: 64.h,
        decoration: BoxDecoration(color: const Color(0xff24201A), borderRadius: BorderRadius.circular(12.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingS, vertical: AppDimensions.paddingXS),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.message, width: 40.w, height: 40.h),
              SizedBox(width: 8.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(colors: [AppColors.textGradientStart, AppColors.textGradientEnd], begin: Alignment.topCenter, end: Alignment.bottomCenter).createShader(bounds),
                    child: Text(
                      'FREE Premium Available',
                      style: AppTextStyles.bodyLarge.copyWith(color: Colors.white, height: 1, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(colors: [AppColors.subTextGradientStart, AppColors.subTextGradientEnd], begin: Alignment.topCenter, end: Alignment.bottomCenter).createShader(bounds),
                    child: Text('Tap to upgrade your account!', style: AppTextStyles.bodySmall.copyWith(color: Colors.white)),
                  ),
                ],
              ),

              const Spacer(),
              SvgPicture.asset(AppAssets.arrowRight, width: 24.w, height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

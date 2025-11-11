import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/shared/utils/router/app_router.dart';
import 'package:plant_app/shared/theme/app_assets.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class PremiumOfferCard extends StatelessWidget {
  const PremiumOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardColor = context.isDarkMode ? const Color(0xff24201A) : const Color(0xff24201A);

    return InkWell(
      onTap: () {
        context.router.push(const PaywallRoute());
      },
      child: Container(
        width: AppDimensions.width320,
        height: AppDimensions.height64,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(AppDimensions.radius12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.padding8,
            vertical: AppDimensions.padding4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.message,
                width: AppDimensions.width40,
                height: AppDimensions.height40,
              ),
              SizedBox(width: AppDimensions.width8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [AppColors.textGradientStart, AppColors.textGradientEnd],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds),
                    child: Text(
                      'FREE Premium Available',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: Colors.white,
                        height: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [AppColors.subTextGradientStart, AppColors.subTextGradientEnd],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds),
                    child: Text(
                      'Tap to upgrade your account!',
                      style: AppTextStyles.bodySmall.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),

              const Spacer(),
              SvgPicture.asset(
                AppAssets.arrowRight,
                width: AppDimensions.icon24,
                height: AppDimensions.height24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

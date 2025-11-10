import 'package:flutter/material.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/theme/app_assets.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';
import 'package:plant_app/shared/widgets/custom_search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Image.asset(AppAssets.homeAppBarBackground, width: double.infinity, fit: BoxFit.cover),
              Positioned(
                left: 16.w,
                right: 16.w,
                top: 36.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi, plant lover!', style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textPrimary)),

                    Text('Good Afternoon! ⛅', style: AppTextStyles.heading1.copyWith(color: AppColors.textPrimary)),
                    SizedBox(height: AppDimensions.space16),
                    Center(child: const CustomSearchField()),
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

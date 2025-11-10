import 'package:flutter/material.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class PaywallCheckboxCard extends StatelessWidget {
  final String title;
  final String price;
  final String? badge;
  final bool isSelected;
  final VoidCallback onTap;

  const PaywallCheckboxCard({
    super.key,
    required this.title,
    required this.price,
    this.badge,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppDimensions.width320,
        height: AppDimensions.height63,
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    const Color(0xFF28AF6E).withOpacity(0.24),
                    const Color(0xFF28AF6E).withOpacity(0.0),
                  ],
                )
              : null,
          color: isSelected ? null : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(AppDimensions.radius16),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : Colors.white.withOpacity(0.3),
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    width: AppDimensions.icon24,
                    height: AppDimensions.height24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? AppColors.primary
                          : Colors.white.withOpacity(0.08),
                    ),

                    child: isSelected
                        ? Container(
                            margin: EdgeInsets.all(AppDimensions.padding8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          )
                        : null,
                  ),
                  SizedBox(width: AppDimensions.width12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: AppDimensions.fontSize16,
                          ),
                        ),
                        SizedBox(height: AppDimensions.space4),
                        Text(
                          price,
                          style: AppTextStyles.labelLarge.copyWith(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: AppDimensions.fontSize12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (badge != null)
                Positioned(
                  top: 0.h,
                  right: 0.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2DBD7E),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(AppDimensions.radius20),
                        topRight: Radius.circular(AppDimensions.radius14),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        badge!,
                        style: AppTextStyles.labelLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

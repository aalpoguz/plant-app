import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class PaywallCheckboxCard extends StatelessWidget {
  final String title;
  final String price;
  final String? badge;
  final bool isSelected;
  final VoidCallback onTap;

  const PaywallCheckboxCard({super.key, required this.title, required this.price, this.badge, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 320.w,
        height: 63.h,
        decoration: BoxDecoration(
          gradient: isSelected ? LinearGradient(begin: Alignment.centerRight, end: Alignment.centerLeft, colors: [const Color(0xFF28AF6E).withOpacity(0.24), const Color(0xFF28AF6E).withOpacity(0.0)]) : null,
          color: isSelected ? null : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: isSelected ? AppColors.primary : Colors.white.withOpacity(0.3), width: 0.5),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: isSelected ? AppColors.primary : Colors.white.withOpacity(0.08)),

                    child: isSelected
                        ? Container(
                            margin: EdgeInsets.all(8.w),
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                          )
                        : null,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.bodyLarge.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16.sp),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          price,
                          style: AppTextStyles.labelLarge.copyWith(color: Colors.white.withOpacity(0.7), fontSize: 12.sp),
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
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2DBD7E),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r), topRight: Radius.circular(14.r)),
                    ),
                    child: Center(
                      child: Text(
                        badge!,
                        style: AppTextStyles.labelLarge.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
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

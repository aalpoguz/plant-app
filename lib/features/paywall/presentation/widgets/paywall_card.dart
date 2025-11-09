import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class PaywallCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;

  const PaywallCard({super.key, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155.w,
      height: 124.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(14.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(9.w),
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(color: Color(0x3D000000).withOpacity(0.2), borderRadius: BorderRadius.circular(8.r)),
            child: icon,
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            style: AppTextStyles.heading4.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 4.h),
          Text(subtitle, style: AppTextStyles.bodySmall.copyWith(color: Colors.white.withOpacity(0.7))),
        ],
      ),
    );
  }
}

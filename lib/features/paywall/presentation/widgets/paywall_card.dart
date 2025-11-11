import 'package:flutter/material.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class PaywallCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;

  const PaywallCard({super.key, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.width155,
      height: AppDimensions.height124,
      padding: EdgeInsets.all(AppDimensions.padding12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppDimensions.radius14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppDimensions.padding9),
            width: AppDimensions.width36,
            height: AppDimensions.height36,
            decoration: BoxDecoration(
              color: const Color(0x3D000000).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppDimensions.radius8),
            ),
            child: icon,
          ),
          SizedBox(height: AppDimensions.space10),
          Text(
            title,
            style: AppTextStyles.heading4.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: AppDimensions.space4),
          Text(
            subtitle,
            style: AppTextStyles.bodySmall.copyWith(color: Colors.white.withValues(alpha: 0.7)),
          ),
        ],
      ),
    );
  }
}

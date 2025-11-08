import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class HomeBannerCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;

  const HomeBannerCard({Key? key, required this.title, required this.imageUrl, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.w,
      height: 164.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Stack(
        children: [
          Image.network(imageUrl, fit: BoxFit.contain, width: 240.w),
          Positioned(
            bottom: 0,
            child: Container(
              width: 240.w,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          title,
                          style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

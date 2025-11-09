import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class HomeBannerCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;

  const HomeBannerCard({super.key, required this.title, required this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 240.w,
        height: 164.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), color: Colors.grey.shade200),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: 240.w,
              height: 164.h,
              placeholder: (context, url) => Container(color: Colors.grey.shade200),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey.shade200,
                child: Icon(Icons.image_not_supported, color: Colors.grey.shade400),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.r), bottomRight: Radius.circular(12.r)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(color: Colors.black.withOpacity(0.15)),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    child: Text(
                      title,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        shadows: [Shadow(color: Colors.black.withOpacity(0.5), offset: const Offset(0, 1), blurRadius: 3)],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class MiniHomeCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;

  const MiniHomeCard({super.key, required this.title, required this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152.w,
      height: 152.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          child: Stack(
            children: [
              Positioned(
                right: -40.w,
                top: 16.h,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(8.r), bottomRight: Radius.circular(12.r)),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 120.w,
                    height: 152.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey.shade200,
                      child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey.shade200,
                      child: Icon(Icons.image_not_supported, color: Colors.grey.shade400),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 16.h,
                left: 16.w,
                right: 90.w,
                child: Text(title, style: AppTextStyles.bodyLargeMedium, maxLines: 3, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

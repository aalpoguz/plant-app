import 'package:cached_network_image/cached_network_image.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class MiniHomeCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;

  const MiniHomeCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152.w,
      height: 152.h,
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(AppDimensions.radius12),
        border: Border.all(color: context.dividerColor),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDimensions.radius8),
          child: Stack(
            children: [
              // Resim - Sağda yarısı görünecek şekilde
              Positioned(
                right: -5.w,
                top: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 120.w,
                    height: 152.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: context.dividerColor),
                    errorWidget: (context, url, error) => Container(
                      color: context.dividerColor,
                      child: Icon(
                        Icons.image_not_supported,
                        color: context.textDisabledColor,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 16.h,
                left: 12.w,
                right: 85.w,
                child: Text(
                  title,
                  style: AppTextStyles.bodyLargeMedium.copyWith(
                    color: context.textPrimaryColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

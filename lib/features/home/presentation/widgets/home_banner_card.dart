import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class HomeBannerCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String? heroTag;
  final VoidCallback? onTap;

  const HomeBannerCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.heroTag,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cardContent = Material(
      type: MaterialType.transparency,
      child: Container(
        width: AppDimensions.width240,
        height: AppDimensions.height164,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.radius12),
          color: context.dividerColor,
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: AppDimensions.width240,
              height: AppDimensions.height164,
              placeholder: (context, url) => Container(color: context.dividerColor),
              errorWidget: (context, url, error) => Container(
                color: context.dividerColor,
                child: Icon(Icons.image_not_supported, color: context.textDisabledColor),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),
            Positioned(
              top: 114.h,
              left: 14.w,
              right: 14.w,
              child: Text(
                title,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Colors.white,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  shadows: const [
                    Shadow(offset: Offset(0, 1), blurRadius: 3, color: Colors.black45),
                  ],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: heroTag != null ? Hero(tag: heroTag!, child: cardContent) : cardContent,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingImage extends StatelessWidget {
  final String imagePath;
  final double verticalOffset;
  final Alignment alignment;

  const OnboardingImage({
    super.key,
    required this.imagePath,
    required this.verticalOffset,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final aspectRatio = screenHeight / screenWidth;

    const imageWidth = 360.0;
    const imageHeight = 670.0;

    return Positioned(
      top: verticalOffset,
      left: (screenWidth - imageWidth.w) / 2,
      width: imageWidth.w,
      height: imageHeight.h,
      child: Image.asset(
        imagePath,
        width: imageWidth.w,
        height: imageHeight.h,
        fit: aspectRatio > 2.1 ? BoxFit.cover : BoxFit.contain,
        alignment: alignment,
      ),
    );
  }
}

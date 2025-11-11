import 'package:flutter/material.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:shimmer/shimmer.dart';

class MiniHomeCardShimmer extends StatelessWidget {
  const MiniHomeCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = context.isDarkMode ? context.dividerColor : Colors.grey.shade300;
    final highlightColor = context.isDarkMode ? context.surfaceColor : Colors.grey.shade100;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding20),
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppDimensions.padding16,
            mainAxisSpacing: AppDimensions.padding16,
            childAspectRatio: 1,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radius12),
                border: Border.all(color: context.dividerColor),
              ),
              child: Stack(
                children: [
                  // Image placeholder
                  Positioned(
                    right: -5,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(AppDimensions.radius12),
                          bottomRight: Radius.circular(AppDimensions.radius12),
                        ),
                      ),
                    ),
                  ),
                  // Text placeholders
                  Positioned(
                    top: 16,
                    left: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(height: 6),
                        Container(
                          width: 40,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

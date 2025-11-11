import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/shared/theme/app_assets.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class CustomSearchField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const CustomSearchField({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.searchFieldWidth,
      height: AppDimensions.searchFieldHeight,
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(AppDimensions.radius12),
        border: Border.all(color: context.dividerColor, width: 1),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        style: AppTextStyles.bodyMedium.copyWith(
          color: context.textPrimaryColor,
        ),
        decoration: InputDecoration(
          hintText: hintText ?? 'Search for plants',
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: context.textHintColor,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: AppDimensions.searchFieldHorizontalPadding,
              right: AppDimensions.searchFieldGap,
            ),
            child: SvgPicture.asset(
              AppAssets.searchIcon,
              width: 20.sp,
              height: 20.sp,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth:
                AppDimensions.searchFieldHorizontalPadding +
                20.sp +
                AppDimensions.searchFieldGap,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppDimensions.searchFieldHorizontalPadding,
            vertical: AppDimensions.searchFieldVerticalPadding,
          ),
        ),
      ),
    );
  }
}

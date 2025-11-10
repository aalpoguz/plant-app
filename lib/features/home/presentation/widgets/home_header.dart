import 'package:flutter/material.dart';
import 'package:plant_app/shared/presentation/providers/theme_provider.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/theme/app_assets.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';
import 'package:plant_app/shared/widgets/custom_search_field.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              ColorFiltered(
                colorFilter: ColorFilter.mode(isDark ? Colors.black.withOpacity(0.8) : Colors.transparent, BlendMode.darken),
                child: Image.asset(AppAssets.homeAppBarBackground, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                left: 16.w,
                right: 16.w,
                top: 36.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hi, plant lover!', style: AppTextStyles.bodyLarge.copyWith(color: context.textPrimaryColor)),
                              Text('Good Afternoon! ⛅', style: AppTextStyles.heading1.copyWith(color: context.textPrimaryColor)),
                            ],
                          ),
                        ),
                        Consumer<ThemeProvider>(
                          builder: (context, themeProvider, _) {
                            return Container(
                              decoration: BoxDecoration(
                                color: context.surfaceColor.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(12.r),
                                boxShadow: [BoxShadow(color: context.shadowColor, blurRadius: 8, offset: const Offset(0, 2))],
                              ),
                              child: IconButton(
                                icon: Icon(themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode, color: AppColors.primary),
                                onPressed: () {
                                  themeProvider.toggleTheme();
                                },
                                tooltip: themeProvider.isDarkMode ? 'Light Mode' : 'Dark Mode',
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimensions.space16),
                    Center(child: const CustomSearchField()),
                    SizedBox(height: AppDimensions.space16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

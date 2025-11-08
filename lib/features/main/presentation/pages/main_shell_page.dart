import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/core/router/app_router.dart';
import 'package:plant_app/features/main/presentation/widgets/custom_bottom_nav.dart';
import 'package:plant_app/shared/theme/app_assets.dart';
import 'package:plant_app/shared/theme/app_colors.dart';

@RoutePage()
class MainShellPage extends StatelessWidget {
  const MainShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeRoute(), DiagnoseRoute(), MyGardenRoute(), ProfileRoute()],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 66.w,
        height: 66.w,
        decoration: const BoxDecoration(color: Color(0xFF2CCC80), shape: BoxShape.circle),
        child: Center(
          child: Container(
            width: 58.w,
            height: 58.w,
            decoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Scan Plant - Coming Soon!')));
                },
                borderRadius: BorderRadius.circular(28.w),
                child: Center(
                  child: SvgPicture.asset(AppAssets.scanIcon, width: 24.w, height: 20.w, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBuilder: (_, tabsRouter) {
        return CustomBottomNavBar(currentIndex: tabsRouter.activeIndex, onTap: tabsRouter.setActiveIndex);
      },
    );
  }
}

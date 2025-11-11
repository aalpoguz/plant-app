import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/shared/main/presentation/widgets/custom_bottom_nav.dart';
import 'package:plant_app/shared/theme/app_assets.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:plant_app/shared/utils/router/app_router.dart';

@RoutePage()
class MainShellPage extends StatelessWidget {
  const MainShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeRoute(), DiagnoseRoute(), MyGardenRoute(), ProfileRoute()],
      transitionBuilder: (context, child, animation) => child,
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: AppDimensions.width66,
        height: AppDimensions.width66,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.3),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: AppDimensions.width58,
            height: AppDimensions.width58,
            decoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  context.router.push(const ScanRoute());
                },
                borderRadius: BorderRadius.circular(AppDimensions.radius28),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.scanIcon,
                    width: AppDimensions.icon24,
                    height: AppDimensions.height20,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBuilder: (_, tabsRouter) {
        return CustomBottomNavBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            // Aynı sayfaya tıklanırsa işlem yapma
            if (tabsRouter.activeIndex != index) {
              tabsRouter.setActiveIndex(index);
            }
          },
        );
      },
    );
  }
}

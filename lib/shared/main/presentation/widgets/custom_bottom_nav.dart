import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

// Bottom Navigation Item Config
class _BottomNavItem {
  final String label;
  final String iconPath;

  const _BottomNavItem(this.label, this.iconPath);
}

// Bottom Navigation Configuration
class _BottomNavConfig {
  static const items = [
    _BottomNavItem('Home', 'assets/svg/icons/home.svg'),
    _BottomNavItem('Diagnose', 'assets/svg/icons/diagnose.svg'),
    _BottomNavItem('My Garden', 'assets/svg/icons/my-garden.svg'),
    _BottomNavItem('Profile', 'assets/svg/icons/profile.svg'),
  ];
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: null,
      notchMargin: 0,
      child: SizedBox(
        height: AppDimensions.height80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ..._BottomNavConfig.items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;

              if (index == 2) {
                return Row(
                  children: [
                    SizedBox(width: AppDimensions.icon48), // FAB boşluğu
                    _NavBarItemWidget(
                      icon: item.iconPath,
                      label: item.label,
                      isActive: currentIndex == index,
                      onTap: () => onTap(index),
                    ),
                  ],
                );
              }

              return _NavBarItemWidget(
                icon: item.iconPath,
                label: item.label,
                isActive: currentIndex == index,
                onTap: () => onTap(index),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _NavBarItemWidget extends StatelessWidget {
  final String icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItemWidget({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final navTheme = theme.bottomNavigationBarTheme;

    final selectedColor = navTheme.selectedItemColor ?? theme.colorScheme.primary;
    final unselectedColor =
        navTheme.unselectedItemColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.6);

    final color = isActive ? selectedColor : unselectedColor;

    final textStyle = isActive ? navTheme.selectedLabelStyle : navTheme.unselectedLabelStyle;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(icon, color),
            SizedBox(height: AppDimensions.height4),
            Text(
              label,
              style:
                  textStyle ??
                  AppTextStyles.labelMedium.copyWith(
                    color: color,
                    fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(String iconPath, Color color) {
    return SvgPicture.asset(
      iconPath,
      width: AppDimensions.icon26,
      height: AppDimensions.icon26,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}

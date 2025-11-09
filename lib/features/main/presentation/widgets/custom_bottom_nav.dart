import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/shared/theme/app_assets.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: null, // Notch kaldırıldı
      notchMargin: 0,
      child: SizedBox(
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavBarItem(
              icon: AppAssets.homeIcon,
              label: 'Home',
              isActive: currentIndex == 0,
              onTap: () => onTap(0),
            ),
            _NavBarItem(
              icon: AppAssets.diagnoseIcon,
              label: 'Diagnose',
              isActive: currentIndex == 1,
              onTap: () => onTap(1),
            ),
            const SizedBox(width: 48), // FAB boşluğu
            _NavBarItem(
              icon: AppAssets.myGardenIcon,
              label: 'My Garden',
              isActive: currentIndex == 2,
              onTap: () => onTap(2),
            ),
            _NavBarItem(
              icon: AppAssets.profileIcon,
              label: 'Profile',
              isActive: currentIndex == 3,
              onTap: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final dynamic icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final navTheme = theme.bottomNavigationBarTheme;

    // Theme'den renkleri al
    final selectedColor = navTheme.selectedItemColor ?? theme.colorScheme.primary;
    final unselectedColor =
        navTheme.unselectedItemColor ?? theme.colorScheme.onSurface.withOpacity(0.6);

    final color = isActive ? selectedColor : unselectedColor;

    // Theme'den text style'ları al
    final textStyle = isActive ? navTheme.selectedLabelStyle : navTheme.unselectedLabelStyle;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIcon(icon, color),
          SizedBox(height: 4.h),
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
    );
  }

  Widget _buildIcon(dynamic iconData, Color color) {
    if (iconData is IconData) {
      return Icon(iconData, color: color, size: 26.w);
    } else if (iconData is String) {
      // SVG icon
      if (iconData.endsWith('.svg')) {
        return SvgPicture.asset(
          iconData,
          width: 26.w,
          height: 26.w,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      }
      // PNG/JPG fallback
      return Image.asset(iconData, width: 26.w, height: 26.w, color: color);
    }
    return const SizedBox.shrink();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';
import 'package:plant_app/shared/utils/navigation/bottom_nav_page.dart';

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
            ...BottomNavPage.values.asMap().entries.map((entry) {
              final index = entry.key;
              final page = entry.value;

              if (index == 2) {
                return Row(
                  children: [
                    SizedBox(width: AppDimensions.icon48), // FAB boşluğu
                    _NavBarItem(icon: page.icon, label: page.label, isActive: currentIndex == index, onTap: () => onTap(index)),
                  ],
                );
              }

              return _NavBarItem(icon: page.icon, label: page.label, isActive: currentIndex == index, onTap: () => onTap(index));
            }),
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

  const _NavBarItem({required this.icon, required this.label, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final navTheme = theme.bottomNavigationBarTheme;

    // Theme'den renkleri al
    final selectedColor = navTheme.selectedItemColor ?? theme.colorScheme.primary;
    final unselectedColor = navTheme.unselectedItemColor ?? theme.colorScheme.onSurface.withOpacity(0.6);

    final color = isActive ? selectedColor : unselectedColor;

    // Theme'den text style'ları al
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
              style: textStyle ?? AppTextStyles.labelMedium.copyWith(color: color, fontWeight: isActive ? FontWeight.w500 : FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(dynamic iconData, Color color) {
    if (iconData is IconData) {
      return Icon(iconData, color: color, size: AppDimensions.icon26);
    } else if (iconData is String) {
      // SVG icon
      if (iconData.endsWith('.svg')) {
        return SvgPicture.asset(iconData, width: AppDimensions.icon26, height: AppDimensions.icon26, colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
      }
      // PNG/JPG fallback
      return Image.asset(iconData, width: AppDimensions.icon26, height: AppDimensions.icon26, color: color);
    }
    return const SizedBox.shrink();
  }
}

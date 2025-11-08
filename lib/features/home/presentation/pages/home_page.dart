import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/features/main/presentation/widgets/custom_bottom_nav.dart';
import 'package:plant_app/shared/presentation/base_page.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (int index) {
          // Handle navigation tap
        },
      ),
      useSafeArea: true,
      body: Center(child: Text('Home Page')),
    );
  }
}

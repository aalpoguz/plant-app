import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/shared/presentation/base_page.dart';

@RoutePage()
class MyGardenPage extends StatelessWidget {
  const MyGardenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      useSafeArea: true,
      body: Center(
        child: Text(
          'My Garden Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

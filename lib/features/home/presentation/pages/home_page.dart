import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/shared/presentation/base_page.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      useSafeArea: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.eco, size: 80, color: Colors.green),
            const SizedBox(height: 24),
            Text('Welcome to Plant App! 🌱', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Text('Home Page', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}

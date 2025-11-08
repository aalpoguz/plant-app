import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/features/home/presentation/widgets/mini_home_card.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MiniHomeCard(imageUrl: 'https://images.unsplash.com/photo-1459156212016-c812468e2115?w=400', title: 'Tropical Plants'),
                const SizedBox(width: 12),
                MiniHomeCard(imageUrl: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400', title: 'Succulents'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

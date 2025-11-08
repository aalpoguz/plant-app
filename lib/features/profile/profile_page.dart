import 'package:flutter/material.dart';
import 'package:plant_app/shared/presentation/base_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      useSafeArea: true,
      body: Center(child: Text('Profile Page', style: Theme.of(context).textTheme.headlineMedium)),
    );
  }
}

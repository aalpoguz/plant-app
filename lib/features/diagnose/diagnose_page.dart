import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/shared/presentation/base_page.dart';

@RoutePage()
class DiagnosePage extends StatelessWidget {
  const DiagnosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      useSafeArea: true,
      body: Center(
        child: Text(
          'Diagnose Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

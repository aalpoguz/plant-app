import 'package:flutter/material.dart';

class OnboardingBackground extends StatelessWidget {
  final bool isFirstPage;
  final String backgroundImagePath;

  const OnboardingBackground({super.key, required this.isFirstPage, required this.backgroundImagePath});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: isFirstPage ? Image.asset(backgroundImagePath, fit: BoxFit.fill) : Container(color: Colors.white),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class OnboardingTerms extends StatefulWidget {
  final VoidCallback? onTermsTap;
  final VoidCallback? onPrivacyTap;

  const OnboardingTerms({super.key, this.onTermsTap, this.onPrivacyTap});

  @override
  State<OnboardingTerms> createState() => _OnboardingTermsState();
}

class _OnboardingTermsState extends State<OnboardingTerms> {
  late TapGestureRecognizer _termsRecognizer;
  late TapGestureRecognizer _privacyRecognizer;

  @override
  void initState() {
    super.initState();
    _termsRecognizer = TapGestureRecognizer()
      ..onTap = () {
        widget.onTermsTap?.call();
      };
    _privacyRecognizer = TapGestureRecognizer()
      ..onTap = () {
        widget.onPrivacyTap?.call();
      };
  }

  @override
  void dispose() {
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.lightTextDisabled,
        ),
        children: [
          const TextSpan(text: "By tapping next, you agree to PlantID's "),
          TextSpan(
            text: '\nTerms of Service',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.lightTextDisabled,
              decoration: TextDecoration.underline,
            ),
            recognizer: _termsRecognizer,
          ),
          const TextSpan(text: ' & '),
          TextSpan(
            text: 'Privacy Policy',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.lightTextDisabled,
              decoration: TextDecoration.underline,
            ),
            recognizer: _privacyRecognizer,
          ),
        ],
      ),
    );
  }
}

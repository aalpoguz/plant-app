import 'package:plant_app/features/onboarding/domain/entities/onboarding_entity.dart';
import 'package:plant_app/shared/theme/app_assets.dart';

class OnboardingData {
  OnboardingData._();

  static final List<OnboardingEntity> onboardingPages = [
    const OnboardingEntity(
      imagePath: AppAssets.onboarding1,
      backgroundImagePath: AppAssets.onboard1Bg,
      titleNormal: 'Welcome to ',
      titleBold: 'PlantApp',
      description: 'Identify more than 3000+ plants and %88 accuracy.',
    ),
    const OnboardingEntity(
      imagePath: AppAssets.onboarding2,
      backgroundImagePath: AppAssets.onboard1Bg,
      titleNormal: 'Take a photo to ',
      titleBold: 'identify\n',
      description: 'the plant!',
    ),
    const OnboardingEntity(
      imagePath: AppAssets.onboarding3,
      backgroundImagePath: AppAssets.onboard1Bg,
      titleNormal: 'Get plant ',
      titleBold: 'care guides',
      description: null,
    ),
  ];
}

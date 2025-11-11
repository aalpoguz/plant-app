import 'package:equatable/equatable.dart';

class OnboardingEntity extends Equatable {
  final String imagePath;
  final String backgroundImagePath;
  final String titleNormal;
  final String titleBold;
  final String? description;

  const OnboardingEntity({
    required this.imagePath,
    required this.backgroundImagePath,
    required this.titleNormal,
    required this.titleBold,
    this.description,
  });

  @override
  List<Object?> get props => [imagePath, backgroundImagePath, titleNormal, titleBold, description];
}

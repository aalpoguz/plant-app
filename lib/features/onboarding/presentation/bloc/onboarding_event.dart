abstract class OnboardingEvent {}

class OnboardingPageChanged extends OnboardingEvent {
  final int page;
  OnboardingPageChanged(this.page);
}

class OnboardingNextPage extends OnboardingEvent {}

class OnboardingComplete extends OnboardingEvent {}

class OnboardingTermsTapped extends OnboardingEvent {}

class OnboardingPrivacyTapped extends OnboardingEvent {}

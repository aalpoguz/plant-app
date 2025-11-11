import 'package:shared_preferences/shared_preferences.dart';

/// Local storage service for managing app preferences
/// This is a core service that wraps SharedPreferences
class LocalStorageService {
  static const String _onboardingCompleteKey = 'onboarding_complete';
  static const String _paywallShownKey = 'paywall_shown';

  final SharedPreferences _prefs;

  LocalStorageService(this._prefs);

  /// Check if user has completed onboarding
  bool isOnboardingComplete() {
    return _prefs.getBool(_onboardingCompleteKey) ?? false;
  }

  /// Mark onboarding as complete
  Future<bool> setOnboardingComplete() {
    return _prefs.setBool(_onboardingCompleteKey, true);
  }

  /// Reset onboarding status (useful for testing)
  Future<bool> resetOnboarding() {
    return _prefs.setBool(_onboardingCompleteKey, false);
  }

  /// Check if paywall has been shown after onboarding
  bool hasPaywallBeenShown() {
    return _prefs.getBool(_paywallShownKey) ?? false;
  }

  /// Mark paywall as shown
  Future<bool> setPaywallShown() {
    return _prefs.setBool(_paywallShownKey, true);
  }

  /// Reset paywall shown status (useful for testing)
  Future<bool> resetPaywallShown() {
    return _prefs.setBool(_paywallShownKey, false);
  }
}

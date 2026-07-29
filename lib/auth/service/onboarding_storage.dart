import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OnboardingStorageService {
  OnboardingStorageService._();

  static final OnboardingStorageService instance =
      OnboardingStorageService._();

  final FlutterSecureStorage _storage =
      const FlutterSecureStorage();

  static const String onboardingKey =
      "has_seen_onboarding";

  Future<void> completeOnboarding() async {
    await _storage.write(
      key: onboardingKey,
      value: "true",
    );
  }

  Future<bool> hasSeenOnboarding() async {

    final value = await _storage.read(
      key: onboardingKey,
    );

    return value == "true";
  }

}
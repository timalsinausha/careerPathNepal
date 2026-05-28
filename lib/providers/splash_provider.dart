
import 'package:careernepal/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashProvider {
  void startSplash(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const OnboardingScreen(),
      ),
    );
  }
}
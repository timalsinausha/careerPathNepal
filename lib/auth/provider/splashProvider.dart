import 'package:careernepal/auth/provider/auth_provider.dart';
import 'package:careernepal/screens/home_screen.dart';
import 'package:careernepal/auth/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/onboarding_screen.dart';
import '../service/onboarding_storage.dart';
class SplashProvider extends ChangeNotifier {

  Future<void> startSplash(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!context.mounted) return;

    final hasSeen =
        await OnboardingStorageService.instance
            .hasSeenOnboarding();
    if (!context.mounted) return;

    if (!hasSeen) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        ),
      );

      return;
    }

    final isLoggedIn =
        await context
            .read<AuthProvider>()
            .checkLoginStatus();
    if (!context.mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            isLoggedIn
                ? const HomeScreen()
                : const LoginScreen(),
      ),
    );
  }
}
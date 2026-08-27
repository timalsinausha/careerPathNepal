import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'assessment/screen/assement_result_screen.dart';
import 'screens/home_screen.dart';
import 'assessment/screen/assement_intro_screen.dart';
import 'auth/screen/profile_screen.dart';
import 'providers/bottom_nav_provider.dart';
import 'widgets/custom_bottom_nav.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<BottomNavProvider>();

    final screens = [
      const HomeScreen(),

      const AssessmentIntroScreen(),
      const AssessmentResultScreen(),

      // const Center(
      //   child: Text(
      //     "Careers",
      //     style: TextStyle(
      //       fontSize: 24,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),

      const ProfileScreen(),

      const Center(
        child: Text(
          "Settings",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ];

    return Scaffold(
      body: IndexedStack(
        index: provider.currentIndex,
        children: screens,
      ),

      bottomNavigationBar:
          const CustomBottomNav(),
    );
  }
}
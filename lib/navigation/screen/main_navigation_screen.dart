import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../assessment/screen/assement_result_screen.dart';
import '../../screens/explores_screen.dart';
import '../../screens/home_screen.dart';
import '../../assessment/screen/assement_intro_screen.dart';
import '../../auth/screen/profile_screen.dart';
import '../../screens/setting/setting_screen.dart';
import '../providers/bottom_nav_provider.dart';
import '../widget/custom_bottom_nav.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<BottomNavProvider>();

    final screens = [
      const HomeScreen(),
      const ExploreScreen(),
      const AssessmentIntroScreen(showBackButton: false,),
      const ProfileScreen(),
      const SettingsScreen(),
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
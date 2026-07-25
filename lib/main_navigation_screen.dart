import 'package:careernepal/screens/college_screen.dart';
import 'package:careernepal/screens/home_screen.dart';
import 'package:careernepal/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/bottom_nav_provider.dart';

import 'screens/quiz_screen.dart';

import 'screens/profile_screen.dart';

import 'widgets/custom_bottom_nav.dart';

class MainNavigationScreen extends StatelessWidget {
  MainNavigationScreen({super.key});

  final List<Widget> screens = [
    const HomeScreen(),
    const QuizScreen(),
    const CollegeScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BottomNavProvider>();

    return Scaffold(
      body: screens[provider.currentIndex],
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}

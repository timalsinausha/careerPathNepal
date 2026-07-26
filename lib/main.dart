import 'package:careernepal/main_navigation_screen.dart';
import 'package:careernepal/providers/bottom_nav_provider.dart';
import 'package:careernepal/providers/career_result_provider.dart';
import 'package:careernepal/auth/provider/login_provider.dart';
import 'package:careernepal/providers/profile_provider.dart';
import 'package:careernepal/providers/register_provider.dart';
import 'package:careernepal/providers/splash_provider.dart';
import 'package:careernepal/screens/academic_profile_page.dart';
import 'package:careernepal/screens/career_result_screen.dart';
import 'package:careernepal/screens/home_screen.dart';
import 'package:careernepal/screens/onboarding_screen.dart';
import 'package:careernepal/screens/profile_screen.dart';
import 'package:careernepal/screens/quiz_screen.dart';
import 'package:careernepal/screens/register_screen.dart';
import 'package:careernepal/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => SplashProvider()),
         Provider(create: (_) => ProfileProvider()),
        Provider(create: (_) => const OnboardingScreen()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => CareerResultProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RegisterScreen(),
    );
  }
}

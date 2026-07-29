import 'package:careernepal/auth/provider/auth_provider.dart';
import 'package:careernepal/auth/provider/splashProvider.dart';
import 'package:careernepal/providers/bottom_nav_provider.dart';
import 'package:careernepal/providers/career_result_provider.dart';
import 'package:careernepal/auth/provider/login_provider.dart';
import 'package:careernepal/auth/provider/profile_provider.dart';
import 'package:careernepal/screens/Splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/provider/register_provider.dart';
import 'core/navigation/navigation_service.dart';
import 'core/network/dio_client.dart';

void main() {
  DioClient.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => CareerResultProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        Provider(create: (_) => AuthProvider(),),
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
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'CareerPath Nepal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

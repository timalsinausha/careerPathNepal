import 'package:careernepal/auth/provider/login_provider.dart';
import 'package:careernepal/core/snackar_bar.dart';
import 'package:careernepal/core/validators.dart';
import 'package:careernepal/screens/profile_firststep.dart';
import 'package:careernepal/screens/home_screen.dart';
import 'package:careernepal/screens/profile_screen.dart';
import 'package:careernepal/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/provider/profile_provider.dart';
import '../auth/service/auth_storage_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

@override
Widget build(BuildContext context) {
  return Consumer<LoginProvider>(
    builder: (context, loginProvider, child) {
      return Scaffold(
        backgroundColor: Colors.white,

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Column(
                children: [

                  const SizedBox(height: 40),

                  Center(
                    child: Image.asset(
                      "assets/images/login_screen_photo.png",
                      height: 170,
                    ),
                  ),

                  const SizedBox(height: 20),

                  CustomTextField(
                    hintText: "abc@gmail.com",
                    labelText: "Enter Email",
                    controller: emailController,
                    validator: Validators.validateEmail,
                  ),

                  const SizedBox(height: 18),

                  CustomTextField(
                    hintText: "********",
                    labelText: "Enter Password",
                    controller: passwordController,
                    validator: Validators.validatePassword,
                    isPassword: true,
                  ),

                  const SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Forget Password",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  CustomButton(
                    text: "Login",
                    isLoading: loginProvider.isLoading,
                    onTap: () async {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      final success = await loginProvider.login(
                        email: emailController.text.trim(),
                        password: passwordController.text,
                      );

                      if (!context.mounted) return;

                      if (success) {
                        try {
                          final profileProvider =
                              context.read<ProfileProvider>();

                          final profile =
                              await profileProvider.getProfile();

                          if (!context.mounted) return;

                          showSnackBar(
                            context,
                            "Login Successful",
                          );

                          await Future.delayed(
                            const Duration(seconds: 1),
                          );

                          if (!context.mounted) return;

                          if (profile.studentProfile.isProfileCompleted) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomeScreen(),
                              ),
                              (route) => false,
                            );
                          } else {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ProfileFirstStep(),
                              ),
                              (route) => false,
                            );
                          }
                        } catch (e) {
                          if (!context.mounted) return;

                          showSnackBar(
                            context,
                            e.toString().replaceFirst(
                              "Exception: ",
                              "",
                            ),
                          );
                        }
                      } else {
                        showSnackBar(
                          context,
                          loginProvider.errorMessage ??
                              "Login Failed",
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const CustomText(
                        text: "Don’t have Account? ",
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegisterScreen(),
                          ),
                        );
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
}
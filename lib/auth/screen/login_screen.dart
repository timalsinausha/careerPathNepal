import 'package:careernepal/auth/provider/login_provider.dart';
import 'package:careernepal/core/utils/snackar_bar.dart';
import 'package:careernepal/core/utils/validators.dart';
import 'package:careernepal/auth/screen/profile/profile_firststep.dart';
import 'package:careernepal/auth/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../navigation/screen/main_navigation_screen.dart';
import '../provider/profile_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import 'forgetPassword/forgetPassword_screen.dart';

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
          child: SingleChildScrollView(
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
                     obscureText: loginProvider.isLoginPasswordHidden,
                        suffixIcon: IconButton(
                        onPressed: () {
                          loginProvider.toggleLoginPasswordVisibility();
                        },
                        icon: Icon(
                          loginProvider.isLoginPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                  ),

                  const SizedBox(height: 8),

                  Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const ForgotPasswordScreen(),
                        ),
                      );

                    },
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
                            Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MainNavigationScreen(),
                            ),
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

                      const Text(
                         "Don’t have Account? ",
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
                            fontSize: 15
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
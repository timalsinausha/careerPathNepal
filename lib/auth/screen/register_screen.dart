import 'package:careernepal/core/utils/snackar_bar.dart';
import 'package:careernepal/core/utils/validators.dart';
import 'package:careernepal/auth/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../model/register_request.dart';
import '../provider/register_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final contactController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
@override
void initState() {
  super.initState();

  passwordController.addListener(_checkPasswordMatch);
  confirmPasswordController.addListener(_checkPasswordMatch);
}

void _checkPasswordMatch() {
  setState(() {});
}

  @override
  void dispose() {
  passwordController.removeListener(_checkPasswordMatch);
  confirmPasswordController.removeListener(_checkPasswordMatch);
    firstnameController.dispose();
    lastnameController.dispose();
    contactController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
      builder: (context, registerProvider, child) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(14),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 25),

                    /// IMAGE
                    Image.asset(
                      "assets/images/signup_image.png",
                      height: 180,
                    ),

                    const SizedBox(height: 20),

                    /// FIRST NAME
                    CustomTextField(
                      labelText: "Enter First Name",
                      hintText: "John",
                      controller: firstnameController,
                      validator: Validators.validateName,
                    ),

                    const SizedBox(height: 15),

                    /// LAST NAME
                    CustomTextField(
                      labelText: "Enter Last Name",
                      hintText: "Doe",
                      controller: lastnameController,
                      validator: Validators.validateName,
                    ),

                    const SizedBox(height: 15),

                    /// EMAIL
                    CustomTextField(
                      labelText: "Enter Email",
                      hintText: "abc@gmail.com",
                      controller: emailController,
                      validator: Validators.validateEmail,
                    ),

                    const SizedBox(height: 15),

                    /// CONTACT
                    CustomTextField(
                      labelText: "Enter Contact",
                      hintText: "9861XXXXXX",
                      controller: contactController,
                       keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      validator: Validators.validatePhone,
                    ),

                    const SizedBox(height: 15),

                    /// PASSWORD
                    CustomTextField(
                      labelText: "Enter Password",
                      hintText: "********",
                      controller: passwordController,
                      validator: Validators.validatePassword,
                       obscureText: registerProvider.isPasswordHidden,
                        suffixIcon: IconButton(
                        onPressed: () {
                          registerProvider.togglePasswordVisibility();
                        },
                        icon: Icon(
                          registerProvider.isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// CONFIRM PASSWORD
                    CustomTextField(
                    labelText: "Confirm Password",
                    hintText: "********",
                    controller: confirmPasswordController,
                    validator: (value) {
                      return Validators.validateConfirmPassword(
                        value,
                        passwordController.text,
                      );
                    },
                   obscureText: registerProvider.isConfirmPasswordHidden,

                    suffixIcon: IconButton(
                      onPressed: () {
                        registerProvider.toggleConfirmPasswordVisibility();
                      },
                      icon: Icon(
                        registerProvider.isConfirmPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),

                  if (confirmPasswordController.text.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 6,
                        left: 5,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          confirmPasswordController.text ==
                                  passwordController.text
                              ? "Passwords match ✓"
                              : "Passwords do not match",
                          style: TextStyle(
                            color: confirmPasswordController.text ==
                                    passwordController.text
                                ? Colors.green
                                : Colors.red,
                            fontSize: 13,
                          ),
                        ),
                      ),
                  ),

                    const SizedBox(height: 30),

                    /// REGISTER BUTTON
                    CustomButton(
                      text: "Register",
                      isLoading: registerProvider.isLoading,

                      onTap: () async {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }

                              final request = RegisterRequest(
                                firstName: firstnameController.text.trim(),
                                lastName: lastnameController.text.trim(),
                                email: emailController.text.trim(),
                                contactNumber: contactController.text.trim(),
                                password: passwordController.text,
                                confirmPassword:
                                    confirmPasswordController.text,
                              );

                              try {
                                await registerProvider.register(request);

                                 if (!context.mounted) return;

                                showSnackBar(
                                  context,
                                  "Registration Successful",
                                );

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const LoginScreen(),
                                  ),
                                  (route) => false,
                                );
                              }catch (e, stackTrace) {
                              debugPrint("REGISTER ERROR: $e");
                              debugPrintStack(stackTrace: stackTrace);

                              if (!context.mounted) return;

                              showSnackBar(
                                context,
                                e.toString(),
                              );
                            }
                            },
                    ),

                    const SizedBox(height: 20),

                    /// LOGIN
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                         "Already have an account? ",
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Login",
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
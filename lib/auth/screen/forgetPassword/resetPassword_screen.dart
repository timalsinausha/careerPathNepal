import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/snackar_bar.dart';
import '../../../core/utils/validators.dart';
import '../../provider/forget_passwordProvider.dart';
import '../login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;

  const ResetPasswordScreen({
    super.key,
    required this.email,
  });

  @override
  State<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState
    extends State<ResetPasswordScreen> {

  final formKey = GlobalKey<FormState>();

  final passwordController =
      TextEditingController();

  final confirmPasswordController =
      TextEditingController();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<ForgotPasswordProvider>(
      builder: (context, provider, child) {

        return Scaffold(
          backgroundColor: const Color(0xffF5F7FB),

          appBar: AppBar(
            title: const Text("Reset Password"),
            centerTitle: true,
          ),

          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),

              child: Form(
                key: formKey,

                child: Column(
                  children: [

                    const SizedBox(height: 35),

                    // =================================================
                    // ICON
                    // =================================================

                    Container(
                      height: 100,
                      width: 100,

                      decoration: BoxDecoration(
                        color: const Color(0xffE8F1FF),
                        borderRadius:
                            BorderRadius.circular(50),
                      ),

                      child: const Icon(
                        Icons.lock_reset,
                        size: 52,
                        color: Color(0xff274CFF),
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Create New Password",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "Create a strong password for your account.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 35),

                    // =================================================
                    // NEW PASSWORD
                    // =================================================

                    TextFormField(
                      controller: passwordController,

                      obscureText: isPasswordHidden,

                      decoration: InputDecoration(
                        labelText: "New Password",
                        hintText: "********",

                        prefixIcon: const Icon(
                          Icons.lock_outline,
                        ),

                        suffixIcon: IconButton(
                          onPressed: () {

                            setState(() {
                              isPasswordHidden =
                                  !isPasswordHidden;
                            });

                          },

                          icon: Icon(
                            isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),

                      validator:
                          Validators.validatePassword,
                    ),

                    const SizedBox(height: 18),

                    // =================================================
                    // CONFIRM PASSWORD
                    // =================================================

                    TextFormField(
                      controller:
                          confirmPasswordController,

                      obscureText:
                          isConfirmPasswordHidden,

                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        hintText: "********",

                        prefixIcon: const Icon(
                          Icons.lock_outline,
                        ),

                        suffixIcon: IconButton(
                          onPressed: () {

                            setState(() {
                              isConfirmPasswordHidden =
                                  !isConfirmPasswordHidden;
                            });

                          },

                          icon: Icon(
                            isConfirmPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),

                      validator: (value) {

                        return Validators
                            .validateConfirmPassword(
                          value,
                          passwordController.text,
                        );
                      },
                    ),

                    const SizedBox(height: 30),

                    // =================================================
                    // RESET BUTTON
                    // =================================================

                    SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton(
                        onPressed: provider.isLoading
                            ? null
                            : () async {

                                if (!formKey
                                    .currentState!
                                    .validate()) {

                                  return;
                                }

                                final success =
                                    await provider
                                        .resetPassword(
                                  email: widget.email,

                                  newPassword:
                                      passwordController
                                          .text,

                                  confirmPassword:
                                      confirmPasswordController
                                          .text,
                                );

                                if (!context.mounted) {
                                  return;
                                }

                                if (success) {

                                  showSnackBar(
                                    context,
                                    "Password reset successfully.",
                                  );

                                  await Future.delayed(
                                    const Duration(
                                      seconds: 1,
                                    ),
                                  );

                                  if (!context.mounted) {
                                    return;
                                  }

                                  Navigator.pushAndRemoveUntil(
                                    context,

                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const LoginScreen(),
                                    ),

                                    (route) => false,
                                  );

                                } else {

                                  showSnackBar(
                                    context,
                                    provider
                                            .errorMessage ??
                                        "Unable to reset password.",
                                  );
                                }
                              },

                        child: provider.isLoading
                            ? const SizedBox(
                                height: 24,
                                width: 24,

                                child:
                                    CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                "Reset Password",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                      ),
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
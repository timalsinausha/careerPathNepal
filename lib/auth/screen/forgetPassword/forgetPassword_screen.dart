import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/forget_passwordProvider.dart';
import 'otp_verifiedScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<ForgotPasswordProvider>(
      builder: (context, provider, child) {

        return Scaffold(
          backgroundColor: const Color(0xffF5F7FB),

          appBar: AppBar(
            title: const Text("Forgot Password"),
            centerTitle: true,
          ),

          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),

              child: Form(
                key: formKey,

                child: Column(
                  children: [

                    const SizedBox(height: 40),

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
                        size: 55,
                        color: Color(0xff274CFF),
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "Enter the email address associated with your account. We'll send you a verification code.",
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 35),

                    // =================================================
                    // EMAIL
                    // =================================================

                    TextFormField(
                      controller: emailController,

                      keyboardType:
                          TextInputType.emailAddress,

                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "abc@gmail.com",

                        prefixIcon: const Icon(
                          Icons.email_outlined,
                        ),

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),

                      validator: (value) {

                        if (value == null ||
                            value.trim().isEmpty) {

                          return "Email is required";
                        }

                        if (!value.contains("@")) {

                          return "Enter a valid email";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 30),

                    // =================================================
                    // SEND OTP
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

                                final email =
                                    emailController
                                        .text
                                        .trim();

                                final success =
                                    await provider
                                        .sendOTP(email);

                                if (!context.mounted) {
                                  return;
                                }

                                if (success) {

                                  Navigator.push(
                                    context,

                                    MaterialPageRoute(
                                      builder: (_) =>
                                          VerifyOTPScreen(
                                        email: email,
                                      ),
                                    ),
                                  );

                                } else {

                                  ScaffoldMessenger
                                      .of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        provider
                                                .errorMessage ??
                                            "Unable to send OTP",
                                      ),
                                    ),
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
                                "Send OTP",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      child: const Text(
                        "Back to Login",
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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/forget_passwordProvider.dart';
import 'resetPassword_screen.dart';

class VerifyOTPScreen extends StatefulWidget {
  final String email;

  const VerifyOTPScreen({
    super.key,
    required this.email,
  });

  @override
  State<VerifyOTPScreen> createState() =>
      _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {

  final formKey = GlobalKey<FormState>();

  final otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<ForgotPasswordProvider>(
      builder: (context, provider, child) {

        return Scaffold(
          backgroundColor: const Color(0xffF5F7FB),

          appBar: AppBar(
            title: const Text("Verify OTP"),
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
                        Icons.mark_email_read_outlined,
                        size: 50,
                        color: Color(0xff274CFF),
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Verify Your Email",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      "We've sent a 6-digit verification code to\n${widget.email}",

                      textAlign: TextAlign.center,

                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 35),

                    // =================================================
                    // OTP
                    // =================================================

                    TextFormField(
                      controller: otpController,

                      keyboardType:
                          TextInputType.number,

                      textAlign: TextAlign.center,

                      maxLength: 6,

                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly,

                        LengthLimitingTextInputFormatter(
                          6,
                        ),
                      ],

                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 8,
                      ),

                      decoration: InputDecoration(
                        labelText: "Enter OTP",
                        hintText: "123456",

                        counterText: "",

                        prefixIcon: const Icon(
                          Icons.lock_outline,
                        ),

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),

                      validator: (value) {

                        if (value == null ||
                            value.isEmpty) {

                          return "OTP is required";
                        }

                        if (value.length != 6) {

                          return "OTP must be 6 digits";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 30),

                    // =================================================
                    // VERIFY BUTTON
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
                                        .verifyOTP(
                                  email: widget.email,
                                  otp: otpController
                                      .text
                                      .trim(),
                                );

                                if (!context.mounted) {
                                  return;
                                }

                                if (success) {

                                  Navigator.pushReplacement(
                                    context,

                                    MaterialPageRoute(
                                      builder: (_) =>
                                          ResetPasswordScreen(
                                        email:
                                            widget.email,
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
                                            "Invalid OTP",
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
                                "Verify OTP",
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
                        "Change Email",
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
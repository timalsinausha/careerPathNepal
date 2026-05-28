import 'package:careernepal/core/snackar_bar.dart';
import 'package:careernepal/core/validators.dart';
import 'package:flutter/material.dart';

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

                /// IMAGE
                Center(
                  child: Image.asset(
                    "assets/images/login_screen_photo.png",
                    height: 170,
                  ),
                ),

                const SizedBox(height: 20),

                /// EMAIL FIELD
                CustomTextField(
                  hintText: "abc@gmail.com",
                  labelText: "Enter Email",
                  controller: emailController,
                  validator: Validators.validateEmail,
                ),

                const SizedBox(height: 18),

                /// PASSWORD FIELD
                CustomTextField(
                  hintText: "********",
                  labelText: "Enter Password",
                  controller: passwordController,
                  validator: Validators.validatePassword,
                  isPassword: true,
                ),

                const SizedBox(height: 8),

                /// FORGOT PASSWORD
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

                /// LOGIN BUTTON
                CustomButton(
                  text: "Login",
                  onTap: () {

                    if (formKey.currentState!.validate()) {

                      showSnackBar(
                        context,
                        "Login Successful",
                      );
                    }
                  },
                ),

                const SizedBox(height: 25),

                /// REGISTER
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [

                    const CustomText(
                      text: "Don’t have Account? ",
                    ),

                    GestureDetector(
                      onTap: () {},
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
  }
}
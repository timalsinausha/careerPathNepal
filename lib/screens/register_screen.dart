import 'package:careernepal/core/snackar_bar.dart';
import 'package:careernepal/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/validators.dart';
import '../providers/register_provider.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState
    extends State<RegisterScreen> {

  final formKey = GlobalKey<FormState>();

  final nameController =
      TextEditingController();

  final contactController =
      TextEditingController();

  final addressController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  final confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => RegisterProvider(),

      child: Scaffold(
        backgroundColor:
            Colors.grey.shade200,

        body: SafeArea(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.all(14),

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

                  /// FULL NAME
                  CustomTextField(
                    labelText:
                        "Enter First Name",

                    hintText: "abc",

                    controller:
                        nameController,

                    validator:
                        Validators
                            .validateName,
                  ),

                  const SizedBox(height: 15),

                                    CustomTextField(
                    labelText:
                        "Enter Last Name",

                    hintText: "abc",

                    controller:
                        nameController,

                    validator:
                        Validators
                            .validateName,
                  ),


                  /// CONTACT
                  CustomTextField(
                    labelText:
                        "Enter Contact",

                    hintText:
                        "9861XXXXXX",

                    controller:
                        contactController,

                    validator:
                        Validators
                            .validatePhone,
                  ),

                  const SizedBox(height: 15),

               
                  CustomTextField(
                    labelText:
                        "Enter Email",

                    hintText: "abc@gmail.com",

                    controller:
                        addressController,

                    validator:
                        Validators
                            .validateAddress,
                  ),

                  const SizedBox(height: 15),

                  /// PASSWORD
                  CustomTextField(
                    labelText:
                        "Enter Password",

                    hintText:
                        "********",

                    controller:
                        passwordController,

                    validator:
                        Validators
                            .validatePassword,

                    isPassword: true,
                  ),

                  const SizedBox(height: 15),

                  /// CONFIRM PASSWORD
                  CustomTextField(
                    labelText:
                        "Enter Confirm Password",

                    hintText:
                        "********",

                    controller:
                        confirmPasswordController,

                    validator: (value) {

                      return Validators
                          .validateConfirmPassword(
                        value,
                        passwordController
                            .text,
                      );
                    },

                    isPassword: true,
                  ),

                  // const SizedBox(height: 15),

                  // /// DROPDOWN
                  // const CustomDropdown(),

                  const SizedBox(height: 30),

                  /// BUTTON
                  CustomButton(
                    text: "Register",

                    onTap: () {

                      if (formKey
                          .currentState!
                          .validate()) {

                        showSnackBar(
                          context,
                          "Register Successful",
                        );
                      }
                    },
                  ),

                  const SizedBox(height: 20),

                  /// LOGIN
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .center,

                    children: [

                      const CustomText(
                        text:
                            "Already have Account? ",
                      ),

                      GestureDetector(
                        onTap: () {
                         Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: const Text(
                          "Login",

                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight:
                                FontWeight.bold,
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
      ),
    );
  }
}
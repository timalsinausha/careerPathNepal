import 'package:careernepal/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/snackar_bar.dart';
import '../../../core/utils/validators.dart';
import '../../../widgets/custom_textfield.dart';
import '../../provider/changePassword_Provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState
    extends State<ChangePasswordScreen> {

  final formKey = GlobalKey<FormState>();

  final currentPasswordController =
      TextEditingController();

  final newPasswordController =
      TextEditingController();

  final confirmPasswordController =
      TextEditingController();

      @override
void initState() {
  super.initState();

  newPasswordController.addListener(_checkPasswordMatch);
  confirmPasswordController.addListener(_checkPasswordMatch);
}
void _checkPasswordMatch() {
  setState(() {});
}

  @override
  void dispose() {
    newPasswordController.removeListener(_checkPasswordMatch);
  confirmPasswordController.removeListener(_checkPasswordMatch);
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePasswordProvider>(
      builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: const Color(0xffF5F7FB),
      
        appBar: AppBar(
          title: const Text("Change Password"),
        ),
      
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
      
            child: Form(
              key: formKey,
      
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
      
                children: [
      
                  const SizedBox(height: 20),
      
                  const Center(
                    child: Icon(
                      Icons.lock_reset,
                      size: 80,
                      color: Color(0xff274CFF),
                    ),
                  ),
      
                  const SizedBox(height: 20),
      
                  const Center(
                    child: Text(
                      "Change Your Password",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
      
                  const SizedBox(height: 8),
      
                  const Center(
                    child: Text(
                      "Enter your current password and choose a new password.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
      
                  const SizedBox(height: 30),
      
                  CustomTextField(
                    labelText: "Current Password",
                    hintText: "Enter current password",
                    controller:
                        currentPasswordController,
                    validator:
                        Validators.validatePassword,
                     obscureText: provider.isOldPasswordHidden,

                    suffixIcon: IconButton(
                      onPressed: () {
                        provider.toggleOldPasswordVisibility();
                      },
                      icon: Icon(
                        provider.isOldPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),

                  ),
      
                  const SizedBox(height: 18),
      
                  CustomTextField(
                    labelText: "New Password",
                    hintText: "Enter new password",
                    controller:
                        newPasswordController,
                    validator:
                        Validators.validatePassword,
                     obscureText: provider.isPasswordHidden,

                    suffixIcon: IconButton(
                      onPressed: () {
                        provider.togglePasswordVisibility();
                      },
                      icon: Icon(
                        provider.isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
      
                  const SizedBox(height: 18),
      
                  CustomTextField(
                    labelText: "Confirm New Password",
                    hintText: "Re-enter new password",
                    controller:
                        confirmPasswordController,
                    validator: (value) {
                      return Validators
                          .validateConfirmPassword(
                        value,
                        newPasswordController.text,
                      );
                    },
                     obscureText: provider.isConfirmPasswordHidden,

                    suffixIcon: IconButton(
                      onPressed: () {
                        provider.toggleConfirmPasswordVisibility();
                      },
                      icon: Icon(
                        provider.isConfirmPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
      
                  const SizedBox(height: 30),
      
                  SizedBox(
                    width: double.infinity,
                    height: 55,
      
                    child: CustomButton(
                      onTap: provider.isLoading
                        ? null
                        : () async {

                            if (!formKey.currentState!.validate()) {
                              return;
                            }

                            final success =
                                await provider.changePassword(
                              currentPassword:
                                  currentPasswordController.text,
                              newPassword:
                                  newPasswordController.text,
                            );

                            if (!context.mounted) return;

                            if (success) {

                              showSnackBar(
                                context,
                                "Password changed successfully.",
                              );

                              Navigator.pop(context);

                            } else {

                              showSnackBar(
                                context,
                                provider.errorMessage ??
                                    "Unable to change password.",
                              );
                            }
                          },

      
                      text:  "Change Password",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      }
    );
  }
}
import 'package:careernepal/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/colors.dart';

class CustomTextField extends StatelessWidget {

  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<LoginProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          labelText,
          style: const TextStyle(fontSize: 12),
        ),

        const SizedBox(height: 5),

        TextFormField(
          controller: controller,
          validator: validator,
          obscureText:
              isPassword ? provider.isPasswordHidden : false,

          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: AppColors.grey,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),

            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {
                      provider.togglePassword();
                    },
                    icon: Icon(
                      provider.isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
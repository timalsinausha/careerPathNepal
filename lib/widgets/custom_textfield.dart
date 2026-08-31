import 'package:careernepal/auth/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../core/utils/colors.dart';

class CustomTextField extends StatelessWidget {

  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?) validator;
 // final bool isPassword;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  bool obscureText;
  Widget? suffixIcon;

   CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.validator,
   // this.isPassword = false,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.suffixIcon
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
          keyboardType: keyboardType,
          obscureText: obscureText,
             inputFormatters: inputFormatters,

          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: AppColors.grey,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),

            suffixIcon:suffixIcon,
          ),
        ),
      ],
    );
  }
}
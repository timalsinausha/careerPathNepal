import 'package:flutter/material.dart';
import '../models/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {

  final OnboardingModel data;

  const OnboardingPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        const SizedBox(height: 70),

        /// TITLE
        Text(
          data.title,
          textAlign: TextAlign.center,

          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xff4B6BFB),
            height: 1.1,
          ),
        ),

        const SizedBox(height: 40),

        /// IMAGE ONLY
        Expanded(
          child: Center(
            child: Hero(
              tag: data.image,

              child: Image.asset(
                data.image,
                height: 260,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
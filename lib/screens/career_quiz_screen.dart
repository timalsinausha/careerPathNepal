import 'package:careernepal/widgets/custom_banner_card.dart';
import 'package:careernepal/widgets/custom_button.dart';
import 'package:careernepal/widgets/custom_feature_tile.dart';
import 'package:flutter/material.dart';


class CareerQuizScreen extends StatelessWidget {
  const CareerQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),

        title: const Text(
          "Career Quiz",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),

        child: Column(
          children: [

            const CustomBannerCard(),

            const SizedBox(height: 18),

            const CustomFeatureTile(
              icon: Icons.schedule,
              title: "Take only 5-10 minutes",
            ),

            const SizedBox(height: 10),

            const CustomFeatureTile(
              icon: Icons.lightbulb_outline,
              title: "Smart Recommendation",
            ),

            const SizedBox(height: 10),

            const CustomFeatureTile(
              icon: Icons.security,
              title: "100% Accurate and Private",
            ),

            const Spacer(),

          CustomButton(
  text: "Start Quiz",
  onTap: () {
    // Navigate to quiz screen
  },
),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
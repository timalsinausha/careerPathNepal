import 'package:flutter/material.dart';

class CustomBannerCard extends StatelessWidget {
  const CustomBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          "assets/images/custom_banner_card.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
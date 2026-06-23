import 'package:careernepal/widgets/Custom_profile_info_tile.dart';
import 'package:flutter/material.dart';


class CustomProfileInfoCard extends StatelessWidget {
  const CustomProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: const Column(
        children: [
          CustomProfileInfoTile(
            title: "Email",
            value: "example@gmail.com",
          ),
          Divider(height: 1),
          CustomProfileInfoTile(
            title: "Address",
            value: "Kathmandu, Nepal",
          ),
          Divider(height: 1),
          CustomProfileInfoTile(
            title: "Contact No",
            value: "9800000000",
          ),
          Divider(height: 1),
          CustomProfileInfoTile(
            title: "Emergency Contact",
            value: "9811111111",
          ),
        ],
      ),
    );
  }
}

import 'package:careernepal/widgets/custom_profile_image.dart';
import 'package:careernepal/widgets/custom_profile_info_card.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),

        centerTitle: true,

        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const CustomProfileImage(),

            const SizedBox(height: 40),

            const CustomProfileInfoCard(),

            const SizedBox(height: 20),

            // CustomSettingTile(
            //   title: "Change Password",
            //   onTap: () {}, icon: Icons.add_ic_call_outlined,
            // ),
          ],
        ),
      ),
      
    );
  }
}
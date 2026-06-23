import 'package:careernepal/providers/profile_provider.dart';
import 'package:careernepal/widgets/custom_setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CustomSettingSectionCard extends StatelessWidget {
  const CustomSettingSectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileProvider>().profile;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        children: [

          /// Profile Tile
         CustomSettingTile(
            title: profile.name,
            icon: Icons.account_circle_outlined,
            onTap: () {},
          ),

          const Divider(height: 1),

          /// Career Preference
          CustomSettingTile(
            title: "Career Preferences",
            icon: Icons.track_changes_outlined,
            onTap: () {},
          ),

          const Divider(height: 1),

          const SizedBox(height: 60),

          const Divider(height: 1),

          /// Saved
          CustomSettingTile(
            title: "Saved",
            icon: Icons.bookmark_border,
            onTap: () {},
          ),

          const Divider(height: 1),

          /// Logout
          CustomSettingTile(
            title: "Logout",
            icon: Icons.logout,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
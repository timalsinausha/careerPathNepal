import 'package:flutter/material.dart';
import '../auth/model/profile_response.dart';
import 'Custom_profile_info_tile.dart';

class CustomProfileInfoCard extends StatelessWidget {

  final ProfileResponse profile;

  const CustomProfileInfoCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {

    final user = profile.user;
    final student = profile.studentProfile;

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

      child: Column(
        children: [

          CustomProfileInfoTile(
            title: "Email",
            value: user.email,
          ),

          const Divider(height: 1),

          CustomProfileInfoTile(
            title: "Contact No",
            value: user.contactNumber,
          ),

          const Divider(height: 1),

          CustomProfileInfoTile(
            title: "Education",
            value:
                student.highestEducationLevel ??
                "Not provided",
          ),

          const Divider(height: 1),

          CustomProfileInfoTile(
            title: "Institution",
            value:
                student.highestEducationInstitution ??
                "Not provided",
          ),

          const Divider(height: 1),

          CustomProfileInfoTile(
            title: "GPA / CGPA",
            value:
                student.academicScore
                    ?.toString() ??
                "Not provided",
          ),

          const Divider(height: 1),

          CustomProfileInfoTile(
            title: "Province",
            value:
                student.province?.name ??
                "Not provided",
          ),

          const Divider(height: 1),

          CustomProfileInfoTile(
            title: "District",
            value:
                student.district?.name ??
                "Not provided",
          ),

          const Divider(height: 1),

          CustomProfileInfoTile(
            title: "Budget Range",
            value:
                student.budgetRange ??
                "Not provided",
          ),
        ],
      ),
    );
  }
}
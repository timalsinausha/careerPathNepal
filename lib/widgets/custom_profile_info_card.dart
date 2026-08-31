import 'package:flutter/material.dart';
import '../auth/model/profile_response.dart';
import '../auth/screen/changepassword_screen.dart';
import 'Custom_profile_info_tile.dart';

class CustomProfileInfoCard extends StatelessWidget {
  final ProfileResponse profile;
  final VoidCallback onEditContact;
  final VoidCallback onEditStudentProfile;

  const CustomProfileInfoCard({
    super.key,
    required this.profile,
    required this.onEditContact,
    required this.onEditStudentProfile,
  });

  @override
  Widget build(BuildContext context) {
    final user = profile.user;
    final student = profile.studentProfile;

    return Column(
      children: [

        // =====================================================
        // PERSONAL INFORMATION
        // =====================================================

        _sectionCard(
          title: "Personal Information",
          icon: Icons.person_outline,
          children: [

            CustomProfileInfoTile(
              title: "Email",
              value: user.email,
            ),

            const Divider(height: 1),

            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              title: const Text(
                "Contact Number",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              subtitle: Text(
                user.contactNumber.isEmpty
                    ? "Not provided"
                    : user.contactNumber,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Color(0xff274CFF),
                ),
                onPressed: onEditContact,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // =====================================================
        // EDUCATION BACKGROUND
        // =====================================================

        _sectionCard(
          title: "Education Background",
          icon: Icons.school_outlined,
          trailing: TextButton.icon(
            onPressed: onEditStudentProfile,
            icon: const Icon(
              Icons.edit_outlined,
              size: 18,
            ),
            label: Text(
              student.isProfileCompleted
                  ? "Edit"
                  : "Complete",
            ),
          ),
          children: [

            CustomProfileInfoTile(
              title: "Highest Education",
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
                  student.academicScore?.toString() ??
                  "Not provided",
            ),

            const Divider(height: 1),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                      "Current Location and Budget",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

        const SizedBox(height: 16),
        const SizedBox(height: 16),

_sectionCard(
  title: "Account Security",
  icon: Icons.security_outlined,
  children: [
    ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xffEEF2FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.lock_outline,
          color: Color(0xff274CFF),
        ),
      ),
      title: const Text(
        "Change Password",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: const Text(
        "Update your account password",
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ChangePasswordScreen(),
          ),
        );
      },
    ),
  ],
),
      ],
    );
  }

  // ===========================================================
  // SECTION CARD
  // ===========================================================

  Widget _sectionCard({
    required String title,
    required IconData icon,
    Widget? trailing,
    required List<Widget> children,
  }) {
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

          // Section header
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              14,
              8,
              10,
            ),
            child: Row(
              children: [

                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    color: const Color(0xffEEF2FF),
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xff274CFF),
                    size: 21,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                if (trailing != null)
                  trailing,
              ],
            ),
          ),

          const Divider(height: 1),

          // Information
          ...children,
        ],
      ),
    );
  }
}
import 'package:careernepal/widgets/custom_profile_image.dart';
import 'package:careernepal/widgets/custom_profile_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/profile_provider.dart';
import 'profile_firststep.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().getProfile();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,

        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

     body: Consumer<ProfileProvider>(
  builder: (
    context,
    profileProvider,
    child,
  ) {

  if (profileProvider.isLoading &&
    !profileProvider.hasLoadedProfile) {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

if (profileProvider.error != null &&
    !profileProvider.hasLoadedProfile) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Unable to load profile",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 12),

        ElevatedButton(
          onPressed: profileProvider.getProfile,
          child: const Text("Try Again"),
        ),
      ],
    ),
  );
}

final profile = profileProvider.profile;

if (profile == null) {
  return const Center(
    child: Text("Profile not available"),
  );
}

    if (profileProvider.error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            const Text(
              "Unable to load profile",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: profileProvider.getProfile,
              child: const Text("Try Again"),
            ),
          ],
        ),
      );
    }

    //final profile = profileProvider.profile;

    // if (profile == null) {
    //   return const Center(
    //     child: Text("Profile not found"),
    //   );
    // }

    return SingleChildScrollView(
      child: Column(
        children: [

          const CustomProfileImage(),

          const SizedBox(height: 20),

          Text(
            "${profile.user.firstName} ${profile.user.lastName}",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            profile.user.email,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 30),

          CustomProfileInfoCard(
            profile: profile,
             onEditContact: () {
            _showEditContactDialog(
              context,
              profile.user.contactNumber,
            );
          },
           onEditStudentProfile: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileFirstStep(
                 profile: profile,
                ),
              ),
            );
          },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  },
),
      
    );
  }

  void _showEditContactDialog(
  BuildContext context,
  String currentContact,
) {
  final controller = TextEditingController(
    text: currentContact,
  );

  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: const Text(
          "Update Contact Number",
        ),

        content: TextField(
          controller: controller,
          keyboardType: TextInputType.phone,
            inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],

          decoration: const InputDecoration(
            labelText: "Contact Number",
            hintText: "9800000000",
            border: OutlineInputBorder(),
          ),
        ),

        actions: [

          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
            },
            child: const Text("Cancel"),
          ),

          ElevatedButton(
            onPressed: () async {

              final contact =
                  controller.text.trim();

              if (contact.isEmpty) {
                return;
              }

              final provider =
                  context.read<ProfileProvider>();

              final success =
                  await provider.updateUserProfile(
                contactNumber: contact,
              );

              if (!context.mounted) return;

              Navigator.pop(dialogContext);

              if (success) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Contact number updated successfully",
                    ),
                  ),
                );
              }
            },

            child: const Text("Save"),
          ),
        ],
      );
    },
  );
}
}
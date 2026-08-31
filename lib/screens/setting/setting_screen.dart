import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../assessment/provider/assessment_provider.dart';
import '../../auth/provider/auth_provider.dart';
import '../../auth/screen/login_screen.dart';
import '../../careers/providers/recommendation_provider.dart';
import '../../core/dialogs/confirmation_dialog.dart';
import 'about_us_screen.dart';
import 'contactUs_screen.dart';
import 'privacy_policy_screen.dart';

class SettingsScreen extends StatefulWidget {
 const SettingsScreen({super.key,});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,

        title: const Text(
          "Setting",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                 Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AboutUs()));
              },
              child: Container(
                 height: 50,
                                        
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(2, 2),
                    ),
                  ]),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Image.asset(
                        "assets/images/User.png",
                        height: 24,
                        width: 24,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "About Us",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                           Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AboutUs()));
                        },
                        icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                  Navigator.push(context,
                             MaterialPageRoute(builder: (context) => ContactUs()));
              },
              child: Container(
                 height: 50,
                                        
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(2, 2),
                    ),
                  ]),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(
                        "assets/images/contact.png",
                        height: 28,
                        width: 27,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Contact Us",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ContactUs()));
                        },
                        icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                 Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacyPolicy()));
              },
              child: Container(
                 height: 50,
                                        
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  ),
                ]),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Image.asset(
                        "assets/images/check.png",
                        height: 34,
                        width: 34,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrivacyPolicy()));
                        },
                        icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
               onTap: () async {

                          final shouldLogout =
                              await ConfirmationDialog.show(
                            context: context,
                            title: "Logout",
                            message: "Are you sure you want to log out?",
                            confirmText: "Yes",
                            cancelText: "NO",
                          );

                          if (!shouldLogout) return;
                          context.read<RecommendationProvider>().clear();
                          context.read<AssessmentProvider>().clear();

                          await context.read<AuthProvider>().logout();

                          if (!context.mounted) return;

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                            (route) => false,
                          );
                        },
              child: Container(
                 height: 50,
                                        
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  ),
                ]),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(
                        "assets/images/logout.png",
                        height: 25,
                        width: 25,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Spacer(),
                    IconButton(
                         onPressed: () async {

                          final shouldLogout =
                              await ConfirmationDialog.show(
                            context: context,
                            title: "Logout",
                            message: "Are you sure you want to log out?",
                            confirmText: "Yes",
                            cancelText: "NO",
                          );

                          if (!shouldLogout) return;

                          await context.read<AuthProvider>().logout();

                          if (!context.mounted) return;

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                            (route) => false,
                          );
                        },
                      
                        icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 10,
            ),
                    ],
                  ),
          )),
    );
  }

  // void logoutConfirmation(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => Consumer<SigninProvider>(
  //       builder: (context, signinProvider, child) => AlertDialog(
  //         title: const Text(
  //           'Confirm Logout',
  //         ),
  //         content: const Text(
  //           'Are you sure you want to logout Account?',
  //           textAlign: TextAlign.start,
  //           style: TextStyle(fontSize: 16),S
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context); // Close the dialog
  //             },
  //             child: const Text(
  //               'Cancel',
  //             ),
  //           ),
  //           TextButton(
  //             onPressed: () async {
  //              signinProvider.removeValueFromSharedPreference();
  //               Navigator.push(
  //                   context, MaterialPageRoute(builder: (context) => SignIn()));
  //             },
  //             child: const Text(
  //               'logout',
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

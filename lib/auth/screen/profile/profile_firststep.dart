import 'package:careernepal/auth/screen/profile/profile_secondstep.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../navigation/screen/main_navigation_screen.dart';
import '../../model/education_level.dart';
import '../../model/profile_response.dart';
import '../../provider/profile_provider.dart';


class ProfileFirstStep extends StatefulWidget {
   final ProfileResponse? profile;
  const ProfileFirstStep({super.key,this.profile});

  @override
  State<ProfileFirstStep> createState() =>
      _ProfileFirstStepState();
}

class _ProfileFirstStepState
    extends State<ProfileFirstStep> {
  bool get isEditing => widget.profile != null;
  final _formKey = GlobalKey<FormState>();

  final institutionController =
      TextEditingController();

  final scoreController =
      TextEditingController();

  String? selectedEducation;
@override
void initState() {
  super.initState();

  if (widget.profile != null) {
    final provider =
        context.read<ProfileProvider>();

    provider.initializeDraftFromProfile(
      widget.profile!,
    );

    final student =
        widget.profile!.studentProfile;

    selectedEducation =
        student.highestEducationLevel;

    institutionController.text =
        student.highestEducationInstitution ?? "";

    scoreController.text =
        student.academicScore?.toString() ?? "";
  }
}

  @override
  void dispose() {
    institutionController.dispose();
    scoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (
        context,
        profileProvider,
        child,
      ) {
        return Scaffold(
          backgroundColor:
              const Color(0xffF5F7FB),

          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [

                    /// HEADER
                    Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.all(24),

                      decoration:
                          const BoxDecoration(
                        gradient:
                            LinearGradient(
                          colors: [
                            Color(0xff2DB3DB),
                            Color(0xff0F62BC),
                          ],
                        ),
                        borderRadius:
                            BorderRadius.only(
                          bottomLeft:
                              Radius.circular(32),
                          bottomRight:
                              Radius.circular(32),
                        ),
                      ),

                      child: Column(
                        children: [

                          Image.asset(
                            "assets/images/student.jpg",
                            // height: 120,
                            // width: 200,
                          ),

                          const SizedBox(
                            height: 12,
                          ),

                           Text(
                            isEditing?
                            "Edit Your Profile" : "Complete Your Profile",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(
                            height: 8,
                          ),

                          const Text(
                            "Help us recommend the best colleges and courses for you.",
                            textAlign:
                                TextAlign.center,
                            style: TextStyle(
                              color:
                                  Colors.white70,
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          ClipRRect(
                            borderRadius:
                                BorderRadius
                                    .circular(20),
                            child:
                                const LinearProgressIndicator(
                              value: 0.5,
                              minHeight: 10,
                              backgroundColor:
                                  Colors.white,
                            ),
                          ),

                          const SizedBox(
                            height: 8,
                          ),

                          const Text(
                            "Step 1 of 2",
                            style: TextStyle(
                              color:
                                  Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    /// CARD

                    Padding(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),

                      child: Card(
                        elevation: 4,

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                            24,
                          ),
                        ),

                        child: Padding(
                          padding:
                              const EdgeInsets.all(
                            20,
                          ),

                          child: Column(
                            children: [

                              Row(
                                children: const [

                                  Icon(
                                    Icons.school,
                                    color: Color(
                                      0xff0F62BC,
                                    ),
                                  ),

                                  SizedBox(
                                    width: 10,
                                  ),

                                  Text(
                                    "Academic Information",
                                    style:
                                        TextStyle(
                                      fontSize:
                                          18,
                                      fontWeight:
                                          FontWeight
                                              .bold,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 24,
                              ),

                              CustomDropdown<String>(
                                label:
                                    "Highest Education",

                                icon: Icons.school,

                                value:
                                    selectedEducation,

                                items:
                                    EducationLevel
                                        .levels
                                        .map(
                                          (e) =>
                                              DropdownMenuItem<
                                                  String>(
                                            value:
                                                e.value,
                                            child:
                                                Text(
                                              e.label,
                                            ),
                                          ),
                                        )
                                        .toList(),

                                onChanged:
                                    (value) {
                                  setState(() {
                                    selectedEducation =
                                        value;
                                  });
                                },

                                validator:
                                    (value) {
                                  if (value ==
                                      null) {
                                    return "Select education level";
                                  }

                                  return null;
                                },
                              ),

                              const SizedBox(
                                height: 16,
                              ),

                              CustomTextField(
                                controller:
                                    institutionController,

                                labelText:
                                    "School / College / University",

                                hintText:
                                    "Kathmandu Model College",

                                validator:
                                    (value) {
                                  if (value ==
                                          null ||
                                      value
                                          .trim()
                                          .isEmpty) {
                                    return "Institution is required";
                                  }

                                  return null;
                                },
                              ),

                              const SizedBox(
                                height: 16,
                              ),

                              CustomTextField(
                                controller:
                                    scoreController,

                                labelText:
                                    "GPA / CGPA",

                                hintText:
                                    "Example: 3.82",

                                keyboardType:
                                    TextInputType
                                        .number,

                                validator:
                                    (value) {

                                  if (value ==
                                          null ||
                                      value
                                          .isEmpty) {
                                    return "Academic score is required";
                                  }

                                  final score =
                                      double.tryParse(
                                    value,
                                  );

                                  if (score ==
                                      null) {
                                    return "Invalid score";
                                  }

                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),

                      child: Row(
                        children: [
                          
                          Expanded(
                          child: OutlinedButton(
                            style:
                                OutlinedButton.styleFrom(
                              minimumSize:
                                  const Size(
                                double.infinity,
                                55,
                              ),
      
                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                            16),
                              ),
                            ),
                          onPressed: () async {
                            print("clicked.");
                            final provider =
                                context.read<ProfileProvider>();

                            provider.setEducation(
                              level: selectedEducation,
                              institution:
                                  institutionController.text.trim(),
                              score: double.tryParse(
                                scoreController.text.trim(),
                              ),
                            );

                            await provider.saveProfile();

                            if (!context.mounted) return;

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const MainNavigationScreen(),
                              ),
                              (route) => false,
                            );
                          },
      
//                             onPressed: () {
//                               Navigator.pushReplacement(
//   context,
//   MaterialPageRoute(
//     builder: (_) => const MainNavigationScreen(),
//   ),
// );
//                               //  Navigator.push(
//                               //     context,
//                               //     MaterialPageRoute(
//                               //       builder: (_) =>
//                               //           const HomeScreen(),
//                               //     ),
//                               //   );
                             
//                             },
      
                            child: const Text(
                              "Skip",
                            ),
                          ),
                        ),

                        SizedBox(width: 12,),


                          Expanded(
                              flex: 2,
                            child: CustomButton(
                              text: "Continue",
                            
                              onTap: () {
                            
                                if (!_formKey
                                    .currentState!
                                    .validate()) {
                                  return;
                                }
                            
                                profileProvider
                                    .setEducation(
                                  level:
                                      selectedEducation!,
                                  institution:
                                      institutionController
                                          .text
                                          .trim(),
                                  score: double.parse(
                                    scoreController
                                        .text,
                                  ),
                                );
                            
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const ProfileSecondStep(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  
}
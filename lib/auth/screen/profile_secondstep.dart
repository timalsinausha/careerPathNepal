import 'package:careernepal/core/snackar_bar.dart';
import 'package:careernepal/navigation/screen/main_navigation_screen.dart';
import 'package:careernepal/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/update_profile_request.dart';
import '../provider/profile_provider.dart';
import '../../core/constants/budget_constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';

class ProfileSecondStep extends StatefulWidget {
  const ProfileSecondStep({super.key});

  @override
  State<ProfileSecondStep> createState() =>
      _ProfileSecondStepState();
}

class _ProfileSecondStepState
    extends State<ProfileSecondStep> {
  final _formKey = GlobalKey<FormState>();

  int? selectedProvince;
  int? selectedDistrict;
  String? selectedBudget;
  

@override
void initState() {
  super.initState();

  final provider =
      context.read<ProfileProvider>();

  // Load existing values
  selectedProvince =
      provider.draftProfile.provinceId;

  selectedDistrict =
      provider.draftProfile.districtId;

  selectedBudget =
      provider.draftProfile.budgetRange;

  WidgetsBinding.instance.addPostFrameCallback(
    (_) async {
      // Load province list
      await provider.loadProvinces();

      // Load districts belonging to
      // the existing province
      if (selectedProvince != null) {
        await provider.loadDistricts(
          selectedProvince!,
        );
      }
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) {
        if(profileProvider.isLoading){
          return const Scaffold(
             body: Center(
      child: CircularProgressIndicator(),
    ),
          );

        } 
     return  Scaffold(
        backgroundColor: const Color(0xffF5F7FB),
      
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
      
              child: Column(
                children: [
      
                  /// HEADER
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
      
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff2DB3DB),
                          Color(0xff0F62BC),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                    ),
      
                    child: Column(
                      children: [
      
                        Image.asset(
                          "assets/images/student.jpg",
                          // height: 120,
                        ),
      
                        const SizedBox(height: 12),
      
                        const Text(
                          "Complete Your Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
      
                        const SizedBox(height: 8),
      
                        const Text(
                          "Help us recommend the best colleges and career paths for you.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
      
                        const SizedBox(height: 20),
      
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20),
                          child:
                              const LinearProgressIndicator(
                            value: 1,
                            minHeight: 10,
                            backgroundColor:
                                Colors.white,
                          ),
                        ),
      
                        const SizedBox(height: 8),
      
                        const Text(
                          "Step 2 of 2",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
      
                  const SizedBox(height: 24),
      
                  /// CARD
      
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
      
                    child: Card(
                      elevation: 4,
      
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(24),
                      ),
      
                      child: Padding(
                        padding:
                            const EdgeInsets.all(20),
      
                        child: Column(
                          children: [
      
                          const Row(
                              children: const [
      
                                Icon(
                                  Icons.location_on,
                                  color:
                                      Color(0xff0F62BC),
                                ),
      
                                SizedBox(width: 10),
      
                                Text(
                                  "Location & Budget",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
      
                            const SizedBox(height: 25),
      
                            /// Province
      
                            CustomDropdown<int>(
                            label: "Province",
                            icon: Icons.location_city,

                            value: selectedProvince,

                            items: profileProvider.provinces.map((province) {
                              return DropdownMenuItem<int>(
                                value: province.id,
                                child: Text(province.name),
                              );
                            }).toList(),

                            onChanged: (value) async {
                              if (value == null) return;

                              setState(() {
                                selectedProvince = value ;
                                selectedDistrict = null;
                              });

                              await profileProvider.loadDistricts(value);
                            },

                            validator: (value) {
                              if (value == null) {
                                return "Please select province";
                              }
                              return null;
                            },
                          ),
      
                            const SizedBox(height: 18),
      
                            /// District
      
                            CustomDropdown<int>(
                              label: "District",
                              icon: Icons.location_on,

                              value: selectedDistrict,

                              items: profileProvider.districts.map((district) {
                                return DropdownMenuItem<int>(
                                  value: district.id,
                                  child: Text(district.name),
                                );
                              }).toList(),

                              onChanged: (value) {
                                setState(() {
                                  selectedDistrict = value;
                                });
                              },

                              validator: (value) {
                                if (value == null) {
                                  return "Please select district";
                                }
                                return null;
                              },
                            ),
      
                            const SizedBox(height: 18),
      
                            /// Budget
                          CustomDropdown<String>(
                          label: "Budget Range",
                          icon: Icons.payments_outlined,
                          value: selectedBudget,
                          items: budgetOptions.map((budget) {
                            return DropdownMenuItem<String>(
                              value: budget.value,
                              child: Text(budget.label),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedBudget = value;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return "Please select your budget";
                            }
                            return null;
                          },
                        ),
                          ],
                        ),
                      ),
                    ),
                  ),
      
                  const SizedBox(height: 30),
      
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
                          final profileProvider =
                              context.read<ProfileProvider>();

                          await profileProvider.saveProfile();

                          if (!context.mounted) return;

                          showSnackBar(
                            context,
                            "Profile first step data saved  successfully",
                          );

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const MainNavigationScreen(),
                            ),
                            (route) => false,
                          );
                        },
                            child: const Text(
                              "skip",
                            ),
                          ),
                        ),
                         const SizedBox(width: 10),
      
      
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
      
                            onPressed: () {
                              Navigator.pop(context);
                            },
      
                            child: const Text(
                              "Back",
                            ),
                          ),
                        ),
      
                        const SizedBox(width: 15),
      
                        Expanded(
                          flex: 2,
                          child: CustomButton(
                            text: "Save Profile",
                            onTap: () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            final profileProvider =
                                context.read<ProfileProvider>();

                            // Update draft with whatever is currently
                            // selected on this screen.
                            profileProvider.draftProfile.provinceId =
                                selectedProvince;

                            profileProvider.draftProfile.districtId =
                                selectedDistrict;

                            profileProvider.draftProfile.budgetRange =
                                selectedBudget;

                            await profileProvider.saveProfile();

                            if (!context.mounted) return;

                            showSnackBar(
                              context,
                              "Profile saved successfully",
                            );

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const MainNavigationScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          )
                        ),
                      ],
                    ),
                  ),
      
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      );
          }
    );
  
  }
}
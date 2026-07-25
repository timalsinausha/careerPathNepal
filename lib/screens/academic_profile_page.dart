import 'package:careernepal/screens/location_profile_page.dart';
import 'package:flutter/material.dart';

class StudentAcademicProfilePage extends StatelessWidget {
  const StudentAcademicProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
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
                      "assets/images/student.png",
                      height: 120,
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
                      "Help us recommend the best colleges and courses for you.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(179, 248, 245, 245),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const LinearProgressIndicator(
                        value: 0.5,
                        minHeight: 10,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Step 1 of 2",
                      style: TextStyle(

                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.school,
                              color: Color(0xff0F62BC),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Academic Information",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.bar_chart_rounded),
                            labelText: "Academic Score (GPA)",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.menu_book),
                            labelText: "Highest Education Level",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: "SEE",
                              child: Text("SEE"),
                            ),
                            DropdownMenuItem(
                              value: "+2",
                              child: Text("+2"),
                            ),
                            DropdownMenuItem(
                              value: "Bachelor",
                              child: Text("Bachelor"),
                            ),
                            DropdownMenuItem(
                              value: "Master",
                              child: Text("Master"),
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.business),
                            labelText: "Highest Education Institution",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_forward, color: Colors.white,),
                    label: const Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0F62BC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LocationProfilePage(),
                          ),
                        );
                      
                      
                    },
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

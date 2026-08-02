import 'package:careernepal/assessment/screen/assement_intro_screen.dart';
import 'package:careernepal/screens/college_screen.dart';
import 'package:careernepal/screens/course_screen.dart';
import 'package:careernepal/auth/screen/login_screen.dart';
import 'package:careernepal/screens/quiz_screen.dart';
import 'package:careernepal/widgets/result_progress_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../assessment/screen/assement_result_screen.dart';
import '../auth/provider/auth_provider.dart';
import '../core/dialogs/confirmation_dialog.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar:   AppBar(
        title: const Text("Home"),
        actions: [IconButton(
  icon: const Icon(Icons.logout),
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
)

        ],
      ),
      backgroundColor: const Color(0xffF8FAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff274CFF),
                      Color(0xff4D7DFF),
                    ],
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning 👋",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Let's Find Your Career Path",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Get personalized career and college recommendations.",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// QUIZ BANNER
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 252, 246, 246),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Career Assessment Quiz",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Answer 15 questions and discover the best career path for you.",
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
//                                Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (_) => const AssessmentIntroScreen(),
//   ),
// );                         
print("Going to QuizScreen");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const QuizScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff274CFF),
                            ),
                            child: const Text(
                              "Start Quiz",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const AssessmentIntroScreen(),
  ),
);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const QuizScreen(),
                        //   ),
                        // );
                      },
                      icon: const Icon(
                        Icons.quiz,
                        size: 70,
                        color: Color(0xff274CFF),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// QUICK ACTIONS
              const Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _actionCard(
                      icon: Icons.quiz,
                      title: "result",
                      onTap: () {
                        print("object");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AssessmentResultScreen(
                              response: null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _actionCard(
                      icon: Icons.school,
                      title: "Courses",
                      onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ResultProgressTile(
                              attribute: "Result",
                              percentage: 33,
                            ),
                          ),
                        );
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => const CourseScreen(),
                        //   ),
                        // );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _actionCard(
                      icon: Icons.location_city,
                      title: "Colleges",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CollegeScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
ResultProgressTile(
                              attribute: "Result",
                              percentage: 90,
                            ),
              /// CAREERS
              const Text(
                "Recommended Careers",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CareerCard(
                      title: "Software Engineer",
                      icon: Icons.computer,
                    ),
                    CareerCard(
                      title: "Data Analyst",
                      icon: Icons.analytics,
                    ),
                    CareerCard(
                      title: "UI/UX Designer",
                      icon: Icons.design_services,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// COLLEGES
              const Text(
                "Featured Colleges",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const CollegeCard(
                collegeName: "NIST College",
                location: "Banepa",
              ),

              const SizedBox(height: 12),

              const CollegeCard(
                collegeName: "Islington College",
                location: "Kathmandu",
              ),

              const SizedBox(height: 12),

              const CollegeCard(
                collegeName: "St. Xavier's College",
                location: "Maitighar",
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _actionCard({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: const Color(0xff274CFF),
            ),
            const SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class CareerCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CareerCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 45,
            color: const Color(0xff274CFF),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CollegeCard extends StatelessWidget {
  final String collegeName;
  final String location;

  const CollegeCard({
    super.key,
    required this.collegeName,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            child: Icon(Icons.school),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  collegeName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(location),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

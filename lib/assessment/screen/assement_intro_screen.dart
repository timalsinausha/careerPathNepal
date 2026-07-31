import 'package:careernepal/assessment/screen/assessment_start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/snackar_bar.dart';
import '../provider/assessment_provider.dart';

class AssessmentIntroScreen extends StatelessWidget {
  const AssessmentIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: AppBar(
        title: const Text("Career Assessment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 20),

            const Icon(
              Icons.psychology,
              size: 100,
              color: Color(0xff0F62BC),
            ),

            const SizedBox(height: 20),

            const Text(
              "Career Assessment",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Discover careers that match your interests, personality and strengths.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [

                    ListTile(
                      leading: Icon(Icons.quiz),
                      title: Text("12 Questions"),
                    ),

                    Divider(),

                    ListTile(
                      leading: Icon(Icons.timer),
                      title: Text("Approximately 5 Minutes"),
                    ),

                    Divider(),

                    ListTile(
                      leading: Icon(Icons.check_circle_outline),
                      title: Text("No Right or Wrong Answers"),
                    ),

                    Divider(),

                    ListTile(
                      leading: Icon(Icons.refresh),
                      title: Text("You can retake later"),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () async {

                final provider =
                    context.read<AssessmentProvider>();

                final success =
                    await provider.startAssessment();

                if (!context.mounted) return;

                if (success) {
                   print("Total Questions: ${provider.questions.length}");

                    for (final q in provider.questions) {
                      print(q.questionText);
                    }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const AssessmentQuestionScreen(),
                    ),
                  );

                } else {

                  showSnackBar(
                    context,
                    "Unable to start assessment.",
                  );

                }

              },
                child: const Text(
                  "Start Assessment",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
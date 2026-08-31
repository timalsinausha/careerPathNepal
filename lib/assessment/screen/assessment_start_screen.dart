import 'package:careernepal/assessment/provider/assessment_provider.dart';
import 'package:careernepal/core/utils/snackar_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'assement_result_screen.dart';

class AssessmentQuestionScreen extends StatelessWidget {
  const AssessmentQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Consumer<AssessmentProvider>(
      builder: (context, provider, child) {

        final question = provider.currentQuestion;

        return Scaffold(
          backgroundColor: const Color(0xffF5F7FB),

          appBar: AppBar(
            title: const Text("Career Assessment Questions"),
            centerTitle: true,
          ),

          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(

                children: [

                  const SizedBox(height: 10),

                  Text(
                    "Question ${provider.currentQuestionIndex + 1} of ${provider.questions.length}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  LinearProgressIndicator(
                    value:
                        (provider.currentQuestionIndex + 1) /
                            provider.questions.length,
                  ),

                  const SizedBox(height: 30),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20),
                    ),

                    child: Padding(
                      padding:
                          const EdgeInsets.all(20),

                      child: Text(
                        question.questionText,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          question.options.length,

                      itemBuilder:
                          (context, index) {

                        final option =
                            question.options[index];

                        final selected =
                        provider.selectedOptionForCurrentQuestion() ==
                            option.id;

                    return GestureDetector(

                      onTap: () {

                        provider.selectOption(
                          question.id,
                          option.id,
                        );

                      },

                      child: AnimatedContainer(

                        duration:
                            const Duration(milliseconds: 200),

                        margin:
                            const EdgeInsets.only(bottom: 15),

                        padding:
                            const EdgeInsets.all(18),

                        decoration: BoxDecoration(

                          color: selected
                              ? const Color(0xff0F62BC)
                              : Colors.white,

                          borderRadius:
                              BorderRadius.circular(18),

                          border: Border.all(
                            color: selected
                                ? const Color(0xff0F62BC)
                                : Colors.grey.shade300,
                          ),

                        ),

                        child: Row(

                          children: [

                            CircleAvatar(

                              backgroundColor: selected
                                  ? Colors.white
                                  : const Color(0xff0F62BC),

                              child: Text(

                                option.optionCode,

                                style: TextStyle(
                                  color: selected
                                      ? const Color(0xff0F62BC)
                                      : Colors.white,
                                ),

                              ),

                            ),

                            const SizedBox(width: 18),

                            Expanded(

                              child: Text(

                                option.optionText,

                                style: TextStyle(
                                  color: selected
                                      ? Colors.white
                                      : Colors.black87,

                                  fontSize: 16,
                                ),

                              ),

                            ),

                          ],

                        ),

                      ),

                    );
                      },
                    ),
                  ),

                  Row(
                  children: [

                    Expanded(

                      child: OutlinedButton(

                        onPressed:
                            provider.currentQuestionIndex == 0
                                ? null
                                : () {

                                    provider.previousQuestion();

                                  },

                        child: const Text("Previous"),

                      ),

                    ),

                    const SizedBox(width: 15),

                    Expanded(

                      child: ElevatedButton(

                        onPressed: () async {

                          try {

                            await provider.submitCurrentAnswer();

                            if (!context.mounted) return;

                            if (provider.currentQuestionIndex ==
                                provider.questions.length - 1) {

                              print("Complete Assessment");
                              final response =
                              await provider.completeAssessment();
                              print("Response received");
                              print(response);

                          if (!context.mounted) return;
                          print("Navigating...");

                          Navigator.pushReplacement(

                            context,

                            MaterialPageRoute(

                              builder: (_)=>

                                  AssessmentResultScreen(

                                    response: response,

                                  ),

                            ),

                          );

                            } else {

                              provider.nextQuestion();

                            }

                          } catch (e) {

                            showSnackBar(
                              context,
                              e.toString(),
                            );

                          }

                        },

                        child: Text(

                          provider.currentQuestionIndex ==
                                  provider.questions.length - 1
                              ? "Finish"
                              : "Next",

                        ),

                      ),

                    ),

                  ],
                ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
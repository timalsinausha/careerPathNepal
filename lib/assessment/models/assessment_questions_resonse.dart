import 'package:careernepal/assessment/models/assessment_questions.dart';

class QuestionResponse {
  final List<AssessmentQuestion> questions;

  QuestionResponse({
    required this.questions,
  });

  factory QuestionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuestionResponse(
      questions: (json["questions"] as List)
          .map(
            (e) =>
                AssessmentQuestion.fromJson(e),
          )
          .toList(),
    );
  }
}
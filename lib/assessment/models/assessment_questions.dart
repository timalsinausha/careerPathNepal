import 'assessment_option.dart';

class AssessmentQuestion {
  final int id;
  final int order;
  final String questionText;
  final List<AssessmentOption> options;

  AssessmentQuestion({
    required this.id,
    required this.order,
    required this.questionText,
    required this.options,
  });

  factory AssessmentQuestion.fromJson(
    Map<String, dynamic> json,
  ) {
    return AssessmentQuestion(
      id: json["id"],
      order: json["order"],
      questionText: json["question_text"],
      options: (json["options"] as List)
          .map(
            (e) => AssessmentOption.fromJson(e),
          )
          .toList(),
    );
  }
}
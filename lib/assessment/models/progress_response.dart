class AnsweredQuestion {

  final int questionId;
  final int questionOrder;
  final int selectedOptionId;

  AnsweredQuestion({
    required this.questionId,
    required this.questionOrder,
    required this.selectedOptionId,
  });

  factory AnsweredQuestion.fromJson(
      Map<String, dynamic> json) {

    return AnsweredQuestion(
      questionId: json["question_id"],
      questionOrder: json["question_order"],
      selectedOptionId: json["selected_option_id"],
    );
  }
}

class ProgressResponse {

  final int attemptId;

  final bool isCompleted;

  final int answeredQuestions;

  final List<AnsweredQuestion> answered;

  ProgressResponse({

    required this.attemptId,

    required this.isCompleted,

    required this.answeredQuestions,

    required this.answered,

  });

  factory ProgressResponse.fromJson(
      Map<String, dynamic> json) {

    return ProgressResponse(

      attemptId: json["attempt_id"],

      isCompleted: json["is_completed"],

      answeredQuestions: json["answered_questions"],

      answered: (json["answered"] as List)

          .map(
            (e) => AnsweredQuestion.fromJson(e),
          )

          .toList(),

    );
  }
}
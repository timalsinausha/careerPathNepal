class SubmitAnswerRequest {
  final int attemptId;
  final int questionId;
  final int optionId;

  SubmitAnswerRequest({
    required this.attemptId,
    required this.questionId,
    required this.optionId,
  });

  Map<String, dynamic> toJson() {
    return {
      "attempt_id": attemptId,
      "question_id": questionId,
      "option_id": optionId,
    };
  }
}
class CompleteAssessmentRequest {
  final int attemptId;

  CompleteAssessmentRequest({
    required this.attemptId,
  });

  Map<String, dynamic> toJson() {
    return {
      "attempt_id": attemptId,
    };
  }
}
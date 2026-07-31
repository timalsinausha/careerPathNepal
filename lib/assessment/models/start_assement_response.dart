class StartAssessmentResponse {
  final int attemptId;
  final String message;
  final bool isCompleted;
  final bool isResumed;

  StartAssessmentResponse({
    required this.attemptId,
    required this.message,
    required this.isCompleted,
    required this.isResumed,
  });

  factory StartAssessmentResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return StartAssessmentResponse(
      attemptId: json["attempt_id"],
      message: json["message"],
      isCompleted: json["is_completed"] ?? false,
      isResumed: json["is_resumed"] ?? false,
    );
  }
}
class AssessmentStatusModel {
  final bool hasAttempt;
  final int? attemptId;
  final bool isCompleted;

  AssessmentStatusModel({
    required this.hasAttempt,
    required this.attemptId,
    required this.isCompleted,
  });

  factory AssessmentStatusModel.fromJson(
      Map<String, dynamic> json) {
    return AssessmentStatusModel(
      hasAttempt: json["has_attempt"] ?? false,
      attemptId: json["attempt_id"],
      isCompleted: json["is_completed"] ?? false,
    );
  }
}
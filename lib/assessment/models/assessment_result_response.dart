class AssessmentResultResponse {

  final bool hasResult;

  final String? message;

  final int? attemptId;

  final String? completedAt;

  final Map<String, List<AssessmentResult>>? results;

  AssessmentResultResponse({
    required this.hasResult,
    this.message,
    this.attemptId,
    this.completedAt,
    this.results,
  });

  factory AssessmentResultResponse.fromJson(
      Map<String, dynamic> json) {

    // No assessment yet
    if (json["has_result"] == false) {
      return AssessmentResultResponse(
        hasResult: false,
        message: json["message"],
      );
    }

    final Map<String, List<AssessmentResult>> groupedResults = {};

    (json["results"] as Map<String, dynamic>).forEach(
      (key, value) {
        groupedResults[key] =
            (value as List)
                .map((e) => AssessmentResult.fromJson(e))
                .toList();
      },
    );

    return AssessmentResultResponse(
      hasResult: true,
      message: json["message"], // null for GET is fine
      attemptId: json["attempt_id"],
      completedAt: json["completed_at"],
      results: groupedResults,
    );
  }
}

class AssessmentResult {
  final String attribute;
  final int score;
  final double percentage;

  AssessmentResult({
    required this.attribute,
    required this.score,
    required this.percentage,
  });

  factory AssessmentResult.fromJson(Map<String, dynamic> json) {
    return AssessmentResult(
      attribute: json["attribute"],
      score: json["score"],
      percentage: (json["percentage"] as num).toDouble(),
    );
  }
}
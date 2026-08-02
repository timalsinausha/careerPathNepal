// class AssessmentResult {
//   final String attribute;
//   final int score;
//   final double percentage;

//   AssessmentResult({
//     required this.attribute,
//     required this.score,
//     required this.percentage,
//   });

//   factory AssessmentResult.fromJson(Map<String, dynamic> json) {
//     return AssessmentResult(
//       attribute: json["attribute"],
//       score: json["score"],
//       percentage: (json["percentage"] as num).toDouble(),
//     );
//   }
// }

// class CompleteAssessmentResponse {
//   final String message;
//   final int attemptId;
//   final Map<String, List<AssessmentResult>> results;

//   CompleteAssessmentResponse({
//     required this.message,
//     required this.attemptId,
//     required this.results,
//   });

//   factory CompleteAssessmentResponse.fromJson(
//       Map<String, dynamic> json) {

//     final Map<String, List<AssessmentResult>> groupedResults = {};

//     final rawResults = json["results"] as Map<String, dynamic>;

//     rawResults.forEach((key, value) {
//       groupedResults[key] = (value as List)
//           .map((e) => AssessmentResult.fromJson(e))
//           .toList();
//     });

//     return CompleteAssessmentResponse(
//       message: json["message"],
//       attemptId: json["attempt_id"],
//       results: groupedResults,
//     );
//   }
// }
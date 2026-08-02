import 'recommendation_model.dart';

class CareerDetailModel {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String jobDemand;
  final String futureScope;
  final String skillsRequired;
  final String workEnvironment;
  final String minimumEducationLevel;

  final List<RecommendedCourse> recommendedCourses;
  final List<RecommendedCollege> topColleges;

  CareerDetailModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.jobDemand,
    required this.futureScope,
    required this.skillsRequired,
    required this.workEnvironment,
    required this.minimumEducationLevel,
    required this.recommendedCourses,
    required this.topColleges,
  });

  factory CareerDetailModel.fromJson(
      Map<String, dynamic> json) {
    return CareerDetailModel(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      description: json["description"] ?? "",
      jobDemand: json["job_demand"] ?? "",
      futureScope: json["future_scope"] ?? "",
      skillsRequired: json["skills_required"] ?? "",
      workEnvironment: json["work_environment"] ?? "",
      minimumEducationLevel:
          json["minimum_education_level"] ?? "",
      recommendedCourses:
          (json["recommended_courses"] as List)
              .map(
                (e) => RecommendedCourse.fromJson(e),
              )
              .toList(),
      topColleges:
          (json["top_colleges"] as List)
              .map(
                (e) => RecommendedCollege.fromJson(e),
              )
              .toList(),
    );
  }
}
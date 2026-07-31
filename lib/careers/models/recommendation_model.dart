class CareerModel {
  final int id;
  final String name;
  final String slug;

  CareerModel({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory CareerModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CareerModel(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
    );
  }
}

class RecommendedCourse {
  final int id;
  final String name;
  final String shortName;
  final bool isPrimary;

  RecommendedCourse({
    required this.id,
    required this.name,
    required this.shortName,
    required this.isPrimary,
  });

  factory RecommendedCourse.fromJson(
    Map<String, dynamic> json,
  ) {
    return RecommendedCourse(
      id: json["id"],
      name: json["name"],
      shortName: json["short_name"],
      isPrimary: json["is_primary"],
    );
  }
}

class RecommendedCollege {
  final int id;
  final String name;
  final String province;
  final String district;
  final String address;

  RecommendedCollege({
    required this.id,
    required this.name,
    required this.province,
    required this.district,
    required this.address,
  });

  factory RecommendedCollege.fromJson(
    Map<String, dynamic> json,
  ) {
    return RecommendedCollege(
      id: json["id"],
      name: json["name"],
      province: json["province"],
      district: json["district"],
      address: json["address"],
    );
  }
}

class RecommendationModel {
  final int id;
  final CareerModel career;
  final double matchScore;
  final bool eligible;
  final String minimumEducationLevel;
  final String nextStep;

  final List<RecommendedCourse> recommendedCourses;
  final List<RecommendedCollege> topColleges;

  RecommendationModel({
    required this.id,
    required this.career,
    required this.matchScore,
    required this.eligible,
    required this.minimumEducationLevel,
    required this.nextStep,
    required this.recommendedCourses,
    required this.topColleges,
  });

  factory RecommendationModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return RecommendationModel(
      id: json["id"],

      career: CareerModel.fromJson(
        json["career"],
      ),

      matchScore:
          (json["match_score"] as num).toDouble(),

      eligible: json["eligible"],

      minimumEducationLevel:
          json["minimum_education_level"],

      nextStep: json["next_step"],

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
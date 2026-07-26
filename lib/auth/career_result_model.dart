class CareerResultModel {
  final String title;
  final String jobTitle;
  final String jobDescription;
  final int matchPercent;
  final List<String> skills;
  final List<String> recommendedCourses;
  final List<CollegeModel> topColleges;
  final List<String> topSkills;

  const CareerResultModel({
    required this.title,
    required this.jobTitle,
    required this.jobDescription,
    required this.matchPercent,
    required this.skills,
    required this.recommendedCourses,
    required this.topColleges,
    required this.topSkills,
  });
}

class CollegeModel {
  final String name;
  final double rating;
  final String location;
  final String type;

  const CollegeModel({
    required this.name,
    required this.rating,
    required this.location,
    required this.type,
  });
}
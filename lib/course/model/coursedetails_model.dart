class CourseDetailModel {
  final int id;
  final String name;
  final String shortName;
  final String slug;
  final String description;
  final int durationYears;
  final String level;
  final String entryRequirement;
  final List<CourseCollege> colleges;

  CourseDetailModel({
    required this.id,
    required this.name,
    required this.shortName,
    required this.slug,
    required this.description,
    required this.durationYears,
    required this.level,
    required this.entryRequirement,
    required this.colleges,
  });

  factory CourseDetailModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CourseDetailModel(
      id: json['id'],
      name: json['name'],
      shortName: json['short_name'],
      slug: json['slug'],
      description: json['description'],
      durationYears: json['duration_years'],
      level: json['level'],
      entryRequirement: json['entry_requirement'],

      colleges: (json['colleges'] as List? ?? [])
          .map(
            (college) =>
                CourseCollege.fromJson(college),
          )
          .toList(),
    );
  }
}

class CourseCollege {
  final int id;
  final String name;
  final String shortName;
  final String slug;
  final String province;
  final String district;
  final String address;

  CourseCollege({
    required this.id,
    required this.name,
    required this.shortName,
    required this.slug,
    required this.province,
    required this.district,
    required this.address,
  });

  factory CourseCollege.fromJson(
    Map<String, dynamic> json,
  ) {
    return CourseCollege(
      id: json['id'],
      name: json['name'],
      shortName: json['short_name'],
      slug: json['slug'],
      province: json['province'],
      district: json['district'],
      address: json['address'],
    );
  }
}
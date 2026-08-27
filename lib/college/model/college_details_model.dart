class CollegeDetailModel {
  final int id;
  final String name;
  final String shortName;
  final String slug;
  final String university;
  final String province;
  final String district;
  final String address;
  final String description;
  final String website;
  final String email;
  final String phone;
  final int? establishedYear;
  final String ownership;

  final List<CollegeCourse> courses;

  CollegeDetailModel({
    required this.id,
    required this.name,
    required this.shortName,
    required this.slug,
    required this.university,
    required this.province,
    required this.district,
    required this.address,
    required this.description,
    required this.website,
    required this.email,
    required this.phone,
    required this.establishedYear,
    required this.ownership,
    required this.courses,
  });

  factory CollegeDetailModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CollegeDetailModel(
      id: json['id'],
      name: json['name'] ?? '',
      shortName: json['short_name'] ?? '',
      slug: json['slug'] ?? '',
      university: json['university'] ?? '',
      province: json['province'] ?? '',
      district: json['district'] ?? '',
      address: json['address'] ?? '',
      description: json['description'] ?? '',
      website: json['website'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      establishedYear: json['established_year'],
      ownership: json['ownership'] ?? '',

      courses: (json['courses'] as List? ?? [])
          .map(
            (course) => CollegeCourse.fromJson(course),
          )
          .toList(),
    );
  }
}


class CollegeCourse {
  final int id;
  final String name;
  final String shortName;
  final String slug;

  CollegeCourse({
    required this.id,
    required this.name,
    required this.shortName,
    required this.slug,
  });

  factory CollegeCourse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CollegeCourse(
      id: json['id'],
      name: json['name'] ?? '',
      shortName: json['short_name'] ?? '',
      slug: json['slug'] ?? '',
    );
  }
}
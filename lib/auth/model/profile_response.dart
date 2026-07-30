class ProfileResponse {
  final UserModel user;
  final StudentProfileModel studentProfile;

  ProfileResponse({
    required this.user,
    required this.studentProfile,
  });

  factory ProfileResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProfileResponse(
      user: UserModel.fromJson(json["user"]),
      studentProfile: StudentProfileModel.fromJson(
        json["student_profile"],
      ),
      
    );
  }
}

class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String contactNumber;
  final String role;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.contactNumber,
    required this.role,
  });

  factory UserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserModel(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      contactNumber: json["contact_number"],
      role: json["role"],
    );
  }
}

class StudentProfileModel {
  final String? highestEducationLevel;
  final String? highestEducationInstitution;
  final double? academicScore;
  final ProvinceModel? province;
  final DistrictModel? district;
  final String? budgetRange;
  final bool isProfileCompleted;

  StudentProfileModel({
    required this.highestEducationLevel,
    required this.highestEducationInstitution,
    required this.academicScore,
    required this.province,
    required this.district,
    required this.budgetRange,
    required this.isProfileCompleted,
  });

  factory StudentProfileModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return StudentProfileModel(
      highestEducationLevel: json["highest_education_level"],
      highestEducationInstitution:
          json["highest_education_institution"],
      academicScore: json["academic_score"] != null
    ? double.parse(json["academic_score"].toString())
    : null,
      province: json["province"] != null
          ? ProvinceModel.fromJson(json["province"])
          : null,
      district: json["district"] != null
          ? DistrictModel.fromJson(json["district"])
          : null,
      budgetRange: json["budget_range"],
      isProfileCompleted:
          json["is_profile_completed"] ?? false,
    );
  }
}

class ProvinceModel {
  final int id;
  final String name;

  ProvinceModel({
    required this.id,
    required this.name,
  });

  factory ProvinceModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProvinceModel(
      id: json["id"],
      name: json["name"],
    );
  }
}

class DistrictModel {
  final int id;
  final String name;

  DistrictModel({
    required this.id,
    required this.name,
  });

  factory DistrictModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return DistrictModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
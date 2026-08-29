class UpdateProfileRequest {
  String? highestEducationLevel;
  String? highestEducationInstitution;
  double? academicScore;

  int? provinceId;
  int? districtId;

  String? budgetRange;

  // UpdateProfileRequest();
  UpdateProfileRequest({
  this.highestEducationLevel,
  this.highestEducationInstitution,
  this.academicScore,
  this.provinceId,
  this.districtId,
  this.budgetRange,
});


Map<String, dynamic> toJson() {
  final data = <String, dynamic>{
    "highest_education_level":
        highestEducationLevel,

    "highest_education_institution":
        highestEducationInstitution,

    "academic_score":
        academicScore,

    "province":
        provinceId,

    "district":
        districtId,

    "budget_range":
        budgetRange,
  };

  data.removeWhere(
    (key, value) => value == null,
  );

  return data;
}
  // Map<String, dynamic> toJson() {
  //   return {
  //     "highest_education_level": highestEducationLevel,
  //     "highest_education_institution":
  //         highestEducationInstitution,
  //     "academic_score": academicScore,
  //     "province": provinceId,
  //     "district": districtId,
  //     "budget_range": budgetRange,
  //   };
  // }
}
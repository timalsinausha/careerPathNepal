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
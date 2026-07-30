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
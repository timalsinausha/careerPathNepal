class CollegeListModel {
  final int id;
  final String name;
  final String slug;

  CollegeListModel({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory CollegeListModel.fromJson(Map<String, dynamic> json) {
    return CollegeListModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}
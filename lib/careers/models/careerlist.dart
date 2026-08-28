class CareerListModel {
  final int id;
  final String name;
  final String slug;

  CareerListModel({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory CareerListModel.fromJson(Map<String, dynamic> json) {
    return CareerListModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}
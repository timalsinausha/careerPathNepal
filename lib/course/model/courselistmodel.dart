class CourseListModel {
  final int id;
  final String name;
  final String slug;

  CourseListModel({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory CourseListModel.fromJson(Map<String, dynamic> json) {
    return CourseListModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}
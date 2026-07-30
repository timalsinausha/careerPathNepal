class EducationLevel {
  final String value;
  final String label;

  const EducationLevel({
    required this.value,
    required this.label,
  });

  static const List<EducationLevel> levels = [
    EducationLevel(value: "SEE", label: "SEE"),
    EducationLevel(value: "PLUS_TWO", label: "+2"),
    EducationLevel(value: "DIPLOMA", label: "Diploma"),
    EducationLevel(value: "BACHELOR", label: "Bachelor"),
    EducationLevel(value: "MASTER", label: "Master"),
    EducationLevel(value: "PHD", label: "PhD"),
  ];
}
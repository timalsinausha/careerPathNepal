class AssessmentOption {
  final int id;
  final String optionCode;
  final String optionText;
  final int order;

  AssessmentOption({
    required this.id,
    required this.optionCode,
    required this.optionText,
    required this.order,
  });

  factory AssessmentOption.fromJson(
    Map<String, dynamic> json,
  ) {
    return AssessmentOption(
      id: json["id"],
      optionCode: json["option_code"],
      optionText: json["option_text"],
      order: json["order"],
    );
  }
}
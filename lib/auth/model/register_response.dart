class RegisterResponse {
  final String message;
  final String role;

  RegisterResponse({
    required this.message,
    required this.role,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json["message"],
      role: json["role"],
    );
  }
}
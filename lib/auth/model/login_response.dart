import 'package:careernepal/auth/model/user_moel.dart';


class LoginResponse {
  final String access;
  final String refresh;
  final UserModel user;

  LoginResponse({
    required this.access,
    required this.refresh,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      access: json["access"],
      refresh: json["refresh"],
      user: UserModel.fromJson(json["user"]),
    );
  }
}
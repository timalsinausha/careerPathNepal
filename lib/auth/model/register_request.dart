class RegisterRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String contactNumber;
  final String password;
  final String confirmPassword;

  RegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.contactNumber,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "contact_number": contactNumber,
      "password": password,
      "confirm_password": confirmPassword,
    };
  }
}
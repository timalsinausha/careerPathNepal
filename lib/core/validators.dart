class Validators {

  /// EMAIL VALIDATOR
  static String? validateEmail(String? value) {

    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    if (!value.contains("@")) {
      return "Enter valid email";
    }

    return null;
  }

  /// PASSWORD VALIDATOR
  static String? validatePassword(String? value) {

    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 6) {
      return "Password must be 6 characters";
    }

    return null;
  }

  /// FULL NAME VALIDATOR
  static String? validateName(String? value) {

    if (value == null || value.isEmpty) {
      return "Full name is required";
    }

    return null;
  }

  /// PHONE VALIDATOR
  static String? validatePhone(String? value) {

    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }

    if (value.length != 10) {
      return "Enter valid phone number";
    }

    return null;
  }

  /// ADDRESS VALIDATOR
  static String? validateAddress(String? value) {

    if (value == null || value.isEmpty) {
      return "Address is required";
    }

    return null;
  }

  /// CONFIRM PASSWORD VALIDATOR
  static String? validateConfirmPassword(
    String? value,
    String password,
  ) {

    if (value == null || value.isEmpty) {
      return "Confirm password required";
    }

    if (value != password) {
      return "Password does not match";
    }

    return null;
  }
}
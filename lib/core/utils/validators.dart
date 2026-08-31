class Validators {

 /// EMAIL VALIDATOR
static String? validateEmail(String? value) {
  final email = value?.trim() ?? "";

  if (email.isEmpty) {
    return "Email is required";
  }

  final emailRegex = RegExp(
    r'^[\w\.-]+@[\w\.-]+\.\w+$',
  );

  if (!emailRegex.hasMatch(email)) {
    return "Enter a valid email address";
  }

  return null;
}

/// PASSWORD VALIDATOR
/// PASSWORD VALIDATOR
static String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Password is required";
  }

  if (value.length < 8) {
    return "Password must be at least 8 characters";
  }

  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return "Password must contain an uppercase letter";
  }

  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return "Password must contain a lowercase letter";
  }

  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return "Password must contain a number";
  }

  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>_\-]').hasMatch(value)) {
    return "Password must contain a special character";
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
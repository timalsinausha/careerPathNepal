import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  String education = "+2";

  List<String> educationList = [
    "+2",
    "Bachelor",
    "Master",
  ];

  void togglePassword() {

    hidePassword = !hidePassword;
    notifyListeners();
  }

  void toggleConfirmPassword() {

    hideConfirmPassword = !hideConfirmPassword;
    notifyListeners();
  }

  void changeEducation(String value) {

    education = value;
    notifyListeners();
  }
}
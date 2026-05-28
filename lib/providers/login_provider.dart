import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {

  bool isPasswordHidden = true;

  void togglePassword() {
    isPasswordHidden = !isPasswordHidden;
    notifyListeners();
  }
}
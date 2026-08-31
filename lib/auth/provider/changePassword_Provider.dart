import 'package:flutter/material.dart';

import '../service/auth_api_service.dart';

class ChangePasswordProvider extends ChangeNotifier {

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  
    bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  bool get isPasswordHidden => _isPasswordHidden;
  bool get isConfirmPasswordHidden => _isConfirmPasswordHidden;

    void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
    notifyListeners();
  }

  
  bool _isOldPasswordHidden = true;
 
  bool get isOldPasswordHidden => _isOldPasswordHidden;

    void toggleOldPasswordVisibility() {
    _isOldPasswordHidden = !_isOldPasswordHidden;
    notifyListeners();
  }


  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {

    _isLoading = true;
    _errorMessage = null;

    notifyListeners();

    try {

      await AuthApiService().changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      return true;

    } catch (e) {

      _errorMessage = e.toString();

      return false;

    } finally {

      _isLoading = false;

      notifyListeners();
    }
  }
}
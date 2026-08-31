import 'package:flutter/material.dart';
import '../model/register_request.dart';
import '../service/auth_api_service.dart';


class RegisterProvider extends ChangeNotifier {
  final AuthApiService _authApiService = AuthApiService();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  
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

Future<void> register(RegisterRequest request) async {
  _isLoading = true;
  notifyListeners();

  try {
    await _authApiService.register(request);
  } catch (e) {
    rethrow;
  } finally {
    _isLoading = false;
    notifyListeners();
  }
}
}
import 'package:flutter/material.dart';
import '../model/login_request.dart';
import '../model/auth_response.dart';
import '../repository/auth_repository.dart';
import '../service/auth_storage_service.dart';

class LoginProvider extends ChangeNotifier {
  final AuthRepository _repository = AuthRepository();

  bool _isLoading = false;
  String? _errorMessage;
  AuthResponse? _loginResponse;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  AuthResponse? get loginResponse => _loginResponse;

  bool get isLoggedIn => _loginResponse != null;

   bool _isLoginPasswordHidden = true;

  bool get isLoginPasswordHidden => _isLoginPasswordHidden;

    void toggleLoginPasswordVisibility() {
    _isLoginPasswordHidden = !_isLoginPasswordHidden;
    notifyListeners();
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final response = await _repository.login(
        LoginRequest(
          email: email,
          password: password,
        ),
      );

      _loginResponse = response;

      await AuthStorageService.instance.saveTokens(
      accessToken: response.access,
      refreshToken: response.refresh,
    );

      _setLoading(false);

      return true;
    } catch (e) {
      _errorMessage = e.toString();

      _setLoading(false);

      return false;
    }
  }

  void logout() {
    _loginResponse = null;
    notifyListeners();
  }

  void clearError() {
    _clearError();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
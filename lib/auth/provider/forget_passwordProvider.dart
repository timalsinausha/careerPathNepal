import 'package:flutter/material.dart';
import '../service/auth_api_service.dart';

class ForgotPasswordProvider extends ChangeNotifier {

  final AuthApiService _api = AuthApiService();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;


  // =====================================================
  // SEND OTP
  // =====================================================

  Future<bool> sendOTP(String email) async {

    _isLoading = true;
    _errorMessage = null;

    notifyListeners();

    try {

      await _api.forgotPassword(
        email.trim(),
      );

      return true;

    } catch (e) {

      _errorMessage = _getErrorMessage(e);

      return false;

    } finally {

      _isLoading = false;

      notifyListeners();
    }
  }


  // =====================================================
  // VERIFY OTP
  // =====================================================

  Future<bool> verifyOTP({
    required String email,
    required String otp,
  }) async {

    _isLoading = true;
    _errorMessage = null;

    notifyListeners();

    try {

      await _api.verifyOTP(
        email: email.trim(),
        otp: otp.trim(),
      );

      return true;

    } catch (e) {

      _errorMessage = _getErrorMessage(e);

      return false;

    } finally {

      _isLoading = false;

      notifyListeners();
    }
  }


  // =====================================================
  // RESET PASSWORD
  // =====================================================

  Future<bool> resetPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {

    _isLoading = true;
    _errorMessage = null;

    notifyListeners();

    try {

      await _api.resetPassword(
        email: email.trim(),
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );

      return true;

    } catch (e) {

      _errorMessage = _getErrorMessage(e);

      return false;

    } finally {

      _isLoading = false;

      notifyListeners();
    }
  }


  // =====================================================
  // ERROR HANDLING
  // =====================================================

  String _getErrorMessage(dynamic error) {

    try {

      final response = error.response;

      if (response != null &&
          response.data is Map<String, dynamic>) {

        final data = response.data
            as Map<String, dynamic>;

        // Django validation error

        if (data.isNotEmpty) {

          final firstValue =
              data.values.first;

          if (firstValue is List &&
              firstValue.isNotEmpty) {

            return firstValue.first.toString();

          }

          return firstValue.toString();
        }
      }

    } catch (_) {}

    return "Something went wrong. Please try again.";
  }
}
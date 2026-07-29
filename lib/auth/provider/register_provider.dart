import 'package:flutter/material.dart';

import '../model/auth_response.dart';
import '../model/register_request.dart';
import '../service/auth_api_service.dart';
import '../service/auth_storage_service.dart';


class RegisterProvider extends ChangeNotifier {
  final AuthApiService _authApiService = AuthApiService();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
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
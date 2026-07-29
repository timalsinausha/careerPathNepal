import '../model/login_request.dart';
import '../model/auth_response.dart';
import '../service/auth_api_service.dart';

class AuthRepository {
  final AuthApiService _apiService = AuthApiService();

  Future<AuthResponse> login(LoginRequest request) async {
    return await _apiService.login(request);
  }
}
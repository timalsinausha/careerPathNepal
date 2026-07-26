import '../model/login_request.dart';
import '../model/login_response.dart';
import '../service/auth_api_service.dart';

class AuthRepository {
  final AuthApiService _apiService = AuthApiService();

  Future<LoginResponse> login(LoginRequest request) async {
    return await _apiService.login(request);
  }
}
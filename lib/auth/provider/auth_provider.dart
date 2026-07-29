import '../service/auth_storage_service.dart';

class AuthProvider {

  Future<bool> checkLoginStatus() async {

    final token =
        await AuthStorageService.instance.getAccessToken();

    return token != null && token.isNotEmpty;
  }

  Future<void> logout() async {

  await AuthStorageService.instance.logout();

}

}
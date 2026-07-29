import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorageService {
  AuthStorageService._();

  static final AuthStorageService instance =
      AuthStorageService._();

  final FlutterSecureStorage _storage =
      const FlutterSecureStorage();

  static const String accessTokenKey = "access_token";
  static const String refreshTokenKey = "refresh_token";

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(
      key: accessTokenKey,
      value: accessToken,
    );

    await _storage.write(
      key: refreshTokenKey,
      value: refreshToken,
    );
    debugPrint("ACCESS TOKEN:");
debugPrint(accessToken);

debugPrint("REFRESH TOKEN:");
debugPrint(refreshToken);
  }

  Future<String?> getAccessToken() async {
    return _storage.read(
      key: accessTokenKey,
    );
  }

  Future<String?> getRefreshToken() async {
    return _storage.read(
      key: refreshTokenKey,
    );
  }

  Future<void> updateAccessToken(String accessToken) async {
  await _storage.write(
    key: accessTokenKey,
    value: accessToken,
  );
}

  Future<void> clearTokens() async {
    await _storage.delete(
      key: accessTokenKey,
    );

    await _storage.delete(
      key: refreshTokenKey,
    );
  }


  Future<void> logout() async {

  await _storage.delete(
    key: accessTokenKey,
  );

  await _storage.delete(
    key: refreshTokenKey,
  );

}

}
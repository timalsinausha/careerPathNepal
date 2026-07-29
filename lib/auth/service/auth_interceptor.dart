import 'package:careernepal/auth/service/auth_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../core/navigation/navigation_service.dart';
import '../../screens/login_screen.dart';
import 'auth_api_service.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final AuthApiService authApiService;
  // final Future<void> Function() onSessionExpired;
  bool _isRefreshing = false;

  AuthInterceptor({
    required this.dio,
    required this.authApiService,
    // required this.onSessionExpired,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken =
        await AuthStorageService.instance.getAccessToken();

    if (accessToken != null) {
      options.headers["Authorization"] =
          "Bearer $accessToken";
    }

    handler.next(options);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    if (_isRefreshing) {
      return handler.next(err);
    }

    _isRefreshing = true;

    try {
      final refreshToken =
          await AuthStorageService.instance.getRefreshToken();

      if (refreshToken == null) {
        throw Exception("Refresh token missing");
      }

      final newAccessToken =
          await authApiService.refreshToken(refreshToken);

      await AuthStorageService.instance.updateAccessToken(
        newAccessToken,
      );

      final request = err.requestOptions;

      request.headers["Authorization"] =
          "Bearer $newAccessToken";

      final response = await dio.fetch(request);

      return handler.resolve(response);
    } catch (_) {
      await AuthStorageService.instance.clearTokens();
      final navigator = NavigationService.navigatorKey.currentState;

if (navigator != null) {
  navigator.pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (_) => const LoginScreen(),
    ),
    (route) => false,
  );
}

      return handler.next(err);
    } finally {
      _isRefreshing = false;
    }
  }
}
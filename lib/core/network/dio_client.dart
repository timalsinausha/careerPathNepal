import 'package:careernepal/auth/service/auth_api_service.dart';
import 'package:careernepal/core/constants/api_constants.dart';
import 'package:dio/dio.dart';

import '../../auth/service/auth_interceptor.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  );

  static final Dio refreshDio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  );

  static void initialize() {
    dio.interceptors.add(
      AuthInterceptor(
        dio: dio,
        authApiService: AuthApiService(),
      ),
    );
  }
}
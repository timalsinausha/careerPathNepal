import 'package:careernepal/auth/model/login_request.dart';
import 'package:dio/dio.dart';

import '../../core/constants/api_constants.dart';
import '../../core/network/dio_client.dart';
import '../model/login_response.dart';

class AuthApiService {
  final Dio _dio = DioClient.dio;

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final Response response = await _dio.post(
        ApiConstants.login,
        data: request.toJson(),
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  String _handleError(DioException e) {
    if (e.response != null) {
      if (e.response?.data is Map &&
          e.response?.data["detail"] != null) {
        return e.response!.data["detail"];
      }

      return "Something went wrong.";
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout.";

      case DioExceptionType.receiveTimeout:
        return "Server took too long to respond.";

      case DioExceptionType.connectionError:
        return "No internet connection.";

      default:
        return "Unexpected error occurred.";
    }
  }
}
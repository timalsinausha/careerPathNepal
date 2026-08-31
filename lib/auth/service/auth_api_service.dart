import 'package:careernepal/auth/model/login_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core/constants/api_constants.dart';
import '../../core/network/dio_client.dart';
import '../model/auth_response.dart';
import '../model/register_request.dart';


class AuthApiService {
  final Dio _dio = DioClient.refreshDio;

  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final Response response = await _dio.post(
        ApiConstants.login,
        data: request.toJson(),
      );

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

 Future<String> register(
    RegisterRequest request) async {
  try {
    final response = await _dio.post(
      ApiConstants.register,
      data: request.toJson(),
    );
    debugPrint("REGISTER RESPONSE:");
    debugPrint(response.data.toString());
    print(response.data);
    return response.data["message"];
    //AuthResponse.fromJson(response.data);
  } on DioException catch (e) {
      debugPrint("STATUS CODE: ${e.response?.statusCode}");
  debugPrint("ERROR DATA: ${e.response?.data}");
    throw Exception(_handleError(e));
  }
}

Future<String> refreshToken(String refreshToken) async {
  try {
    final response = await _dio.post(
      ApiConstants.refreshToken,
      data: {
        "refresh": refreshToken,
      },
    );

    return response.data["access"];
  } on DioException catch (e) {
    throw Exception(_handleError(e));
  }
}

Future<void> changePassword({
  required String currentPassword,
  required String newPassword,
}) async {
  await DioClient.dio.post(
    "${ApiConstants.changePassword}",
    data: {
      "current_password": currentPassword,
      "new_password": newPassword,
    },
  );
}


 String _handleError(DioException e) {
  if (e.response != null) {
    final data = e.response?.data;

    if (data is Map<String, dynamic>) {
      // DRF "detail" errors
      if (data["detail"] != null) {
        return data["detail"].toString();
      }

      // DRF field validation errors
      for (final entry in data.entries) {
        final value = entry.value;

        if (value is List && value.isNotEmpty) {
          return value.first.toString();
        }

        if (value is String) {
          return value;
        }
      }
    }

    return "Request failed.";
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
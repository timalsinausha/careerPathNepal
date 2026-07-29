import 'package:careernepal/core/constants/api_constants.dart';
import 'package:dio/dio.dart';

import '../../core/network/dio_client.dart';
import '../model/profile_response.dart';

class ProfileApiService {
  final Dio _dio = DioClient.dio;

  Future<ProfileResponse> getProfile() async {
    try {
      final response = await _dio.get(
        ApiConstants.profile,
      );

      return ProfileResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  String _handleError(DioException e) {
    if (e.response != null) {
      final data = e.response?.data;

      if (data is Map &&
          data.containsKey("detail")) {
        return data["detail"];
      }

      return "Something went wrong.";
    }

    return "No Internet Connection.";
  }
}
import 'package:careernepal/core/constants/api_constants.dart';
import 'package:dio/dio.dart';

import '../../core/network/dio_client.dart';
import '../model/profile_response.dart';
import '../model/update_profile_request.dart';

class ProfileApiService {
  final Dio _dio = DioClient.dio;

   Future<List<ProvinceModel>> getProvinces() async {
    final response = await _dio.get(
      ApiConstants.provinces,
    );
    return (response.data as List)
        .map(
          (e) => ProvinceModel.fromJson(e),
        )
        .toList();
  }

  Future<List<DistrictModel>> getDistricts(
    int provinceId,
  ) async {
    final response = await _dio.get(
      ApiConstants.districts,
      queryParameters: {
        "province": provinceId,
      },
    );

    return (response.data as List)
        .map(
          (e) => DistrictModel.fromJson(e),
        )
        .toList();
  }

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
///it will save student details like budget, gpa etc
 Future<void> saveProfile(UpdateProfileRequest request) async {
  try {
    await _dio.patch(
      ApiConstants.updateProfile,
      data: request.toJson(),
    );

  } on DioException catch (e) {
    rethrow;
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
/// to  update contact, firstname and lastname
Future<void> updateUserProfile({
  String? firstName,
  String? lastName,
  String? contactNumber,
}) async {
  try {
  await DioClient.dio.patch(
      ApiConstants.updateduserProfile,
      data: {
        if (firstName != null)
          "first_name": firstName,

        if (lastName != null)
          "last_name": lastName,

        if (contactNumber != null)
          "contact_number": contactNumber,
      },
    );

  } catch (e) {
    rethrow;
  }
}


}
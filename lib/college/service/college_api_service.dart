import 'package:careernepal/core/constants/api_constants.dart';
import 'package:careernepal/core/network/dio_client.dart';

import '../model/college_details_model.dart';

class CollegeApiService {

  Future<CollegeDetailModel> getCollegeDetail(
    String slug,
  ) async {

    final response = await DioClient.dio.get(
      "${ApiConstants.collegeDetail}$slug/",
    );

    return CollegeDetailModel.fromJson(
      response.data,
    );
  }
}
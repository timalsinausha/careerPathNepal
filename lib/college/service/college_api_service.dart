import 'package:careernepal/core/constants/api_constants.dart';
import 'package:careernepal/core/network/dio_client.dart';

import '../model/college_details_model.dart';
import '../model/college_listmodel.dart';

class CollegeApiService {

  Future<CollegeDetailModel> getCollegeDetail(
    String slug,
  ) async {

    final response = await DioClient.dio.get(
      "${ApiConstants.colleges}$slug/",
    );

    return CollegeDetailModel.fromJson(
      response.data,
    );
  }


    Future<List<CollegeListModel>> getColleges() async {
    final response = await DioClient.dio.get(
      ApiConstants.colleges,
    );

    final List data = response.data;

    return data
        .map(
          (json) => CollegeListModel.fromJson(json),
        )
        .toList();
  }
}
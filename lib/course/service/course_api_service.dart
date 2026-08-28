import '../../core/constants/api_constants.dart';
import '../../core/network/dio_client.dart';
import '../model/coursedetails_model.dart';
import '../model/courselistmodel.dart';

class CourseApiService {

  Future<CourseDetailModel> getCourseDetail(
    String slug,
  ) async {

    final response = await DioClient.dio.get(
      "${ApiConstants.courses}$slug/",
    );

    return CourseDetailModel.fromJson(
      response.data,
    );
  }

    Future<List<CourseListModel>> getCourses() async {
    final response = await DioClient.dio.get(
      ApiConstants.courses,
    );

    final List data = response.data;

    return data
        .map(
          (json) => CourseListModel.fromJson(json),
        )
        .toList();
  }
}
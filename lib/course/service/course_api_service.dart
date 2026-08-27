import '../../core/constants/api_constants.dart';
import '../../core/network/dio_client.dart';
import '../model/coursedetails_model.dart';

class CourseApiService {

  Future<CourseDetailModel> getCourseDetail(
    String slug,
  ) async {

    final response = await DioClient.dio.get(
      "${ApiConstants.courseDetail}$slug/",
    );

    return CourseDetailModel.fromJson(
      response.data,
    );
  }
}
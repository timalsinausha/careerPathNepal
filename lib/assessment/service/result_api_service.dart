import '../../core/constants/api_constants.dart';
import '../../core/network/dio_client.dart';
import '../models/complete_assessment_response.dart';

class ResultApiService {

  Future<CompleteAssessmentResponse> getResult(
      int attemptId,
  ) async {

    final response = await DioClient.dio.get(

      ApiConstants.assessmentResult,

      queryParameters: {
        "attempt_id": attemptId,
      },

    );

    return CompleteAssessmentResponse.fromJson(
      response.data,
    );
  }
}
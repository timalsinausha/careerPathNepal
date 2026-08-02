import 'package:careernepal/assessment/models/assessment_result_response.dart';

import '../../core/constants/api_constants.dart';
import '../../core/network/dio_client.dart';


class ResultApiService {

Future<AssessmentResultResponse> getResult() async {

  final response = await DioClient.dio.get(
    ApiConstants.assessmentResult,
  );

  return AssessmentResultResponse.fromJson(
    response.data,
  );
}
}
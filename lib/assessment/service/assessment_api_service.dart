import 'package:careernepal/assessment/models/start_assement_response.dart';

import '../../core/constants/api_constants.dart';
import '../../core/network/dio_client.dart';
import '../models/assessment_questions_resonse.dart';
import '../models/complete_assessment_request.dart';
import '../models/complete_assessment_response.dart';
import '../models/progress_response.dart';
import '../models/submit_answer_request.dart';

class AssessmentApiService {

  Future<StartAssessmentResponse>
      startAssessment() async {

    final response = await DioClient.dio.post(
      ApiConstants.startAssessment,
    );

    return StartAssessmentResponse.fromJson(
      response.data,
    );
  }

  Future<QuestionResponse> getQuestions() async {
  final response = await DioClient.dio.get(
    ApiConstants.questions,
  );

  return QuestionResponse.fromJson(
    response.data,
  );
}

Future<void> submitAnswer(
  SubmitAnswerRequest request,
) async {

  final response = await DioClient.dio.post(
    ApiConstants.submitAnswer,
    data: request.toJson(),
  );

  print(response.data);
}

Future<ProgressResponse> getProgress(
    int attemptId) async {

  final response =
      await DioClient.dio.get(

    ApiConstants.assessmentProgress,

    queryParameters: {
      "attempt_id": attemptId,
    },

  );

  return ProgressResponse.fromJson(
      response.data);
}

Future<CompleteAssessmentResponse>
completeAssessment(
    CompleteAssessmentRequest request,
) async {

  final response =
      await DioClient.dio.post(

    ApiConstants.completeAssessment,

    data: request.toJson(),

  );

  return CompleteAssessmentResponse.fromJson(
      response.data);
}

}
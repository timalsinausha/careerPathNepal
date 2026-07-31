import 'package:careernepal/assessment/models/assessment_questions.dart';
import 'package:careernepal/assessment/models/complete_assessment_request.dart';
import 'package:flutter/material.dart';
import '../models/assessment_questions_resonse.dart';
import '../models/complete_assessment_response.dart';
import '../models/submit_answer_request.dart';
import '../service/assessment_api_service.dart';
import '../service/result_api_service.dart';

class AssessmentProvider
    extends ChangeNotifier {

  final AssessmentApiService _api =
      AssessmentApiService();
      
  final ResultApiService _resultApiService =
    ResultApiService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  int? currentAttemptId;

  List<AssessmentQuestion> _questions = [];

List<AssessmentQuestion> get questions =>  _questions;

int _currentQuestionIndex = 0;

int get currentQuestionIndex =>  _currentQuestionIndex;

AssessmentQuestion get currentQuestion =>  _questions[_currentQuestionIndex];

Map<int, int> selectedAnswers = {};

int? selectedOptionForCurrentQuestion() {

  return selectedAnswers[
      currentQuestion.id];

}

  Future<bool> startAssessment() async {

  _isLoading = true;
  notifyListeners();

  try {

    final response =
        await _api.startAssessment();

    currentAttemptId =
        response.attemptId;

    await loadQuestions();
    await loadProgress();

    return true;

  } catch (e) {

    debugPrint(e.toString());

    return false;

  } finally {

    _isLoading = false;
    notifyListeners();

  }

}

  Future<void> loadQuestions() async {

  _isLoading = true;
  notifyListeners();

  try {

    final QuestionResponse response =
        await _api.getQuestions();

    _questions = response.questions;

  } finally {

    _isLoading = false;
    notifyListeners();

  }

}

void nextQuestion() {

  if (_currentQuestionIndex <
      _questions.length - 1) {

    _currentQuestionIndex++;

    notifyListeners();

  }

}

void previousQuestion() {

  if (_currentQuestionIndex > 0) {

    _currentQuestionIndex--;

    notifyListeners();

  }

}

void resetAssessment() {

  _currentQuestionIndex = 0;

  _questions.clear();

  notifyListeners();

}

void selectOption(
  int questionId,
  int optionId,
) {
  selectedAnswers[questionId] = optionId;

  notifyListeners();
}

Future<void> submitCurrentAnswer() async {

  final optionId =
      selectedOptionForCurrentQuestion();

  if (optionId == null) {
    throw Exception(
      "Please select an option.",
    );
  }

  await _api.submitAnswer(

    SubmitAnswerRequest(

      attemptId: currentAttemptId!,

      questionId: currentQuestion.id,

      optionId: optionId,

    ),

  );

}
Future<void> loadProgress() async {

  final progress = await _api.getProgress(currentAttemptId!);

  print("Answered Questions: ${progress.answeredQuestions}");

  selectedAnswers.clear();

  for (final answer in progress.answered) {

    print(
      "Q${answer.questionOrder} -> Option ${answer.selectedOptionId}",
    );

    selectedAnswers[answer.questionId] =
        answer.selectedOptionId;
  }

  _currentQuestionIndex = progress.answeredQuestions;

  if (_currentQuestionIndex >= questions.length) {
    _currentQuestionIndex = questions.length - 1;
  }

  notifyListeners();
}

Future<CompleteAssessmentResponse>
completeAssessment() async {

  return await _api.completeAssessment(

    CompleteAssessmentRequest(

      attemptId: currentAttemptId!,

    ),

  );

}

Future<CompleteAssessmentResponse> getAssessmentResult(
    int attemptId,
) async {

  return await _resultApiService.getResult(
    attemptId,
  );

}

}
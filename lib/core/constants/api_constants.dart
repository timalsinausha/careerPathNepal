class ApiConstants{
  //static const String baseUrl ="http://192.168.100.3:8000/api";
  static const String baseUrl ="https://careerpathnepal-api.onrender.com/api";

  static const String login= "/login/";
  static const String register = "/register/";
  static const String refreshToken = "/token/refresh/";
  static const String profile = "/profile/";
  static const String updateProfile =  "/student-profile/update/";
  static const String updateduserProfile ="/updated-profile/";
  static const String changePassword ="/change-password/";
  static const String forgotPassword ="/forgot-password/";
  static const String verifyOTP = "/verify-otp/";
  static const String resetPassword = "/reset-password/";
   // Locations
  static const String provinces = "/locations/provinces/";
  static const String districts = "/locations/districts/";

  //assessment
  static const String startAssessment = "/assessment/start/";
  static const String questions = "/assessment/questions/";
  static const String submitAnswer = "/assessment/answer/";
  static const String assessmentProgress = "/assessment/progress/";
  static const completeAssessment = "/assessment/complete/";
  static const assessmentResult ="/assessment/result/";
  static const String assessmentStatus = "/assessment/status/";

  //career
  static const String careerRecommendations = "/careers/recommendations/";
  static const String careers = "/careers/";
  //course
  static const String courses = "/courses/";
  //college
  static const String colleges = "/colleges/";
}

//http://10.0.2.2:8000/api  for android emulator
//  http://127.0.0.1:8000/api  for ios simulator
// http://192.168.1.105:8000/api  for android phone in same wifi IPv4 Address: 192.168.1.105
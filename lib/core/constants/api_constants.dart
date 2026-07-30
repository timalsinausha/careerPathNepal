class ApiConstants{
  static const String baseUrl ="http://192.168.100.3:8000/api";

  static const String login= "/login/";
  static const String register = "/register/";
  static const String refreshToken = "/token/refresh/";
  static const String profile = "/profile/";
  static const String updateProfile =  "/student-profile/update/";
   // Locations
  static const String provinces =
      "/locations/provinces/";

  static const String districts =
      "/locations/districts/";
}

//http://10.0.2.2:8000/api  for android emulator
//  http://127.0.0.1:8000/api  for ios simulator
// http://192.168.1.105:8000/api  for android phone in same wifi IPv4 Address: 192.168.1.105
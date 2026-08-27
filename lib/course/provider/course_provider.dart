import 'package:flutter/material.dart';

import '../model/coursedetails_model.dart';
import '../service/course_api_service.dart';


class CourseProvider extends ChangeNotifier {

  final CourseApiService _api =
      CourseApiService();

  CourseDetailModel? _course;

  bool _isLoading = false;

  String? _error;

  CourseDetailModel? get course => _course;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> loadCourse(
    String slug,
  ) async {

    _isLoading = true;
    _error = null;

    notifyListeners();

    try {

      _course =
          await _api.getCourseDetail(slug);

    } catch (e) {

      _error = e.toString();

    } finally {

      _isLoading = false;

      notifyListeners();
    }
  }

  void clear() {

    _course = null;
    _error = null;

    notifyListeners();
  }
}
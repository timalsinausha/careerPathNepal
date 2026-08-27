import 'package:flutter/material.dart';

import '../model/college_details_model.dart';
import '../service/college_api_service.dart';

class CollegeProvider extends ChangeNotifier {

  final CollegeApiService _api =
      CollegeApiService();

  CollegeDetailModel? _college;

  bool _isLoading = false;

  String? _error;

  CollegeDetailModel? get college => _college;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> loadCollege(
    String slug,
  ) async {

    _isLoading = true;
    _error = null;

    notifyListeners();

    try {

      _college =
          await _api.getCollegeDetail(slug);

    } catch (e) {

      _error = e.toString();

    } finally {

      _isLoading = false;

      notifyListeners();
    }
  }

  void clear() {

    _college = null;
    _error = null;

    notifyListeners();
  }
}
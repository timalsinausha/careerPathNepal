import 'package:flutter/material.dart';

import '../model/college_details_model.dart';
import '../model/college_listmodel.dart';
import '../service/college_api_service.dart';

class CollegeProvider extends ChangeNotifier {

  final CollegeApiService _api =
      CollegeApiService();

  CollegeDetailModel? _college;
  List<CollegeListModel> _colleges = [];

  bool _isLoading = false;

  String? _error;

  CollegeDetailModel? get college => _college;
  List<CollegeListModel> get colleges => _colleges;

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

    // Load all colleges
  Future<void> loadColleges() async {

    _isLoading = true;
    _error = null;

    notifyListeners();

    try {

      _colleges = await _api.getColleges();

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
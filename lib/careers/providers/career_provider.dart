import 'package:flutter/material.dart';
import '../models/career_details_model.dart';
import '../services/career_api_service.dart';

class CareerProvider extends ChangeNotifier {

  final CareerApiService _api =
      CareerApiService();

  CareerDetailModel? _career;

  bool _isLoading = false;

  String? _error;

  CareerDetailModel? get career => _career;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> loadCareer(
      String slug) async {

    _isLoading = true;

    _error = null;

    notifyListeners();

    try {

      _career =
          await _api.getCareerDetail(slug);

    } catch (e) {

      _error = e.toString();

    } finally {

      _isLoading = false;

      notifyListeners();

    }
  }

  void clear() {

    _career = null;

    _error = null;

    notifyListeners();

  }
}
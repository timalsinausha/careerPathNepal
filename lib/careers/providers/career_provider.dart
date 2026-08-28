import 'package:flutter/material.dart';
import '../models/career_details_model.dart';
import '../models/careerlist.dart';
import '../services/career_api_service.dart';

class CareerProvider extends ChangeNotifier {

  final CareerApiService _api =
      CareerApiService();

  CareerDetailModel? _career;
  List<CareerListModel> _careers = [];

  bool _isLoading = false;

  String? _error;

  CareerDetailModel? get career => _career;

  bool get isLoading => _isLoading;

  String? get error => _error;

    List<CareerListModel> get careers =>
      _careers;


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

   Future<void> loadCareers() async {
    _isLoading = true;
    _error = null;

    notifyListeners();

    try {
      _careers = await _api.getCareers();
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
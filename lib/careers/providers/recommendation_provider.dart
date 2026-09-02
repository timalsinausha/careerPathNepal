import 'package:flutter/material.dart';

import '../models/recommendation_model.dart';
import '../services/recommendation_api_services.dart';

class RecommendationProvider extends ChangeNotifier {

  final RecommendationApiService _api =
      RecommendationApiService();

  List<RecommendationModel> _recommendations = [];

  bool _isLoading = false;

  String? _error;

  List<RecommendationModel> get recommendations =>
      _recommendations;

  bool get isLoading => _isLoading;

  String? get error => _error;

 Future<void> loadRecommendations() async {

  _isLoading = true;
  _error = null;

  notifyListeners();

  try {

    _recommendations =
        await _api.getRecommendations();

  } catch (e, s) {

    _error = e.toString();

  } finally {

    _isLoading = false;

    notifyListeners();

  }
}

  void clear() {
    _recommendations = [];

    _error = null;

    notifyListeners();

  }
}
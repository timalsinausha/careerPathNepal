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

    print("Loading recommendations...");

    _recommendations =
        await _api.getRecommendations();

    print("Loaded: ${_recommendations.length}");

  } catch (e, s) {

    print("Recommendation Error");
    print(e);
    print(s);

    _error = e.toString();

  } finally {

    _isLoading = false;

    notifyListeners();

  }
}

  void clear() {
print("CLEARING RECOMMENDATIONS");
    _recommendations = [];

    _error = null;

    notifyListeners();

  }
}
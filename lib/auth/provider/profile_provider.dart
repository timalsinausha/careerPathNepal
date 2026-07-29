import 'package:flutter/material.dart';

import '../model/profile_response.dart';
import '../service/profile_api_service.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileApiService _profileApiService =
      ProfileApiService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ProfileResponse? _profile;
  ProfileResponse? get profile => _profile;

  Future<ProfileResponse> getProfile() async {
    _isLoading = true;
    notifyListeners();

    try {
      _profile = await _profileApiService.getProfile();
      return _profile!;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
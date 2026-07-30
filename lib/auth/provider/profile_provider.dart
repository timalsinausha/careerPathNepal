import 'package:careernepal/auth/model/update_profile_request.dart';
import 'package:flutter/material.dart';

import '../model/profile_response.dart';
import '../service/profile_api_service.dart';


class ProfileProvider extends ChangeNotifier {
  final ProfileApiService _profileApiService =
      ProfileApiService();

  final UpdateProfileRequest draftProfile =
    UpdateProfileRequest();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ProvinceModel> _provinces = [];
  List<DistrictModel> _districts = [];

  List<ProvinceModel> get provinces =>_provinces;

  List<DistrictModel> get districts =>_districts;


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

  void setEducation({
  required String level,
  required String institution,
  required double score,
}) {
  draftProfile.highestEducationLevel = level;
  draftProfile.highestEducationInstitution =
      institution;
  draftProfile.academicScore = score;

  notifyListeners();
}

void setLocation({
  required int provinceId,
  required int districtId,
  required String budgetRange,
}) {
  draftProfile.provinceId = provinceId;
  draftProfile.districtId = districtId;
  draftProfile.budgetRange = budgetRange;

  notifyListeners();
}


Future<void> saveProfile(
) async {
  _isLoading = true;
  notifyListeners();

  try {
    await _profileApiService.saveProfile(
      draftProfile,
    );

    await getProfile();
    
  } finally {
    _isLoading = false;
    notifyListeners();
  }
}


Future<void> loadProvinces() async {
    _isLoading = true;
    notifyListeners();

    try {
      _provinces =
          await _profileApiService.getProvinces();
             print("Loaded Provinces:");
    print(_provinces.length);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadDistricts(
    int provinceId,
  ) async {
    _districts = [];

    notifyListeners();

    _districts =
        await _profileApiService.getDistricts(
      provinceId,
    );

    notifyListeners();
  }

void clearDraft() {
  draftProfile.highestEducationLevel = null;
  draftProfile.highestEducationInstitution =
      null;
  draftProfile.academicScore = null;

  draftProfile.provinceId = null;
  draftProfile.districtId = null;

  draftProfile.budgetRange = null;

  notifyListeners();
}
}
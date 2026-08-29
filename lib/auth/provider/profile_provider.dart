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

  String? _error;
   String? get error => _error;

  List<ProvinceModel> _provinces = [];
  List<DistrictModel> _districts = [];

  List<ProvinceModel> get provinces =>_provinces;

  List<DistrictModel> get districts =>_districts;


  ProfileResponse? _profile;
  ProfileResponse? get profile => _profile;

  bool _hasLoadedProfile = false;

bool get hasLoadedProfile => _hasLoadedProfile;

  Future<ProfileResponse> getProfile() async {
    _isLoading = true;
    notifyListeners();

    try {
      _profile = await _profileApiService.getProfile();
        _hasLoadedProfile = true;
      return _profile!;
      
      
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setEducation({
   String? level,
   String? institution,
   double? score,
}) {
  draftProfile.highestEducationLevel = level;
  draftProfile.highestEducationInstitution =
      institution;
  draftProfile.academicScore = score;

  notifyListeners();
}

void initializeDraftFromProfile(ProfileResponse profile) {
  final student = profile.studentProfile;

  draftProfile.highestEducationLevel =
      student.highestEducationLevel;

  draftProfile.highestEducationInstitution =
      student.highestEducationInstitution;

  draftProfile.academicScore =
      student.academicScore;

  draftProfile.provinceId =
      student.province?.id;

  draftProfile.districtId =
      student.district?.id;

  draftProfile.budgetRange =
      student.budgetRange;

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

//to update student details like education.
Future<void> saveProfile(
) async {
  _isLoading = true;
  notifyListeners();

  try {
    print("PROFILE: Calling API...");
    await _profileApiService.saveProfile(
      draftProfile,
    );

    await getProfile();
    
  } finally {
    _isLoading = false;
    notifyListeners();
  }
}

//to update user details
Future<bool> updateUserProfile({
  String? firstName,
  String? lastName,
  String? contactNumber,
}) async {
  _isLoading = true;
  _error = null;

  notifyListeners();

  try {
     print("userPROFILE: Calling API...");
    await _profileApiService.updateUserProfile(
      firstName: firstName,
      lastName: lastName,
      contactNumber: contactNumber,
    );
print("userPROFILE: Calling API...done");
    // Get latest profile from backend
    await getProfile();

    return true;
  } catch (e) {
    _error = e.toString();

    return false;
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
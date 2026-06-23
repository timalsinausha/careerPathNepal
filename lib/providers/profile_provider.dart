import 'package:careernepal/models/profile_model.dart';
import 'package:flutter/material.dart';


class ProfileProvider extends ChangeNotifier {

  ProfileModel _profile = ProfileModel(
    name: "Sushmita Timalsina",
    email: "sushmita@gmail.com",
    address: "Kathmandu, Nepal",
    contactNo: "9800000000",
    emergencyContact: "9811111111",
    imageUrl: "",
  );

  ProfileModel get profile => _profile;

  void updateProfile(ProfileModel profile) {
    _profile = profile;
    notifyListeners();
  }
}
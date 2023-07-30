import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  Map<String, String> _userProfile = {
    "name": "Hoang Viet",
    "phone": "0923082002",
    "email": "thoandcup@meomeo.com",
    "address": "Cong Hoa street, Tan Binh district, HCM city"
  };

  Map<String, String> get userProfile => _userProfile;

  void changeUserProfile(String key, String value) {
    _userProfile[key] = value;
    notifyListeners();
  }
}
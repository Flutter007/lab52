import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  String? _selectedMeetGender;
  String? _selectedGender;
  String? get selectedMeetGender => _selectedMeetGender;
  String? get selectedGender => _selectedGender;
  User? _user;
  User? get user => _user;
  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void setGender(String? meetGender, String? gender) {
    _selectedGender = gender;
    _selectedMeetGender = meetGender;
    notifyListeners();
  }
}

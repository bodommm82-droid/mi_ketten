import 'package:flutter/material.dart';
import '../models/user_profile.dart';

class CoupleProfileProvider extends ChangeNotifier {
  UserProfile? userA;
  UserProfile? userB;

  void setProfiles(UserProfile a, UserProfile b) {
    userA = a;
    userB = b;
    notifyListeners();
  }

  bool get isComplete => userA != null && userB != null;
}

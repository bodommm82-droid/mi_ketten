import 'package:flutter/material.dart';
import '../models/user_profile.dart';

class UserProvider extends ChangeNotifier {
  UserProfile? profile;

  void setUser(UserProfile user) {
    profile = user;
    notifyListeners();
  }

  bool get isLoggedIn => profile != null;
}

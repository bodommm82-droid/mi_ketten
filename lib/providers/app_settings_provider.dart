import 'package:flutter/material.dart';

class AppSettingsProvider extends ChangeNotifier {
  bool darkMode = false;
  String language = 'hu';

  void toggleDarkMode() {
    darkMode = !darkMode;
    notifyListeners();
  }

  void setLanguage(String lang) {
    language = lang;
    notifyListeners();
  }
}

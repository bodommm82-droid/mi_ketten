import 'package:flutter/material.dart';

class OfflineProvider extends ChangeNotifier {
  bool isOffline = false;

  void setOffline(bool value) {
    isOffline = value;
    notifyListeners();
  }
}

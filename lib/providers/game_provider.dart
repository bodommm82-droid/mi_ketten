import 'package:flutter/material.dart';
import '../models/result.dart';

class GameProvider extends ChangeNotifier {
  int currentQuestionIndex = 0;
  List<Result> results = [];

  void nextQuestion() {
    currentQuestionIndex++;
    notifyListeners();
  }

  void addResult(Result result) {
    results.add(result);
    notifyListeners();
  }

  void resetGame() {
    currentQuestionIndex = 0;
    results.clear();
    notifyListeners();
  }
}

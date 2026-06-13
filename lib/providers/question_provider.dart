import 'package:flutter/material.dart';
import '../questions/adaptive_question_selector.dart';
import '../questions/question_bank.dart';

class QuestionProvider extends ChangeNotifier {
  Question? current;

  void selectNext(AdaptiveQuestionSelector selector) {
    current = selector.nextQuestion();
    notifyListeners();
  }
}

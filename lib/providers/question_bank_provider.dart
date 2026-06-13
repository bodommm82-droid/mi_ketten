import 'package:flutter/material.dart';
import '../questions/question_bank.dart';

class QuestionBankProvider extends ChangeNotifier {
  List<Question> questions = [];

  Future<void> loadQuestions() async {
    questions = QuestionBank.load();
    notifyListeners();
  }
}

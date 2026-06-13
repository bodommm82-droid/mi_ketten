import 'dart:async';
import 'package:flutter/material.dart';
import '../models/answer.dart';
import '../services/answer_service.dart';
import '../services/ai_comment_service.dart';
import '../services/ai_comment_firestore_service.dart';
import '../services/match_score_service.dart';
import '../services/match_score_firestore_service.dart';

class AnswerProvider extends ChangeNotifier {
  final AnswerService _service = AnswerService();
  final AiCommentService _ai = AiCommentService();
  final AiCommentFirestoreService _aiStore = AiCommentFirestoreService();
  final MatchScoreService _match = MatchScoreService();
  final MatchScoreFirestoreService _matchStore = MatchScoreFirestoreService();

  List<Answer> answers = [];
  StreamSubscription<List<Answer>>? _sub;
  String? lastGeneratedForQuestion;

  void listen(String roomId, String questionId) {
    _sub?.cancel();
    _sub = _service.watchAnswers(roomId, questionId).listen((list) async {
      answers = list;
      notifyListeners();

      if (answers.length == 2 && lastGeneratedForQuestion != questionId) {
        final a = answers[0].answerText;
        final b = answers[1].answerText;

        final comment = _ai.generateComment(a, b);
        await _aiStore.saveComment(roomId, questionId, comment);

        final score = _match.calculateMatch(a, b);
        await _matchStore.saveScore(roomId, questionId, score);

        lastGeneratedForQuestion = questionId;
      }
    });
  }

  Future<void> send(String roomId, Answer answer) async {
    await _service.saveAnswer(roomId, answer);
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}

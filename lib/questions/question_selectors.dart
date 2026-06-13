import 'question_bank.dart';
import 'quiz_questions_long.dart';
import 'short_answer_questions.dart';
import 'who_is_more_questions_long.dart';

enum GameMode {
  quiz,
  shortAnswer,
  whoIsMore,
}

class QuestionSelectors {
  static List<Question> forMode(GameMode mode) {
    switch (mode) {
      case GameMode.quiz:
        return QuizQuestionsLong.getQuestions();
      case GameMode.shortAnswer:
        return ShortAnswerQuestions.getQuestions();
      case GameMode.whoIsMore:
        return WhoIsMoreQuestionsLong.getQuestions();
    }
  }

  static List<Question> filterByCategory(List<Question> all, String category) {
    return all.where((q) => q.category == category).toList();
  }

  static List<Question> filterByDifficulty(
      List<Question> all, int min, int max) {
    return all
        .where((q) => q.difficulty >= min && q.difficulty <= max)
        .toList();
  }
}

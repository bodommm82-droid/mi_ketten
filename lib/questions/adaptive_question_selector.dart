import 'dart:math';
import 'question_bank.dart';
import 'question_selectors.dart';

class AdaptiveQuestionSelector {
  final Random _random = Random();
  final List<Question> _allQuestions;
  final Map<String, int> _categoryWeights = {};
  final Map<String, int> _difficultyAdjust = {};

  AdaptiveQuestionSelector(this._allQuestions);

  void updateCategoryPreference(String category, int delta) {
    _categoryWeights[category] = (_categoryWeights[category] ?? 0) + delta;
  }

  void updateDifficulty(String category, int delta) {
    _difficultyAdjust[category] = (_difficultyAdjust[category] ?? 0) + delta;
  }

  Question nextQuestion() {
    var candidates = _allQuestions;
    final categories = _allQuestions.map((q) => q.category).toSet().toList();
    categories.shuffle(_random);
    categories.sort((a, b) {
      final wa = _categoryWeights[a] ?? 0;
      final wb = _categoryWeights[b] ?? 0;
      return wb.compareTo(wa);
    });
    final chosenCategory = categories.isNotEmpty ? categories.first : null;
    if (chosenCategory != null) {
      candidates =
          QuestionSelectors.filterByCategory(_allQuestions, chosenCategory);
    }
    if (candidates.isEmpty) candidates = _allQuestions;

    if (chosenCategory != null) {
      final diffAdjust = _difficultyAdjust[chosenCategory] ?? 0;
      final min = (2 + diffAdjust).clamp(1, 5);
      final max = (4 + diffAdjust).clamp(1, 5);
      final filtered =
          QuestionSelectors.filterByDifficulty(candidates, min, max);
      if (filtered.isNotEmpty) candidates = filtered;
    }

    return candidates[_random.nextInt(candidates.length)];
  }
}

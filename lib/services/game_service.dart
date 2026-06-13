import '../models/result.dart';

class GameService {
  Result calculateScore(int correct, int total) {
    final percent = (correct / total) * 100;
    return Result(
      score: correct,
      matchPercent: percent,
      timestamp: DateTime.now(),
    );
  }
}

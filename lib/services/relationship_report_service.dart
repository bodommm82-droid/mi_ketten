import '../models/answer.dart';
import 'match_score_service.dart';
import 'ai_comment_service.dart';

class RelationshipReportService {
  final MatchScoreService _match = MatchScoreService();
  final AiCommentService _ai = AiCommentService();

  Map<String, dynamic> generateReport(List<Answer> answers) {
    final Map<String, List<Answer>> grouped = {};
    for (var a in answers) {
      grouped.putIfAbsent(a.questionId, () => []);
      grouped[a.questionId]!.add(a);
    }

    final List<Map<String, dynamic>> questionReports = [];
    for (var entry in grouped.entries) {
      final list = entry.value;
      if (list.length == 2) {
        final a = list[0].answerText;
        final b = list[1].answerText;
        final score = _match.calculateMatch(a, b);
        final comment = _ai.generateComment(a, b);
        questionReports.add({
          'questionId': entry.key,
          'answerA': a,
          'answerB': b,
          'score': score,
          'comment': comment,
        });
      }
    }

    final Map<String, List<double>> categoryScores = {};
    for (var qr in questionReports) {
      final category = _extractCategory(qr['questionId']);
      categoryScores.putIfAbsent(category, () => []);
      categoryScores[category]!.add(qr['score']);
    }

    final Map<String, double> categoryAverages = {};
    categoryScores.forEach((cat, scores) {
      final avg = scores.reduce((a, b) => a + b) / scores.length;
      categoryAverages[cat] = avg;
    });

    final overall = _overallSummary(categoryAverages);

    return {
      'questions': questionReports,
      'categories': categoryAverages,
      'summary': overall,
    };
  }

  String _extractCategory(String questionId) {
    if (questionId.startsWith('memory')) return 'memory';
    if (questionId.startsWith('romance')) return 'romance';
    if (questionId.startsWith('conflict')) return 'conflict';
    if (questionId.startsWith('appreciation')) return 'appreciation';
    return 'general';
  }

  String _overallSummary(Map<String, double> cats) {
    final romance = cats['romance'] ?? 50;
    final memory = cats['memory'] ?? 50;
    final conflict = cats['conflict'] ?? 50;
    final appreciation = cats['appreciation'] ?? 50;

    if (romance > 70 && appreciation > 70) {
      return "Erős romantikus és érzelmi összhang jellemzi a kapcsolatotokat. 💕";
    }
    if (conflict < 40) {
      return "A konfliktuskezelésben még van tér a fejlődésre, de a többi terület stabil.";
    }
    if (memory > 70) {
      return "A közös emlékek és élmények erős alapot adnak nektek.";
    }
    return "Kiegyensúlyozott kapcsolat, több területen is szép összhanggal.";
  }
}

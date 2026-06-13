class MatchScoreService {
  double calculateMatch(String a, String b) {
    final la = a.toLowerCase();
    final lb = b.toLowerCase();

    final wordScore = _wordSimilarity(la, lb);
    final lengthScore = _lengthSimilarity(la, lb);

    double score = (wordScore * 0.7 + lengthScore * 0.3) * 100;

    if (_isPositive(la) && _isPositive(lb)) score += 10;
    if (_isNegative(la) || _isNegative(lb)) score -= 10;

    return score.clamp(0, 100);
  }

  double _wordSimilarity(String a, String b) {
    final wa = a.split(" ").toSet();
    final wb = b.split(" ").toSet();
    final common = wa.intersection(wb).length;
    final total = (wa.length + wb.length) / 2;
    if (total == 0) return 0;
    return common / total;
  }

  double _lengthSimilarity(String a, String b) {
    final la = a.length;
    final lb = b.length;
    final diff = (la - lb).abs();
    final maxLen = (la + lb) / 2;
    if (maxLen == 0) return 0;
    return 1 - (diff / maxLen).clamp(0, 1);
  }

  bool _isPositive(String t) {
    return t.contains("jó") ||
        t.contains("szép") ||
        t.contains("szeret") ||
        t.contains("boldog");
  }

  bool _isNegative(String t) {
    return t.contains("rossz") ||
        t.contains("bánt") ||
        t.contains("szomorú") ||
        t.contains("utál");
  }
}

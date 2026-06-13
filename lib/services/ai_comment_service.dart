class AiCommentService {
  String generateComment(String a, String b) {
    final la = a.toLowerCase();
    final lb = b.toLowerCase();

    if (la == lb || la.contains(lb) || lb.contains(la)) {
      return "Nagyon egy hullámhosszon vagytok! 💕";
    }

    final overlap = _wordOverlap(la, lb);
    if (overlap > 0.4) {
      return "A válaszaitok több ponton is találkoznak. Szép összhang!";
    }

    if (overlap < 0.1) {
      return "Érdekes különbség van a válaszaitok között – jó beszélgetésindító lehet!";
    }

    return "Mindkét válasz értékes – érdemes megbeszélni őket.";
  }

  double _wordOverlap(String a, String b) {
    final wa = a.split(" ").toSet();
    final wb = b.split(" ").toSet();
    final common = wa.intersection(wb).length;
    final total = (wa.length + wb.length) / 2;
    return common / total;
  }
}

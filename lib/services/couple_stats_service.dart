class CoupleStatsService {
  Map<String, dynamic> generateStats(List<int> moods) {
    return {
      "avgMood":
          moods.isEmpty ? 0 : moods.reduce((a, b) => a + b) / moods.length,
      "interactions": moods.length,
    };
  }
}

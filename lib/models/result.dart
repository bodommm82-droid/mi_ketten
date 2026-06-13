class Result {
  final int score;
  final double matchPercent;
  final DateTime timestamp;

  Result({
    required this.score,
    required this.matchPercent,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'score': score,
        'matchPercent': matchPercent,
        'timestamp': timestamp.toIso8601String(),
      };

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        score: json['score'],
        matchPercent: (json['matchPercent'] as num).toDouble(),
        timestamp: DateTime.parse(json['timestamp']),
      );
}

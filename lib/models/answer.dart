class Answer {
  final String userId;
  final String questionId;
  final String answerText;
  final DateTime createdAt;

  Answer({
    required this.userId,
    required this.questionId,
    required this.answerText,
    required this.createdAt, required String hostId,
  });

  // ✅ Firebase-ből olvasás
  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      userId: json['userId'] ?? '',
      questionId: json['questionId'] ?? '',
      answerText: json['answerText'] ?? '',
      createdAt: DateTime.parse(json['createdAt']), hostId: '',
    );
  }

  // ✅ Firebase-be írás
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'questionId': questionId,
      'answerText': answerText,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
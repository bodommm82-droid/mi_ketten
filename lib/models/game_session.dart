import 'package:cloud_firestore/cloud_firestore.dart';

class GameSession {
  final String id;
  final String player1Id;
  final String player2Id;
  int score;
  final DateTime startTime;

  GameSession({
    required this.id,
    required this.player1Id,
    required this.player2Id,
    required this.score,
    required this.startTime,
  });

  // Firestore -> Dart
  factory GameSession.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return GameSession(
      id: doc.id,
      player1Id: data['player1Id'] ?? '',
      player2Id: data['player2Id'] ?? '',
      score: data['score'] ?? 0,
      startTime: (data['startTime'] as Timestamp).toDate(),
    );
  }

  // Dart -> Firestore
  Map<String, dynamic> toJson() {
    return {
      'player1Id': player1Id,
      'player2Id': player2Id,
      'score': score,
      'startTime': Timestamp.fromDate(startTime),
    };
  }
}

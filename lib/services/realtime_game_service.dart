import 'dart:math';

import 'package:firebase_database/firebase_database.dart';

class RealtimeGameService {
  final FirebaseDatabase _db = FirebaseDatabase.instance;

  // Szoba létrehozása
  Future<String> createRoom(String hostId) async {
    final roomId = (100000 + Random().nextInt(900000)).toString();
    await _db.ref('rooms/$roomId').set({
      'status': 'waiting',
      'currentQuestion': 0,
      'players': {'player1': true},
      'hostId': hostId,
      'createdAt': ServerValue.timestamp,
    });
    return roomId;
  }

  // Csatlakozás szobához
  Future<void> joinRoom(String roomId, String playerId) async {
    await _db.ref('rooms/$roomId/players/player2').set(true);
  }

  // Kérdés stream
  Stream<DatabaseEvent> questionStream(String roomId) {
    return _db.ref('rooms/$roomId/currentQuestion').onValue;
  }

  // Válasz küldése
  Future<void> sendAnswer(String sessionId, String playerId, String questionId, int answer) async {
    await _db.ref('live_sessions/$sessionId/answers/$playerId').set({
      'questionId': questionId,
      'answer': answer,
      'timestamp': ServerValue.timestamp,
    });
  }

  // Pontszám frissítése
  Future<void> updateScore(String sessionId, String playerId, int score) async {
    await _db.ref('live_sessions/$sessionId/scores/$playerId').set(score);
  }

  // Időzítő frissítése
  Future<void> updateTime(String sessionId, int timeRemaining) async {
    await _db.ref('live_sessions/$sessionId/timeRemaining').set(timeRemaining);
  }
}
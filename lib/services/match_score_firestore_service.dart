import 'package:cloud_firestore/cloud_firestore.dart';

class MatchScoreFirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveScore(
    String roomId,
    String questionId,
    double score,
  ) async {
    await _db
        .collection('rooms')
        .doc(roomId)
        .collection('match_scores')
        .doc(questionId)
        .set({
      'score': score,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<double?> watchScore(String roomId, String questionId) {
    return _db
        .collection('rooms')
        .doc(roomId)
        .collection('match_scores')
        .doc(questionId)
        .snapshots()
        .map((snap) {
      if (!snap.exists) return null;
      return (snap.data()?['score'] as num?)?.toDouble();
    });
  }
}

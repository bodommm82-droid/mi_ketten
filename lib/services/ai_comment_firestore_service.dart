import 'package:cloud_firestore/cloud_firestore.dart';

class AiCommentFirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveComment(
    String roomId,
    String questionId,
    String comment,
  ) async {
    await _db.collection('rooms').doc(roomId).collection('ai_comments').add({
      'questionId': questionId,
      'comment': comment,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<String?> watchComment(String roomId, String questionId) {
    return _db
        .collection('rooms')
        .doc(roomId)
        .collection('ai_comments')
        .where('questionId', isEqualTo: questionId)
        .orderBy('createdAt', descending: true)
        .limit(1)
        .snapshots()
        .map((snap) {
      if (snap.docs.isEmpty) return null;
      return snap.docs.first.data()['comment'] as String?;
    });
  }
}

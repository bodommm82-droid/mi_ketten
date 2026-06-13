import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/answer.dart';

class AnswerService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveAnswer(String roomId, Answer answer) async {
    await _db.collection('rooms').doc(roomId).collection('answers').add({
      'userId': answer.userId,
      'questionId': answer.questionId,
      'answerText': answer.answerText,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<List<Answer>> watchAnswers(String roomId, String questionId) {
    return _db
        .collection('rooms')
        .doc(roomId)
        .collection('answers')
        .where('questionId', isEqualTo: questionId)
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map(
            (snap) => snap.docs.map((d) => Answer.fromJson(d.data())).toList());
  }
}

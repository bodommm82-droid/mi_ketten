import 'package:cloud_firestore/cloud_firestore.dart';

class RoomChatService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> messages(String roomId) {
    return _db
        .collection('rooms')
        .doc(roomId)
        .collection('messages')
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((snap) => snap.docs.map((d) => d.data()).toList());
  }

  Future<void> sendMessage(String roomId, String userId, String text) async {
    await _db.collection('rooms').doc(roomId).collection('messages').add({
      'userId': userId,
      'text': text,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}

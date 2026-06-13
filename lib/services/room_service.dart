import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/room.dart';

class RoomService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<Room?> watchRoom(String roomId) {
    return _db.collection('rooms').doc(roomId).snapshots().map((snap) {
      if (!snap.exists) return null;
      return Room.fromJson(snap.data()!);
    });
  }

  Future<Room> createRoom(String hostId) async {
    final roomId = DateTime.now().millisecondsSinceEpoch.toString();
    final room = Room(
      roomId: roomId,
      hostId: hostId,
      guestId: null,
      isActive: true,
      started: false,
    );
    await _db.collection('rooms').doc(roomId).set({
      ...room.toJson(),
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
    return room;
  }

  Future<void> joinRoom(String roomId, String guestId) async {
    await _db.collection('rooms').doc(roomId).update({
      'guestId': guestId,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> startGame(String roomId) async {
    await _db.collection('rooms').doc(roomId).update({
      'started': true,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> setCurrentQuestion(String roomId, String questionId) async {
    await _db.collection('rooms').doc(roomId).update({
      'currentQuestionId': questionId,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> setReady(String roomId, String userId, String hostId) async {
    final isHost = userId == hostId;
    await _db.collection('rooms').doc(roomId).update({
      isHost ? 'hostReady' : 'guestReady': true,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> closeRoom(String roomId) async {
    await _db.collection('rooms').doc(roomId).update({
      'isActive': false,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}

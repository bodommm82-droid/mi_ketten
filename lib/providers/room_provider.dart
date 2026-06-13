import 'dart:async';
import 'package:flutter/material.dart';
import '../models/room.dart';
import '../services/room_service.dart';

class RoomProvider extends ChangeNotifier {
  final RoomService _service = RoomService();
  Room? room;
  StreamSubscription<Room?>? _sub;

  void setRoom(Room newRoom) {
    room = newRoom;
    _listenRoom(newRoom.roomId);
    notifyListeners();
  }

  void _listenRoom(String roomId) {
    _sub?.cancel();
    _sub = _service.watchRoom(roomId).listen((r) {
      room = r;
      notifyListeners();
    });
  }

  Future<void> create(String hostId) async {
    final r = await _service.createRoom(hostId);
    setRoom(r);
  }

  Future<void> join(String roomId, String guestId) async {
    await _service.joinRoom(roomId, guestId);
    _listenRoom(roomId);
  }

  Future<void> startGame() async {
    if (room == null) return;
    await _service.startGame(room!.roomId);
  }

  Future<void> setCurrentQuestion(String questionId) async {
    if (room == null) return;
    await _service.setCurrentQuestion(room!.roomId, questionId);
  }

  Future<void> setReady(String userId) async {
    if (room == null) return;
    await _service.setReady(room!.roomId, userId, room!.hostId);
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}

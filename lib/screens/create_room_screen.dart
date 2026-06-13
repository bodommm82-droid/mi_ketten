import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../providers/room_provider.dart';

class CreateRoomScreen extends StatelessWidget {
  const CreateRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final roomProv = context.watch<RoomProvider>();
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(title: const Text('Szoba létrehozása')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: roomProv.room == null
            ? Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (user == null) return;
                    await context.read<RoomProvider>().create(user.uid);
                    Navigator.pushNamed(context, '/waiting-room');
                  },
                  child: const Text('Szoba létrehozása'),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Szobakód: ${roomProv.room!.roomId}',
                      style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 16),
                  const Text('Várakozás a párodra...'),
                ],
              ),
      ),
    );
  }
}

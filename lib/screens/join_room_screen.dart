import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../providers/room_provider.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(title: const Text('Csatlakozás szobához')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: code,
              decoration: const InputDecoration(labelText: 'Szobakód'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (user == null) return;
                await context
                    .read<RoomProvider>()
                    .join(code.text.trim(), user.uid);
                Navigator.pushNamed(context, '/waiting-room');
              },
              child: const Text('Csatlakozás'),
            ),
          ],
        ),
      ),
    );
  }
}

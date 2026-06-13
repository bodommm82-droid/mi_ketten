import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../providers/room_provider.dart';
import '../services/room_chat_service.dart';
import '../widgets/chat_bubble.dart';

class WaitingRoomScreen extends StatefulWidget {
  const WaitingRoomScreen({super.key});

  @override
  State<WaitingRoomScreen> createState() => _WaitingRoomScreenState();
}

class _WaitingRoomScreenState extends State<WaitingRoomScreen> {
  final chatService = RoomChatService();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final roomProv = context.watch<RoomProvider>();
    final room = roomProv.room;
    final user = FirebaseAuth.instance.currentUser;

    if (room == null) {
      return const Scaffold(body: Center(child: Text('Nincs aktív szoba.')));
    }

    final isHost = room.hostId == user?.uid;
    final hasGuest = room.guestId != null;
    final bothReady = room.hostReady && room.guestReady;

    if (room.started) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, '/game'));
    }

    final myReady = isHost ? room.hostReady : room.guestReady;
    final otherReady = isHost ? room.guestReady : room.hostReady;

    return Scaffold(
      appBar: AppBar(title: const Text('Várakozás a társra')),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Szobakód: ${room.roomId}',
                      style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 16),
                  Text(hasGuest
                      ? 'A párod csatlakozott! 🎉'
                      : 'Várakozás a párodra...'),
                  const SizedBox(height: 16),
                  Text(
                      'Te státuszod: ${myReady ? "Kész ✅" : "Még nem kész ⏳"}'),
                  Text(
                      'Párod státusza: ${otherReady ? "Kész ✅" : "Még nem kész ⏳"}'),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      await roomProv.setReady(user!.uid);
                    },
                    child: const Text('Készen állok'),
                  ),
                  const SizedBox(height: 16),
                  if (isHost)
                    ElevatedButton(
                      onPressed: bothReady
                          ? () async => await roomProv.startGame()
                          : null,
                      child: const Text('Játék indítása'),
                    ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const Text('Chat:', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Expanded(
                    child: StreamBuilder<List<Map<String, dynamic>>>(
                      stream: chatService.messages(room.roomId),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        final msgs = snapshot.data!;
                        return ListView.builder(
                          itemCount: msgs.length,
                          itemBuilder: (_, i) {
                            final m = msgs[i];
                            final isMe = m['userId'] == user?.uid;
                            return ChatBubble(
                              text: m['text'] ?? '',
                              isMe: isMe,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration:
                        const InputDecoration(hintText: 'Üzenet írása...'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    final text = controller.text.trim();
                    if (text.isEmpty) return;
                    await chatService.sendMessage(room.roomId, user!.uid, text);
                    controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

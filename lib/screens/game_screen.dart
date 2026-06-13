import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../providers/room_provider.dart';
import '../providers/question_provider.dart';
import '../providers/answer_provider.dart';

import '../questions/question_bank.dart';

import '../models/answer.dart';
import '../models/room.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
late List<Question> all;

final user = FirebaseAuth.instance.currentUser;
final TextEditingController controller = TextEditingController();

@override
void initState() {
super.initState();

all = QuestionBank.load();

WidgetsBinding.instance.addPostFrameCallback((_) {
final roomProv = context.read<RoomProvider>();
final qProv = context.read<QuestionProvider>();

// ✅ Room létrehozás
roomProv.setRoom(
Room(
roomId: "test_room",
hostId: user?.uid ?? "test_user",
isActive: true,
started: false,
currentQuestionId: null,
),
);

// ✅ első kérdés
qProv.current = all.first;
});
}

@override
Widget build(BuildContext context) {
final room = context.watch<RoomProvider>().room;
final question = context.watch<QuestionProvider>().current;
final answerProv = context.watch<AnswerProvider>();

if (room == null) {
return const Scaffold(
body: Center(child: Text("ROOM NULL")),
);
}

if (question == null) {
return const Scaffold(
body: Center(child: Text("QUESTION NULL")),
);
}

return Scaffold(
appBar: AppBar(
title: const Text("Játék"),
),
body: Padding(
padding: const EdgeInsets.all(20),
child: Column(
children: [
// ✅ kérdés
Text(
question.text,
style: const TextStyle(fontSize: 20),
),

const SizedBox(height: 20),

// ✅ input
TextField(
controller: controller,
decoration: const InputDecoration(
labelText: "Válaszod",
border: OutlineInputBorder(),
),
),

const SizedBox(height: 10),

// ✅ gomb
ElevatedButton(
onPressed: () async {
final text = controller.text.trim();
if (text.isEmpty) return;

final ans = Answer(
hostId: user?.uid ?? "test_user",
questionId: question.id,
answerText: text,
createdAt: DateTime.now(), userId: '',
);

await answerProv.send(room.roomId, ans);

controller.clear();
},
child: const Text("Küld"),
),

const SizedBox(height: 20),

// ✅ lista
  Expanded(
    child: ListView.builder(
      itemCount: answerProv.answers.length,
      itemBuilder: (context, index) {
        final a = answerProv.answers[index];

        return Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(vertical: 4),
          color: Colors.grey.shade300,
          child: Text(a.answerText),
        );
      },
    ),
  ),
],
),
),
);
}
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().profile;
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: user == null
          ? const Center(child: Text('Nincs bejelentkezett felhasználó.'))
          : Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Név: ${user.name}',
                      style: const TextStyle(fontSize: 20)),
                  Text('Kor: ${user.age}'),
                  Text('Szeretetnyelv: ${user.loveLanguage}'),
                ],
              ),
            ),
    );
  }
}

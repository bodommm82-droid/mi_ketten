import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Házastársas 2.0')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/game'),
              child: const Text('Játék indítása'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/profile'),
              child: const Text('Profil'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              child: const Text('Beállítások'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/create-room'),
              child: const Text('Szoba létrehozása (multiplayer)'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/join-room'),
              child: const Text('Csatlakozás szobához'),
            ),
          ],
        ),
      ),
    );
  }
}

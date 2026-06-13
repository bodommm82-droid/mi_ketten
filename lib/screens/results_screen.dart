import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eredmények')),
      body: const Center(
        child: Text(
          'Itt jelennek meg a játék eredményei.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RelationshipReportScreen extends StatelessWidget {
  final Map<String, dynamic> report;

  const RelationshipReportScreen({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    final questions = report['questions'] as List<dynamic>;
    final categories = report['categories'] as Map<String, double>;
    final summary = report['summary'] as String;

    return Scaffold(
      appBar: AppBar(title: const Text('Kapcsolati jelentés')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            Text("Összegzés", style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(summary, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            Text("Témakörök", style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            ...categories.entries.map((e) => ListTile(
                  title: Text(e.key),
                  trailing: Text("${e.value.toStringAsFixed(1)}%"),
                )),
            const SizedBox(height: 24),
            Text("Kérdésenkénti elemzés",
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            ...questions.map((q) => Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Kérdés: ${q['questionId']}"),
                        const SizedBox(height: 8),
                        Text("A válasza: ${q['answerA']}"),
                        Text("B válasza: ${q['answerB']}"),
                        const SizedBox(height: 8),
                        Text("Match score: ${q['score'].toStringAsFixed(1)}%"),
                        const SizedBox(height: 8),
                        Text("AI komment: ${q['comment']}"),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

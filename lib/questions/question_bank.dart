class Question {
  final String id;
  final String text;
  final String category;
  final int difficulty;
  final String type;

  Question({
    required this.id,
    required this.text,
    required this.category,
    required this.difficulty,
    required this.type,
  });
}

class QuestionBank {
  static List<Question> load() {
    return [
      Question(
        id: 'quiz_1',
        text:
            'Mi volt az első közös programotok, amire mindketten szívesen emlékeztek?',
        category: 'memory',
        difficulty: 2,
        type: 'quiz',
      ),
      Question(
        id: 'quiz_2',
        text: 'Mi az a tulajdonság a másikban, amit a legjobban szeretsz?',
        category: 'appreciation',
        difficulty: 1,
        type: 'quiz',
      ),
      Question(
        id: 'short_1',
        text:
            'Egy szó, ami leírja a mai hangulatod a kapcsolatotokkal kapcsolatban.',
        category: 'mood',
        difficulty: 1,
        type: 'short',
      ),
      Question(
        id: 'who_1',
        text: 'Kire igaz inkább: ki kezdeményez gyakrabban közös programot?',
        category: 'who_is_more',
        difficulty: 2,
        type: 'who_is_more',
      ),
    ];
  }
}

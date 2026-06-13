import 'question_bank.dart';

class ShortAnswerQuestions {
  static List<Question> getQuestions() {
    return [
      Question(
        id: 'short_1',
        text:
            'Egy szó, ami leírja a mai hangulatod a kapcsolatotokkal kapcsolatban.',
        category: 'mood',
        difficulty: 1,
        type: 'short',
      ),
      Question(
        id: 'short_2',
        text: 'Mi volt a hét legszebb közös pillanata?',
        category: 'memory',
        difficulty: 2,
        type: 'short',
      ),
      Question(
        id: 'short_3',
        text: 'Mi az, amit szívesen megköszönnél most a párodnak?',
        category: 'gratitude',
        difficulty: 2,
        type: 'short',
      ),
    ];
  }
}

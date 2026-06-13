import 'question_bank.dart';

class QuizQuestionsLong {
  static List<Question> getQuestions() {
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
        id: 'quiz_3',
        text: 'Miben fejlődött a kapcsolatotok az elmúlt 6 hónapban?',
        category: 'growth',
        difficulty: 3,
        type: 'quiz',
      ),
    ];
  }
}

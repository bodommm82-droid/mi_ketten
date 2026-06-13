import 'question_bank.dart';

class WhoIsMoreQuestionsLong {
  static List<Question> getQuestions() {
    return [
      Question(
        id: 'who_1',
        text: 'Kire igaz inkább: ki kezdeményez gyakrabban közös programot?',
        category: 'initiative',
        difficulty: 2,
        type: 'who_is_more',
      ),
      Question(
        id: 'who_2',
        text: 'Kire igaz inkább: ki szokott hamarabb kibékülni egy vita után?',
        category: 'conflict',
        difficulty: 3,
        type: 'who_is_more',
      ),
      Question(
        id: 'who_3',
        text: 'Kire igaz inkább: ki lep meg gyakrabban apró figyelmességekkel?',
        category: 'romance',
        difficulty: 2,
        type: 'who_is_more',
      ),
    ];
  }
}

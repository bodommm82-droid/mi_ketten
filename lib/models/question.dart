import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  final String question;
  final String category;

  Question({
    required this.question,
    required this.category,
  });

  factory Question.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Question(
      question: data['question'] ?? '',
      category: data['category'] ?? '',
    );
  }

  get id => null;
}

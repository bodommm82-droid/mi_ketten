import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question.dart';

class QuestionService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Question>> getQuestionsByCategory(String category) async {
    QuerySnapshot snapshot = await _db
        .collection('questions')
        .where('category', isEqualTo: category)
        .limit(10)
        .get();

    return snapshot.docs.map((doc) => Question.fromFirestore(doc)).toList();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/result.dart';

class FirebaseService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> saveResult(Result result) async {
    await db.collection('results').add(result.toJson());
  }

  Future<void> save(String collection, Map<String, dynamic> data) async {
    await db.collection(collection).add(data);
  }

  Stream<List<Map<String, dynamic>>> listen(String collection) {
    return db.collection(collection).snapshots().map(
          (snap) => snap.docs.map((d) => d.data()).toList(),
        );
  }
}

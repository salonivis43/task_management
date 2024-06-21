// lib/services/firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addTask(Task task) {
    return _db.collection('tasks').add(task.toMap());
  }

  Stream<List<Task>> getTasks() {
    return _db.collection('tasks').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList();
    });
  }

  Future<void> updateTask(Task task) {
    return _db.collection('tasks').doc(task.id).update(task.toMap());
  }

  Future<void> deleteTask(String id) {
    return _db.collection('tasks').doc(id).delete();
  }
}

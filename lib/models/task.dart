// lib/models/task.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id;
  String title;
  String description;
  DateTime deadline;
  Duration expectedDuration;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    required this.expectedDuration,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'deadline': deadline.toIso8601String(),
      'expectedDuration': expectedDuration.inMinutes,
      'isCompleted': isCompleted,
    };
  }

  factory Task.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Task(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      deadline: DateTime.parse(data['deadline']),
      expectedDuration: Duration(minutes: data['expectedDuration']),
      isCompleted: data['isCompleted'] ?? false,
    );
  }
}

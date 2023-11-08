import 'package:isar/isar.dart';

part 'todo.g.dart';

@collection
class Todo {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;

  Todo({
    required this.id,
    required this.title,
    this.description = '',
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}

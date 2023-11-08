import 'package:isar/isar.dart';

part 'todo.g.dart';

@collection
class Todo {
  final int id;
  String title;
  String description;
  final DateTime createdAt;
  bool done;

  Todo({
    required this.id,
    required this.title,
    required this.createdAt,
    this.description = '',
    this.done = false,
  });
}

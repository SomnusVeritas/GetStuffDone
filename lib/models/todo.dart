import 'package:isar/isar.dart';

import '../services/dbhelper.dart';

part 'todo.g.dart';

@collection
class Todo {
  final int id;
  String title;
  String description;
  final DateTime createdAt;
  bool done;

  Todo({
    int? index,
    required this.title,
    this.description = '',
    DateTime? createdTime,
    this.done = false,
  })  : createdAt = createdTime ?? DateTime.now(),
        id = index ?? DbHelper.nextTodoId;
}

import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

import '../models/todo.dart';

class DbHelper {
  static late Isar _isar;
  static int get nextTodoId => _isar.todos.autoIncrement();

  static init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = Isar.open(
      schemas: [TodoSchema],
      directory: dir.path,
    );
  }

  static List<Todo> fetchTodos() => _isar.todos.where().findAll();

  static void addTodo(Todo todo) => _isar.write((isar) => isar.todos.put(todo));
}

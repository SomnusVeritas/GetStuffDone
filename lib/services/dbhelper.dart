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
    _isar.write((isar) => isar.todos.clear());
  }

  static List<Todo> fetchTodos() =>
      _isar.todos.where().doneEqualTo(false).sortByCreatedAtDesc().findAll();

  static void addOrUpdateTodo(Todo todo) =>
      _isar.write((isar) => isar.todos.put(todo));

  static void deleteTodoAt(int index) =>
      _isar.write((isar) => isar.todos.delete(index));

  static void deleteTodo(Todo todo) =>
      _isar.write((isar) => isar.todos.delete(todo.id));

  static Stream<void> get todosChangedStream =>
      _isar.todos.watchLazy(fireImmediately: true);
}

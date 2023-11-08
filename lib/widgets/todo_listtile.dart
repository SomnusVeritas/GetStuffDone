import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../pages/todo_detail_page.dart';
import '../services/todo_provider.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({super.key, required this.todo, required this.onPressed});
  final Todo todo;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    if (!todo.done) {
      return undoneTodo(context);
    }
    return doneTodo(context);
  }

  Widget undoneTodo(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Theme.of(context).colorScheme.primaryContainer,
      title: Text(todo.title),
      onTap: () => _onListTileTapped(context),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.check_box,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget doneTodo(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Theme.of(context).colorScheme.surfaceVariant,
      title: Text(todo.title),
      onTap: () => _onListTileTapped(context),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.delete,
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }

  void _onListTileTapped(BuildContext context) {
    TodoProvider.selectedTodo = todo;
    Navigator.of(context).pushNamed(TodoDetailPage.routeName);
  }
}

import 'package:flutter/material.dart';

import '../models/todo.dart';

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
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.delete,
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}

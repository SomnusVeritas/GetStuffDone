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
    final tileColor = todo.done
        ? Theme.of(context).colorScheme.surfaceVariant
        : Theme.of(context).colorScheme.primaryContainer;
    final icon = todo.done
        ? Icon(
            Icons.delete,
            color: Theme.of(context).colorScheme.error,
          )
        : Icon(
            Icons.check_box,
            color: Theme.of(context).colorScheme.primary,
          );
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: tileColor,
      contentPadding: const EdgeInsets.only(left: 24, right: 12),
      title: Text(
        todo.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () => _onListTileTapped(context),
      trailing: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }

  Widget undoneTodo(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Theme.of(context).colorScheme.primaryContainer,
      contentPadding: const EdgeInsets.only(left: 24, right: 12),
      title: Text(
        todo.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
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
      title: Text(
        todo.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
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

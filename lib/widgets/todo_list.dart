import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../services/dbhelper.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> _todos = DbHelper.fetchTodos();

  @override
  void initState() {
    super.initState();
    DbHelper.todosChangedStream.listen((event) {
      setState(() {
        _todos = DbHelper.fetchTodos();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 60),
      itemBuilder: _listBuilder,
      itemCount: _todos.length,
    );
  }

  Widget _listBuilder(BuildContext context, int index) {
    final todo = _todos.elementAt(index);
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Theme.of(context).colorScheme.primaryContainer,
      title: Text(todo.title),
      trailing: IconButton(
        onPressed: () {
          todo.done = true;
          DbHelper.addOrUpdateTodo(todo);
          _showSnackbar(todo);
        },
        icon: Icon(
          Icons.check_box,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  void _showSnackbar(Todo todo) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Todo done'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              todo.done = false;
              DbHelper.addOrUpdateTodo(todo);
            }),
      ),
    );
  }
}

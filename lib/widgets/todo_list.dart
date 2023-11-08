import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../services/dbhelper.dart';
import 'todo_listtile.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.showDoneTodos});
  final bool showDoneTodos;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> _todos = [];

  @override
  void initState() {
    super.initState();
    DbHelper.todosChangedStream.listen((event) {
      setState(() {
        // _todos = _updateTodos();
      });
    });
  }

  Widget _listBuilder(BuildContext context, int index) {
    final todo = _todos.elementAt(index);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TodoListTile(
        todo: todo,
        onPressed: () => _onTodoPressed(todo),
      ),
    );
  }

  void _showDoneConfirmationSnackbar(Todo todo) {
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

  void _showDeleteConfirmationSnackbar(Todo todo) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Todo deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              DbHelper.addOrUpdateTodo(todo);
            }),
      ),
    );
  }

  void _onTodoPressed(Todo todo) {
    if (todo.done) {
      DbHelper.deleteTodo(todo);
      _showDeleteConfirmationSnackbar(todo);
    } else {
      todo.done = true;
      DbHelper.addOrUpdateTodo(todo);
      _showDoneConfirmationSnackbar(todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    _todos = _updateTodos();
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 60),
      itemBuilder: _listBuilder,
      itemCount: _todos.length,
    );
  }

  List<Todo> _updateTodos() {
    if (widget.showDoneTodos) {
      return DbHelper.fetchAllTodos();
    } else {
      return DbHelper.fetchUndoneTodos();
    }
  }
}

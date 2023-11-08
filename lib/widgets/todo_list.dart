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
    DbHelper.watchTodos().listen((event) {
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
      title: Text(todo.title),
    );
  }
}

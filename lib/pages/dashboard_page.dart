import 'package:flutter/material.dart';

import '../widgets/todo_list.dart';
import 'create_todo_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(CreateTodoPage.routeName),
        child: const Icon(Icons.add),
      ),
      body: const TodoList(),
    );
  }
}

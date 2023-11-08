import 'package:flutter/material.dart';

import '../widgets/todo_list.dart';
import 'todo_create_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(CreateTodoPage.routeName),
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: const TodoList(),
        ),
      ),
    );
  }
}

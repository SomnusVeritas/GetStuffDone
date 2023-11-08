import 'package:flutter/material.dart';

import '../widgets/todo_list.dart';
import 'todo_create_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  static const routeName = '/';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _showDoneTodos = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => setState(() => _showDoneTodos = !_showDoneTodos),
            icon: const Icon(Icons.visibility),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(CreateTodoPage.routeName),
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: TodoList(showDoneTodos: _showDoneTodos),
        ),
      ),
    );
  }
}

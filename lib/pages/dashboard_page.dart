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
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.05),
            child: IconButton(
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              onPressed: () => setState(() => _showDoneTodos = !_showDoneTodos),
              icon: _showDoneTodos
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
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
          width: screenWidth * 0.9,
          child: TodoList(showDoneTodos: _showDoneTodos),
        ),
      ),
    );
  }
}

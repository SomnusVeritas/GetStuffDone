import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../services/todo_provider.dart';

class TodoDetailPage extends StatelessWidget {
  const TodoDetailPage({super.key});

  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final Todo? todo = TodoProvider.selectedTodo;
    if (todo == null) {
      Navigator.of(context).pop();
    }

    final screenWidth = MediaQuery.of(context).size.width;
    todo as Todo;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            Text(
              todo.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              todo.description,
            ),
          ],
        ),
      ),
    );
  }
}

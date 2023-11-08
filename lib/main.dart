import 'package:flutter/material.dart';

import 'pages/todo_create_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/todo_detail_page.dart';
import 'services/dbhelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Stuff Done',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        DashboardPage.routeName: (context) => const DashboardPage(),
        CreateTodoPage.routeName: (context) => const CreateTodoPage(),
        TodoDetailPage.routeName: (context) => const TodoDetailPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/done_page.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/inprogress_page.dart';
import 'package:todo_app/pages/todos_page.dart';
import 'package:todo_app/services/todo_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoService(),
        ),
      ],
      child: MaterialApp(
        title: 'Todo App',
        initialRoute: "home",
        debugShowCheckedModeBanner: false,
        routes: {
          "home": (_) => const HomePage(),
          "todos": (_) => const TodosPage(),
          "inProgress": (_) => const InProgressPage(),
          "done": (_) => const DonePage(),
        },
      ),
    );
  }
}

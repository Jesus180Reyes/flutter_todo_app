import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/services/todo_service.dart';

import '../widgets/task_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Todo Lists"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            TaskCard(
              todos: todos.todos,
              title: 'Todo List',
              route: 'todos',
            ),
            TaskCard(
              todos: todos.inProgress,
              title: 'InProgress List',
              route: 'inProgress',
            ),
            TaskCard(
              todos: todos.dones,
              title: 'Done List',
              route: 'done',
            ),
          ],
        ),
      ),
    );
  }
}

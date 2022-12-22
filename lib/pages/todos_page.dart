import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/services/todo_service.dart';

import '../widgets/tasks_widgets.dart';
import 'nodata_page.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoService>(context).todos;
    final todo = Provider.of<TodoService>(context).inProgress;
    if (todos.isEmpty) return const NoDataPage();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Todo Tasks"),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return TasksWidgets(
            todoList: todo,
            todo: todos[index],
            path: '/inProgress',
          );
        },
      ),
    );
  }
}

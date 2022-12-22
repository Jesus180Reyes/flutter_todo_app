import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/todo_service.dart';
import '../widgets/tasks_widgets.dart';
import 'nodata_page.dart';

class DonePage extends StatelessWidget {
  const DonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoService>(context).dones;
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
            isDeletable: false,
            todo: todos[index],
          );
        },
      ),
    );
  }
}

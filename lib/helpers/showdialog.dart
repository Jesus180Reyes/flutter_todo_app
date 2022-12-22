import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/services/todo_service.dart';

showCustomDialog({required String title, required context}) {
  GlobalKey<FormState> formKey = GlobalKey();
  final todo = Provider.of<TodoService>(context, listen: false);
  final titleController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      actions: [
        MaterialButton(
          disabledColor: Colors.grey,
          color: Colors.indigo,
          textColor: Colors.white,
          onPressed: () async {
            final formState = formKey.currentState;
            if (formState!.validate()) {
              formState.save();
              await todo.postTodo(title: titleController.text.trim());
              await todo.getTodos();
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            }
          },
          child: const Text("Create Task"),
        ),
      ],
      content: Form(
        key: formKey,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 50,
          width: double.infinity,
          child: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: '"Hacer mi tarea"',
              contentPadding: EdgeInsets.all(10),
            ),
            validator: (value) {
              if (titleController.text.isEmpty) return "Ingresa una tarea";
              return null;
            },
            controller: titleController,
          ),
        ),
      ),
    ),
  );
}

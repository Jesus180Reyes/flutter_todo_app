import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/todo_response.dart';

class TasksWidgets extends StatelessWidget {
  final Todo todo;
  const TasksWidgets({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      // TODO: Implement to Assignation to InProgress.
      onTap: () => print("Tapped"),
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade300,
        ),
        height: size.height * 0.1,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: size.width * 0.3,
              child: Text(
                todo.title,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.openSans(),
              ),
            ),
            SizedBox(
              width: size.width * 0.2,
              child: Text(
                "${todo.createdAt.day}/${todo.createdAt.month}/${todo.createdAt.year}",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.openSans(),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_forever_rounded,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

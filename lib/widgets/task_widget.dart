import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/todo_response.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.todos,
    required this.title,
    required this.route,
  }) : super(key: key);

  final List<Todo> todos;
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        height: size.height * 0.3,
        width: size.width,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              width: size.width,
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: size.width,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(10),
              child: Text(
                "Items in a row: ${todos.length}",
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

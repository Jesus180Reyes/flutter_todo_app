// To parse this JSON data, do
//
//     final todosResponse = todosResponseFromJson(jsonString);

import 'dart:convert';

TodosResponse todosResponseFromJson(String str) =>
    TodosResponse.fromJson(json.decode(str));

String todosResponseToJson(TodosResponse data) => json.encode(data.toJson());

class TodosResponse {
  TodosResponse({
    required this.ok,
    required this.total,
    required this.todos,
  });

  final bool ok;
  final int total;
  final List<Todo> todos;

  factory TodosResponse.fromJson(Map<String, dynamic> json) => TodosResponse(
        ok: json["ok"],
        total: json["total"],
        todos: List<Todo>.from(json["todos"].map((x) => Todo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "total": total,
        "todos": List<dynamic>.from(todos.map((x) => x.toJson())),
      };
}

class Todo {
  Todo({
    required this.id,
    required this.title,
    required this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String title;
  final DateTime createdAt;
  final String? updatedAt;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["_id"],
        title: json["title"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt!.toString(),
      };
}

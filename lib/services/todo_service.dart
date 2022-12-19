import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/todo_response.dart';

class TodoService extends ChangeNotifier {
  final _dio = Dio();
  List<Todo> todos = [];
  List<Todo> inProgress = [];
  List<Todo> dones = [];
  TodoService() {
    getTodos();
    getInProgress();
    getDones();
  }
  Future getTodos() async {
    final resp = await _dio.get("http://192.168.0.102:8080/api/todos");
    final todosResponse = TodosResponse.fromJson(resp.data);
    todos = todosResponse.todos;
    notifyListeners();
  }

  Future getInProgress() async {
    final resp = await _dio.get("http://192.168.0.102:8080/api/inProgress");
    print(resp);
    final todosResponse = TodosResponse.fromJson(resp.data);
    inProgress = todosResponse.todos;
    notifyListeners();
  }

  Future getDones() async {
    final resp = await _dio.get("http://192.168.0.102:8080/api/done");
    final todosResponse = TodosResponse.fromJson(resp.data);
    dones = todosResponse.todos;
    notifyListeners();
  }

  Future postTodo({required String title}) async {
    final formData = {"title": title};
    try {
      await _dio.post(
        "http://192.168.0.102:8080/api/todos",
        data: formData,
      );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

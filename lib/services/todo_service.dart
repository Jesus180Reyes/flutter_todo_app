import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/todo_response.dart';

class TodoService extends ChangeNotifier {
  final _dio = Dio();
  bool isLoading = false;
  List<Todo> todos = [];
  List<Todo> inProgress = [];
  List<Todo> dones = [];
  TodoService() {
    getTodos();
    getInProgress();
    getDones();
  }
  Future getTodos() async {
    isLoading = true;
    notifyListeners();
    final resp = await _dio.get("http://192.168.0.103:8080/api/todos");
    final todosResponse = TodosResponse.fromJson(resp.data);
    todos = todosResponse.todos;
    isLoading = false;
    notifyListeners();
  }

  Future getInProgress() async {
    isLoading = true;
    notifyListeners();
    final resp = await _dio.get("http://192.168.0.103:8080/api/inProgress");
    final todosResponse = TodosResponse.fromJson(resp.data);
    inProgress = todosResponse.todos;
    isLoading = false;
    notifyListeners();
  }

  Future getDones() async {
    isLoading = true;
    notifyListeners();
    final resp = await _dio.get("http://192.168.0.103:8080/api/done");
    final todosResponse = TodosResponse.fromJson(resp.data);
    dones = todosResponse.todos;
    isLoading = false;
    notifyListeners();
  }

  Future postTodo({required String title}) async {
    final formData = {"title": title};
    try {
      isLoading = true;
      notifyListeners();
      await _dio.post(
        "http://192.168.0.103:8080/api/todos",
        data: formData,
      );
      isLoading = false;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future deleteTodoById({required String id}) async {
    try {
      isLoading = true;
      notifyListeners();
      await _dio.delete(
        "http://192.168.0.103:8080/api/todos/$id",
      );
      isLoading = false;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future markForwardTodo({required String id, path}) async {
    try {
      isLoading = true;
      notifyListeners();
      await _dio.post(
        "http://192.168.0.103:8080/api$path/$id",
      );
      isLoading = false;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteItemByIdTodos({required Todo todo}) {
    todos.removeWhere((element) => element.id == todo.id);
    notifyListeners();
  }

  deleteItemByIdInProgress({required Todo todo}) {
    inProgress.removeWhere((element) => element.id == todo.id);
    notifyListeners();
  }
}

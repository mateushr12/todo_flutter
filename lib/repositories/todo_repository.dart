import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/todo.dart';

const todoKey = 'todo_list';

class TodoRepository {
  late SharedPreferences sharedPreferences;

  Future<List<Todo>> getListTodo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(todoKey) ?? '[]';
    final List jsonList = jsonDecode(jsonString) as List;
    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }

  void saveTodo(List<Todo> todos) {
    final jsonString = jsonEncode(todos);
    sharedPreferences.setString(todoKey, jsonString);
  }
}

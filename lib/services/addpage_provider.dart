import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPageProvider extends ChangeNotifier {
  TextEditingController todoController = TextEditingController();
  List<Todo> todos = [];
  Future addTodo(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    todos.add(Todo(todo: data));
    prefs.setStringList('todos', todos.map((todo) => todo.todo).toList());
    notifyListeners();
  }

  //get todos
  Future getTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    todos = prefs
        .getStringList('todos')!
        .map((value) => Todo(todo: value))
        .toList();
    notifyListeners();
  }
}

class Todo {
  String todo;
  Todo({required this.todo});
}

import 'package:dnapp/modules/todo/models/todo.dart';
import 'package:dnapp/services/shared_preferences_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

final todoRepository = Provider.autoDispose<TodoRepository>(
  (ref) => TodoRepositoryImpl(read: ref.read),
);

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> saveTodos(List<Todo> todos);
}

class TodoRepositoryImpl implements TodoRepository {
  final Reader read;

  TodoRepositoryImpl({@required this.read});

  final _todoKey = 'todos';

  @override
  Future<List<Todo>> getTodos() async {
    final prefs = read(sharedPreferencesClient);
    final json = await prefs.getJsonList(_todoKey);

    return json.map((e) => Todo.fromJson(e)).toList();
  }

  @override
  Future<void> saveTodos(List<Todo> todos) async {
    final prefs = read(sharedPreferencesClient);
    await prefs.saveJson(_todoKey, todos.map((todo) => todo.toJson()).toList());
  }
}

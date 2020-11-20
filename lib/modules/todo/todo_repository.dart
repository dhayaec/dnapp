import 'package:dnapp/modules/todo/models/todo.dart';
import 'package:dnapp/modules/todo/todo_provider.dart';
import 'package:dnapp/services/shared_preferences_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

final todoRepository = Provider.autoDispose<TodoRepository>(
  (ref) => TodoRepositoryImpl(read: ref.read),
);

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> saveTodos(List<Todo> todos);
  Future<SortOrder> getSortOrder();
  Future<void> saveSortOrder(SortOrder sortOrder);
}

class TodoRepositoryImpl implements TodoRepository {
  final Reader read;

  TodoRepositoryImpl({@required this.read});

  final _todoKey = 'todos';
  final _sortOrder = 'sortOrder';

  @override
  Future<List<Todo>> getTodos() async {
    final prefs = read(sharedPreferencesClient);
    final json = await prefs.getJsonList(key: _todoKey);

    return json.map((e) => Todo.fromJson(e)).toList();
  }

  @override
  Future<void> saveTodos(List<Todo> todos) async {
    final prefs = read(sharedPreferencesClient);
    await prefs.saveJson(
      key: _todoKey,
      json: todos.map((todo) => todo.toJson()).toList(),
    );
  }

  @override
  Future<SortOrder> getSortOrder() async {
    final prefs = read(sharedPreferencesClient);
    final String sortOrder = await prefs.getString(key: _sortOrder);
    return SortOrder.values.firstWhere((e) => e.toString() == sortOrder);
  }

  @override
  Future<void> saveSortOrder(SortOrder sortOrder) async {
    final prefs = read(sharedPreferencesClient);
    await prefs.saveString(key: _sortOrder, value: sortOrder.toString());
  }
}

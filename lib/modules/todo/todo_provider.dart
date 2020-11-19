import 'package:dnapp/modules/todo/models/todo.dart';
import 'package:dnapp/modules/todo/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

enum SortOrder {
  asc,
  desc,
}

final _sortOrder = StateProvider.autoDispose((ref) => SortOrder.asc);
final _todos = StateProvider.autoDispose<List<Todo>>((ref) => []);

final sortedTodos = StateProvider.autoDispose<List<Todo>>((ref) {
  final todos = ref.watch(_todos).state;
  final sortOrder = ref.watch(_sortOrder).state;

  if (sortOrder == SortOrder.asc) {
    todos?.sort((a, b) => a.timestamp.compareTo(b.timestamp));
  } else {
    todos?.sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }
  return todos;
});

final todosViewController = Provider.autoDispose(
  (ref) => TodosViewController(read: ref.read),
);

class TodosViewController {
  final Reader read;
  TodosViewController({@required this.read});

  Future initState() async {
    read(_todos).state = await read(todoRepository).getTodos();
  }

  void dispose() {
    read(_todos).state.clear();
  }

  Future addTodo(TextEditingController controller) async {
    final String text = controller.text;
    if (text.trim().isEmpty) {
      return;
    }
    controller.text = '';
    final now = DateTime.now();
    final savedTodos = read(_todos).state;
    final newTodo = Todo(id: savedTodos.length + 1, title: text, ts: now);
    final todos = read(_todos).state..add(newTodo);
    await read(todoRepository).saveTodos(todos);
    read(_todos).state = todos;
  }

  Future toggleStatus(Todo todo) async {
    final todos = read(_todos).state;
    final idx = todos.indexWhere((elem) => todo.id == elem.id);
    if (idx < 0) {
      return;
    }
    todos[idx] = todo.copyWith(done: !todo.done);
    await read(todoRepository).saveTodos(todos);
    read(_todos).state = todos;
  }

  Future deleteTodo(Todo todo) async {
    final todos = read(_todos).state.where((t) => t.id != todo.id).toList();
    await read(todoRepository).saveTodos(todos);
    read(_todos).state = todos;
  }

  void changeSortOrder() {
    final SortOrder sortOrder = read(_sortOrder).state;
    read(_sortOrder).state =
        sortOrder == SortOrder.asc ? SortOrder.desc : SortOrder.asc;
  }
}

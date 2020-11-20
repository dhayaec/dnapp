import 'package:dnapp/modules/todo/models/todo.dart';
import 'package:dnapp/modules/todo/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

final currentTodo = ScopedProvider<Todo>(null);

class TodoItem extends HookWidget {
  const TodoItem();

  @override
  Widget build(BuildContext context) {
    final todo = useProvider(currentTodo);
    // debugPrint(todo.title);
    return Card(
      child: Dismissible(
        key: Key(todo.id.toString()),
        onDismissed: (direction) {
          FocusScope.of(context).unfocus();
          context.read(todosViewController).deleteTodo(todo);
        },
        child: ListTile(
          title: Text(todo.title),
          leading: Icon(
            Icons.check,
            color: todo.done ? Colors.green : Colors.grey,
          ),
          onTap: () {
            FocusScope.of(context).unfocus();
            context.read(todosViewController).toggleStatus(todo);
          },
        ),
      ),
    );
  }
}

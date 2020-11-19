import 'package:dnapp/modules/todo/models/todo.dart';
import 'package:dnapp/modules/todo/todo_provider.dart';
import 'package:dnapp/modules/todo/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class TodoList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read(todosViewController).initState();
      return context.read(todosViewController).dispose;
    }, []);
    final textController = useTextEditingController();

    final List<Todo> todos = useProvider(sortedTodos).state;

    if (todos == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Todos')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(controller: textController),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.sort),
                    onPressed: () {
                      context.read(todosViewController).changeSortOrder();
                    },
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (_, int idx) => ProviderScope(
                    overrides: [
                      currentTodo.overrideWithValue(todos[idx]),
                    ],
                    child: const TodoItem(),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read(todosViewController).addTodo(textController);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

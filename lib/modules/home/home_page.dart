import 'package:dnapp/modules/home/counter_provider.dart';
import 'package:dnapp/modules/todo/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import "package:velocity_x/velocity_x.dart";

class HomePage extends HookWidget {
  final String title;

  const HomePage({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = useProvider(counterProvider.state);

    final countValue = '${counter.count}'.text.xl5.red500.make();

    return Scaffold(
      appBar: AppBar(
        title: title.text.make(),
      ),
      body: Center(
        child: countValue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.nextPage(TodoList()),
        child: const Icon(Icons.skip_next),
      ),
    );
  }
}

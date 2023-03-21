import 'package:arch2/app/core/shared/services/navigation_service.dart';
import 'package:flutter/material.dart';

import '../reactivities/value_notifiers/states/todo_notifier_state.dart';
import '../reactivities/value_notifiers/todo_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.todoNotifier,
  }) : super(key: key);

  final TodoNotifier todoNotifier;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    widget.todoNotifier.getTodos('abc');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: widget.todoNotifier,
        builder: (_, state, __) {
          if (state is LoadingTodoNotifierState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ErrorTodoNotifierState) {
            return Center(child: Text(state.failure.message));
          }

          final todos = (state as DataTodoNotifierState).todos;
          if (todos.isEmpty) {
            return const Center(child: Text('Insira sua tarefa'));
          }

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos.elementAt(index);

              return ListTile(
                title: Text(todo.name),
                subtitle: Text(todo.description),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          NavigationService.instance.push('/todo/form');
        },
      ),
    );
  }
}

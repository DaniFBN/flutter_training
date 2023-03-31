import 'package:flutter/material.dart';

import '../../../../../../core/shared/services/navigation_service.dart';
import '../stores/states/todo_notifier_state.dart';
import '../stores/todo_notifier.dart';

class HomeNotifierPage extends StatefulWidget {
  const HomeNotifierPage({
    super.key,
    required this.todoNotifier,
  });

  final TodoNotifier todoNotifier;

  @override
  State<HomeNotifierPage> createState() => _HomeNotifierPageState();
}

class _HomeNotifierPageState extends State<HomeNotifierPage> {
  @override
  void initState() {
    super.initState();

    widget.todoNotifier.getTodos('abc');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.runtimeType.toString())),
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
          NavigationService.instance.push('form');
        },
      ),
    );
  }
}

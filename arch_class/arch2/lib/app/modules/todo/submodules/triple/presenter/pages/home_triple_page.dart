import 'package:arch2/app/core/shared/services/navigation_service.dart';
import 'package:arch2/app/modules/todo/presentation/reactivities/triples/todo_triple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../presentation/reactivities/triples/states/todo_triple_state.dart';

class HomeTriplePage extends StatefulWidget {
  const HomeTriplePage({
    Key? key,
    required this.todoTriple,
  }) : super(key: key);

  final TodoTriple todoTriple;

  @override
  State<HomeTriplePage> createState() => _HomeTriplePageState();
}

class _HomeTriplePageState extends State<HomeTriplePage> {
  @override
  void initState() {
    super.initState();

    widget.todoTriple.getTodos('abc');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedBuilder(
        store: widget.todoTriple,
        onError: (_, error) => Center(child: Text('$error')),
        onLoading: (_) => const Center(child: CircularProgressIndicator()),
        onState: (_, TodoTripleState state) {
          final todos = state.todos;
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

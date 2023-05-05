import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/shared/services/navigation_service.dart';
import '../cubits/states/todo_cubit_state.dart';
import '../cubits/todo_cubit.dart';

class HomeCubitPage extends StatefulWidget {
  const HomeCubitPage({
    super.key,
    required this.todoCubit,
  });

  final TodoCubit todoCubit;

  @override
  State<HomeCubitPage> createState() => _HomeCubitPageState();
}

class _HomeCubitPageState extends State<HomeCubitPage> {
  @override
  void initState() {
    super.initState();

    widget.todoCubit.getTodos('abc');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HomeCubitPage',
          semanticsLabel: 'Acessibilidade',
        ),
      ),
      body: BlocBuilder(
        bloc: widget.todoCubit,
        builder: (_, TodoCubitState state) {
          if (state is LoadingTodoCubitState) {
            return Column(
              children: const [
                Text(
                  'HomeCubitPage',
                  semanticsLabel: 'Acessibilidade 1',
                ),
                Center(child: CircularProgressIndicator()),
              ],
            );
          }
          if (state is ErrorTodoCubitState) {
            return Center(child: Text(state.failure.message));
          }

          final todos = (state as DataTodoCubitState).todos;
          if (todos.isEmpty) {
            return const Center(child: Text('Insira sua tarefa'));
          }

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos.elementAt(index);

              return ListTile(
                title: Text(todo.name, semanticsLabel: todo.name),
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

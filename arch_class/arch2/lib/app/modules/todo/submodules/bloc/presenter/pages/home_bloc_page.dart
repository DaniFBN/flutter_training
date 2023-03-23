import 'package:arch2/app/core/shared/services/navigation_service.dart';
import 'package:arch2/app/modules/todo/submodules/bloc/presenter/blocs/events/todo_bloc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/states/todo_bloc_state.dart';
import '../blocs/todo_bloc.dart';

class HomeBlocPage extends StatefulWidget {
  const HomeBlocPage({
    Key? key,
    required this.todoBloc,
  }) : super(key: key);

  final TodoBloc todoBloc;

  @override
  State<HomeBlocPage> createState() => _HomeBlocPageState();
}

class _HomeBlocPageState extends State<HomeBlocPage> {
  @override
  void initState() {
    super.initState();

    widget.todoBloc.add(const GetAllTodoBlocEvent('abc'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.runtimeType.toString())),
      body: BlocBuilder(
        bloc: widget.todoBloc,
        builder: (_, state) {
          if (state is LoadingTodoBlocState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ErrorTodoBlocState) {
            return Center(child: Text(state.failure.message));
          }

          final todos = (state as DataTodoBlocState).todos;
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

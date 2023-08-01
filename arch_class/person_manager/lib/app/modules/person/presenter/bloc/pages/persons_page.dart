import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:person_manager/app/modules/person/presenter/bloc/stores/events/persons_event.dart';
import 'package:person_manager/app/modules/person/presenter/bloc/stores/persons_store.dart';
import 'package:person_manager/app/modules/person/presenter/bloc/stores/states/persons_state.dart';

class PersonsPage extends StatefulWidget {
  const PersonsPage({
    Key? key,
    required this.store,
  }) : super(key: key);

  final PersonsStore store;

  @override
  State<PersonsPage> createState() => _PersonsPageState();
}

class _PersonsPageState extends State<PersonsPage> {
  @override
  void initState() {
    super.initState();

    widget.store.add(const GetPersonsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Pessoas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder(
          bloc: widget.store,
          builder: (_, PersonsState state) {
            Widget body;

            switch (state) {
              case LoadingPersonsState():
                body = const Center(child: CircularProgressIndicator());
              case ErrorPersonsState():
                body = Center(child: Text(state.failure.message));
              case DataPersonsState():
                body = ListView.separated(
                  itemCount: state.persons.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, index) {
                    final person = state.persons.elementAt(index);
                    final telephone = person.telephone;

                    return Card(
                      child: ListTile(
                        isThreeLine: true,
                        title: Text(
                          person.name,
                          style: theme.textTheme.titleLarge,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(person.cpf),
                                Text(
                                  person.birthAt.toString(),
                                  style: theme.textTheme.bodySmall,
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            if (telephone != null) Text(telephone),
                          ],
                        ),
                      ),
                    );
                  },
                );
            }

            return body;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Modular.to.pushNamed('/create'),
        icon: const Icon(Icons.add),
        label: const Text('Adicionar'),
      ),
    );
  }
}

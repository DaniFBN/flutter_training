import 'package:flutter/material.dart';
import 'package:person_manager2/app/presenter/stores/persons_store.dart';
import 'package:person_manager2/app/presenter/stores/states/persons_state.dart';

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

    widget.store.getPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pessoas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ValueListenableBuilder(
          valueListenable: widget.store,
          builder: (_, state, __) {
            late Widget body;

            switch (state) {
              case LoadingPersonsState():
                body = const Center(child: CircularProgressIndicator());
              case ErrorPersonsState():
                body = Center(child: Text(state.exception.message));
              case DataPersonsState():
                body = ListView.separated(
                  itemCount: state.persons.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 4),
                  itemBuilder: (_, index) {
                    final person = state.persons.elementAt(index);

                    return ListTile(title: Text(person.name));
                  },
                );
            }

            return body;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).pushNamed('/create'),
        icon: const Icon(Icons.add),
        label: const Text('Adicionar'),
      ),
    );
  }
}

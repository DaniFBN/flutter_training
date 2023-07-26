import 'package:flutter/material.dart';
import 'package:person_manager2/app/core/services/local_storage/shared_preferences_local_storage_service.dart';
import 'package:person_manager2/app/domain/usecases/create_person_usecase.dart';
import 'package:person_manager2/app/domain/usecases/get_persons_usecase.dart';
import 'package:person_manager2/app/external/person_datasource.dart';
import 'package:person_manager2/app/infra/repositories/person_repository.dart';
import 'package:person_manager2/app/presenter/pages/persons_page.dart';
import 'package:person_manager2/app/presenter/stores/create_person_store.dart';
import 'package:person_manager2/app/presenter/stores/persons_store.dart';

import 'presenter/pages/create_person_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final service = SharedPreferencesLocalStorageService();
    final datasource = PersonDatasource(service);
    final repo = PersonRepository(datasource);
    final createUsecase = CreatePersonUsecase(repo);
    final getUsecase = GetPersonsUsecase(repo);
    final createStore = CreatePersonStore(createUsecase);
    final personsStore = PersonsStore(getUsecase);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => PersonsPage(store: personsStore),
        '/create': (_) => CreatePersonPage(
              store: createStore,
              personsStore: personsStore,
            ),
      },
    );
  }
}

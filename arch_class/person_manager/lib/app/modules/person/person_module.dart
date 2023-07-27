import 'package:flutter_modular/flutter_modular.dart';
import 'package:person_manager/app/modules/person/presenter/pages/create_person_page.dart';
import 'package:person_manager/app/modules/person/presenter/pages/persons_page.dart';

import 'domain/usecases/create_person_usecase.dart';
import 'domain/usecases/get_persons_usecase.dart';
import 'external/person_datasource.dart';
import 'infra/repositories/person_repository.dart';
import 'presenter/stores/create_person_store.dart';
import 'presenter/stores/persons_store.dart';

class PersonModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.lazySingleton((i) => PersonDatasource(i())),
    Bind.lazySingleton((i) => PersonRepository(i())),

    // Usecases
    Bind.lazySingleton((i) => GetPersonsUsecase(i())),
    Bind.lazySingleton((i) => CreatePersonUsecase(i())),

    // Stores
    Bind.lazySingleton((i) => PersonsStore(i())),
    Bind.lazySingleton((i) => CreatePersonStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => PersonsPage(store: Modular.get())),
    ChildRoute(
      '/create',
      child: (_, __) => CreatePersonPage(
        store: Modular.get(),
        personsStore: Modular.get(),
      ),
    ),
  ];
}

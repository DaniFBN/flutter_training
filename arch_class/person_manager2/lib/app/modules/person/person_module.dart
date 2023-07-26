import 'package:flutter_modular/flutter_modular.dart';
import 'package:person_manager2/app/modules/person/domain/usecases/create_person_usecase.dart';
import 'package:person_manager2/app/modules/person/domain/usecases/get_persons_usecase.dart';
import 'package:person_manager2/app/modules/person/external/person_datasource.dart';
import 'package:person_manager2/app/modules/person/infra/repositories/person_repository.dart';
import 'package:person_manager2/app/modules/person/presenter/controllers/create_person_controller.dart';
import 'package:person_manager2/app/modules/person/presenter/pages/create_person_page.dart';
import 'package:person_manager2/app/modules/person/presenter/pages/persons_page.dart';
import 'package:person_manager2/app/modules/person/presenter/stores/create_person_store.dart';
import 'package:person_manager2/app/modules/person/presenter/stores/persons_store.dart';

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

    // Controllers

    Bind.lazySingleton(
      (i) => CreatePersonController(
        createStore: i(),
        personsStore: i(),
        snackBarService: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => PersonsPage(store: Modular.get()),
    ),
    ChildRoute(
      '/create',
      child: (_, __) => CreatePersonPage(controller: Modular.get()),
    )
  ];
}

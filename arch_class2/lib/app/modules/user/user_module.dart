import 'package:arch_class2/app/core/shared/services/local_storage/i_local_storage_service.dart';
import 'package:arch_class2/app/modules/user/presenter/controllers/user_controller.dart';
import 'package:arch_class2/app/modules/user/presenter/pages/home_page.dart';
import 'package:arch_class2/app/modules/user/presenter/pages/home_page_bloc.dart';
import 'package:arch_class2/app/modules/user/presenter/pages/home_page_notifier.dart';
import 'package:arch_class2/app/modules/user/presenter/reatividade/notifier/user_notifier.dart';
import 'package:arch_class2/app/modules/user/presenter/reatividade/triple/user_triple.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/create_user_result_usecase.dart';
import 'domain/usecases/create_user_usecase.dart';
import 'domain/usecases/get_users_usecase.dart';
import 'external/create_user_datasource.dart';
import 'external/get_users_datasource.dart';
import 'infra/repositories/create_user_repository.dart';
import 'infra/repositories/create_user_result_repository.dart';
import 'infra/repositories/get_users_repository.dart';
import 'presenter/pages/home_page_triple.dart';
import 'presenter/reatividade/blocs/user_form_bloc.dart';
import 'presenter/reatividade/blocs/users_bloc.dart';

class UserModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    // CreateUser
    Bind.factory((i) => CreateUserDatasourceImpl(localStorageService: i())),

    // CreateUserEither
    Bind.factory((i) => CreateUserRepositoryImpl(i())),
    Bind.factory((i) => CreateUserUsecaseImpl(i())),

    // CreateUserResult
    Bind.factory((i) => CreateUserResultRepositoryImpl(i())),
    Bind.factory((i) => CreateUserResultUsecaseImpl(i())),

    // GetUsers
    Bind.factory((i) => GetUsersDatasourceImpl(localStorageService: i())),
    Bind.factory((i) => GetUsersRepositoryImpl(i())),
    Bind.factory((i) => GetUsersUsecaseImpl(i())),

    // Reactivities
    Bind.lazySingleton<UserFormBloc>(
      (i) => UserFormBloc(
        createUserResultUsecase: i(),
        createUserUsecase: i(),
      ),
      onDispose: (value) => value.close(),
    ),
    Bind.lazySingleton<UsersBloc>(
      (i) => UsersBloc(getUsersUsecase: i()),
      onDispose: (value) => value.close(),
    ),
    Bind.lazySingleton<UserNotifier>(
      (i) => UserNotifier(createUserUsecase: i()),
      onDispose: (value) => value.dispose(),
    ),
    Bind.lazySingleton<UserTriple>(
      (i) => UserTriple(createUserUsecase: i()),
      onDispose: (value) => value.destroy(),
    ),

    // Controller
    Bind.lazySingleton<UserController>(
      (i) => UserController(formBloc: i(), usersBloc: i()),
      onDispose: (value) => value.dispose(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/home',
      child: (_, __) => HomePage(
        localStorageService: Modular.get<ILocalStorageService>(),
      ),
    ),
    ChildRoute(
      '/bloc',
      child: (_, __) => HomePageBloc(
        userController: Modular.get<UserController>(),
      ),
    ),
    ChildRoute(
      '/notifier',
      child: (context, __) => HomePageNotifier(
        userNotifier: context.read<UserNotifier>(),
      ),
    ),
    ChildRoute(
      '/triple',
      child: (_, __) => HomePageTriple(
        userTriple: Modular.get<UserTriple>(),
      ),
    ),
  ];
}

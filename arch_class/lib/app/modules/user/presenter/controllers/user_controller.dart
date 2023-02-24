// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:arch_class2/app/modules/user/domain/helpers/params.dart';
import 'package:arch_class2/app/modules/user/presenter/reatividade/blocs/events/user_form_events.dart';
import 'package:arch_class2/app/modules/user/presenter/reatividade/blocs/events/users_events.dart';
import 'package:arch_class2/app/modules/user/presenter/reatividade/blocs/states/user_form_state.dart';
import 'package:arch_class2/app/modules/user/presenter/reatividade/blocs/user_form_bloc.dart';
import 'package:arch_class2/app/modules/user/presenter/reatividade/blocs/users_bloc.dart';

class UserController {
  final UserFormBloc formBloc;
  final UsersBloc usersBloc;

  late final StreamSubscription _formSubscription;

  UserController({
    required this.formBloc,
    required this.usersBloc,
  }) {
    _formSubscription = formBloc.stream.listen((event) {
      if (event is SuccessUserFormState) {
        loadUsers();
      }
    });
  }

  void createUser(CreateUserParam param) {
    formBloc.add(CreateUserEvent(param));
  }

  void loadUsers() {
    usersBloc.add(const GetUsersEvent());
  }

  dispose() {
    _formSubscription.cancel();
  }
}

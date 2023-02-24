import 'package:flutter/cupertino.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/helpers/params.dart';
import '../../../domain/usecases/create_user_usecase.dart';
import 'user_state.dart';

class UserNotifier extends ValueNotifier<UserState> {
  final ICreateUserUsecase _createUserUsecase;
  UserNotifier({
    required ICreateUserUsecase createUserUsecase,
  })  : _createUserUsecase = createUserUsecase,
        super(const InitialUserState());

  void createUser(CreateUserParam param) async {
    final currentState = value;
    List<UserEntity> users = [];

    if (currentState is SuccessUserState) {
      users = currentState.users;
    }

    value = const LoadingUserState();

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createUserUsecase(param);
    result.fold(
      (l) {
        value = ErrorUserState(l);
      },
      (r) {
        users.add(r);
        value = SuccessUserState(users);
      },
    );
  }
}

import 'package:arch_class2/app/core/interfaces/usecase_interfaces.dart';
import 'package:arch_class2/app/modules/user/domain/usecases/get_users_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/users_events.dart';
import 'states/users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final IGetUsersUsecase _getUsersUsecase;

  UsersBloc({
    required IGetUsersUsecase getUsersUsecase,
  })  : _getUsersUsecase = getUsersUsecase,
        super(const InitialUsersState()) {
    on<GetUsersEvent>(_getUsers);
  }

  void _getUsers(GetUsersEvent event, Emitter<UsersState> emit) async {
    emit(const LoadingUsersState());

    await Future.delayed(const Duration(seconds: 2));

    final result = await _getUsersUsecase(const NoParams());

    result.fold(
      (success) {
        emit(SuccessUsersState(success));
      },
      (failure) {
        emit(ErrorUsersState(failure));
      },
    );
  }
}

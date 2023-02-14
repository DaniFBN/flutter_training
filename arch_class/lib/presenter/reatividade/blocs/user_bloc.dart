// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arch_class/domain/entities/user_entity.dart';
import 'package:arch_class/domain/usecases/create_user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/create_user_result_usecase.dart';
import 'events/user_events.dart';
import 'states/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ICreateUserUsecase _createUserUsecase;
  final ICreateUserResultUsecase _createUserResultUsecase;

  UserBloc({
    required ICreateUserUsecase createUserUsecase,
    required ICreateUserResultUsecase createUserResultUsecase,
  })  : _createUserUsecase = createUserUsecase,
        _createUserResultUsecase = createUserResultUsecase,
        super(const InitialUserState()) {
    on<CreateUserEvent>(_createUserResult);
  }

  void _createUser(CreateUserEvent event, Emitter<UserState> emit) async {
    final currentState = state;
    List<UserEntity> users = [];

    if (currentState is SuccessUserState) {
      users = currentState.users;
    }

    emit(const LoadingUserState());

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createUserUsecase(event.createUserParam);
    result.fold(
      (l) {
        emit(ErrorUserState(l));
      },
      (r) {
        users.add(r);
        emit(SuccessUserState(users));
      },
    );
  }

  void _createUserResult(CreateUserEvent event, Emitter<UserState> emit) async {
    final currentState = state;
    List<UserEntity> users = [];

    if (currentState is SuccessUserState) {
      users = currentState.users;
    }

    emit(const LoadingUserState());

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createUserResultUsecase(event.createUserParam);
    result.fold(
      (success) {
        users.add(success);
        emit(SuccessUserState(users));
      },
      (failure) {
        emit(ErrorUserState(failure));
      },
    );
  }
}

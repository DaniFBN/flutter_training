import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/create_user_result_usecase.dart';
import '../../../domain/usecases/create_user_usecase.dart';
import 'events/user_form_events.dart';
import 'states/user_form_state.dart';

class UserFormBloc extends Bloc<UserFormEvent, UserFormState> {
  final ICreateUserUsecase _createUserUsecase;
  final ICreateUserResultUsecase _createUserResultUsecase;

  UserFormBloc({
    required ICreateUserUsecase createUserUsecase,
    required ICreateUserResultUsecase createUserResultUsecase,
  })  : _createUserUsecase = createUserUsecase,
        _createUserResultUsecase = createUserResultUsecase,
        super(const InitialUserFormState()) {
    on<CreateUserEvent>(_createUserResult);
  }

  void _createUser(CreateUserEvent event, Emitter<UserFormState> emit) async {
    final currentState = state;
    List<UserEntity> users = [];

    if (currentState is SuccessUserFormState) {
      users = currentState.users;
    }

    emit(const LoadingUserFormState());

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createUserUsecase(event.createUserParam);
    result.fold(
      (l) {
        emit(ErrorUserFormState(l));
      },
      (r) {
        users.add(r);
        emit(SuccessUserFormState(users));
      },
    );
  }

  void _createUserResult(CreateUserEvent event, Emitter<UserFormState> emit) async {
    final currentState = state;
    List<UserEntity> users = [];

    if (currentState is SuccessUserFormState) {
      users = currentState.users;
    }

    emit(const LoadingUserFormState());

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createUserResultUsecase(event.createUserParam);

    result.fold(
      (success) {
        users.add(success);
        emit(SuccessUserFormState(users));
      },
      (failure) {
        emit(ErrorUserFormState(failure));
      },
    );
  }
}

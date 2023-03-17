import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_events.dart';
import 'user_states.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const InitialUserState()) {
    on<LoadUserEvent>(_load);
  }

  Future<void> _load(LoadUserEvent event, Emitter<UserState> emit) async{
    emit(const LoadingUserState());

    await Future.delayed(const Duration(seconds: 2));

    emit(const SuccessUserState());
  }
}
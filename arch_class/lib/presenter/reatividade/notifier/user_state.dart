import 'package:arch_class/app_exception.dart';
import 'package:arch_class/domain/entities/user_entity.dart';

abstract class UserState {
  const UserState();
}

class InitialUserState extends UserState {
  const InitialUserState();
}

class LoadingUserState extends UserState {
  const LoadingUserState();
}

class ErrorUserState extends UserState {
  final AppException error;

  const ErrorUserState(this.error);
}

class SuccessUserState extends UserState {
  final List<UserEntity> users;

  const SuccessUserState(this.users);
}

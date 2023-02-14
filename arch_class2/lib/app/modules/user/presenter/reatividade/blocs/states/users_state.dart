
import '../../../../../../core/shared/exceptions/app_exception.dart';
import '../../../../domain/entities/user_entity.dart';

abstract class UsersState {
  const UsersState();
}

class InitialUsersState extends UsersState {
  const InitialUsersState();
}

class LoadingUsersState extends UsersState {
  const LoadingUsersState();
}

class ErrorUsersState extends UsersState {
  final AppException error;

  const ErrorUsersState(this.error);
}

class SuccessUsersState extends UsersState {
  final List<UserEntity> users;

  const SuccessUsersState(this.users);
}

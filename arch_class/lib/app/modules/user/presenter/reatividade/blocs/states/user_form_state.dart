
import '../../../../../../core/shared/exceptions/app_exception.dart';
import '../../../../domain/entities/user_entity.dart';

abstract class UserFormState {
  const UserFormState();
}

class InitialUserFormState extends UserFormState {
  const InitialUserFormState();
}

class LoadingUserFormState extends UserFormState {
  const LoadingUserFormState();
}

class ErrorUserFormState extends UserFormState {
  final AppException error;

  const ErrorUserFormState(this.error);
}

class SuccessUserFormState extends UserFormState {
  final List<UserEntity> users;

  const SuccessUserFormState(this.users);
}

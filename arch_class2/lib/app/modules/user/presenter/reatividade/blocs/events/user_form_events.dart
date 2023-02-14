
import '../../../../domain/helpers/params.dart';

abstract class UserFormEvent {
  const UserFormEvent();
}

class CreateUserEvent extends UserFormEvent {
  final CreateUserParam createUserParam;

  const CreateUserEvent(this.createUserParam);
}

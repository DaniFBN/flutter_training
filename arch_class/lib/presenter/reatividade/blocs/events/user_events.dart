import 'package:arch_class/domain/helpers/params.dart';

abstract class UserEvent {
  const UserEvent();
}

class CreateUserEvent extends UserEvent {
  final CreateUserParam createUserParam;

  const CreateUserEvent(this.createUserParam);
}

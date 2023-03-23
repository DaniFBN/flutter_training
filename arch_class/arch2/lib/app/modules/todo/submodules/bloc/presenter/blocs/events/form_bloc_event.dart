import '../../../../../domain/params/params.dart';

abstract class FormBlocEvent {
  const FormBlocEvent();
}

class CreateTodoFormBlocEvent extends FormBlocEvent {
  final CreateTodoParam param;

  const CreateTodoFormBlocEvent(this.param);
}

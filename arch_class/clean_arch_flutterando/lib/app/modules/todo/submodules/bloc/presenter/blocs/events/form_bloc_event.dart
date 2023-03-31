import '../../../../../domain/params/params.dart';

abstract class FormBlocEvent {
  const FormBlocEvent();
}

class CreateTodoFormBlocEvent extends FormBlocEvent {
  const CreateTodoFormBlocEvent(this.param);
  final CreateTodoParam param;
}

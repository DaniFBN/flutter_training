import 'package:arch2/app/modules/todo/domain/failures/failures.dart';

abstract class FormBlocState {
  const FormBlocState();
}

class InitialFormBlocState extends FormBlocState {
  const InitialFormBlocState();
}

class ErrorFormBlocState extends FormBlocState {
  final TodoFailure failure;

  const ErrorFormBlocState(this.failure);
}

class LoadingFormBlocState extends FormBlocState {
  const LoadingFormBlocState();
}

class SuccessFormBlocState extends FormBlocState {
  const SuccessFormBlocState();
}

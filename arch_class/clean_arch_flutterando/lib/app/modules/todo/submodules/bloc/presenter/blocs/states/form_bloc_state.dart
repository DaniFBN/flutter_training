import '../../../../../domain/failures/failures.dart';

abstract class FormBlocState {
  const FormBlocState();
}

class InitialFormBlocState extends FormBlocState {
  const InitialFormBlocState();
}

class ErrorFormBlocState extends FormBlocState {
  const ErrorFormBlocState(this.failure);
  final TodoFailure failure;
}

class LoadingFormBlocState extends FormBlocState {
  const LoadingFormBlocState();
}

class SuccessFormBlocState extends FormBlocState {
  const SuccessFormBlocState();
}

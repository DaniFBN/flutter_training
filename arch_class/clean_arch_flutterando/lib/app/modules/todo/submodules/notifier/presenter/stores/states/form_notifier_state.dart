import '../../../../../domain/failures/failures.dart';

abstract class FormNotifierState {
  const FormNotifierState();
}

class InitialFormNotifierState extends FormNotifierState {
  const InitialFormNotifierState();
}

class ErrorFormNotifierState extends FormNotifierState {
  const ErrorFormNotifierState(this.failure);
  final TodoFailure failure;
}

class LoadingFormNotifierState extends FormNotifierState {
  const LoadingFormNotifierState();
}

class SuccessFormNotifierState extends FormNotifierState {
  const SuccessFormNotifierState();
}

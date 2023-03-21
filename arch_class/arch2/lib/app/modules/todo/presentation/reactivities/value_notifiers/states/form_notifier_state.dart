import 'package:arch2/app/modules/todo/domain/failures/failures.dart';

abstract class FormNotifierState {
  const FormNotifierState();
}

class InitialFormNotifierState extends FormNotifierState {
  const InitialFormNotifierState();
}

class ErrorFormNotifierState extends FormNotifierState {
  final TodoFailure failure;

  const ErrorFormNotifierState(this.failure);
}

class LoadingFormNotifierState extends FormNotifierState {
  const LoadingFormNotifierState();
}

class SuccessFormNotifierState extends FormNotifierState {
  const SuccessFormNotifierState();
}

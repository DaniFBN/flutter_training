import '../../../../../domain/failures/failures.dart';

abstract class FormCubitState {
  const FormCubitState();
}

class InitialFormCubitState extends FormCubitState {
  const InitialFormCubitState();
}

class ErrorFormCubitState extends FormCubitState {
  const ErrorFormCubitState(this.failure);
  final TodoFailure failure;
}

class LoadingFormCubitState extends FormCubitState {
  const LoadingFormCubitState();
}

class SuccessFormCubitState extends FormCubitState {
  const SuccessFormCubitState();
}

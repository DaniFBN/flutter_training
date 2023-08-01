import 'package:person_manager/app/core/failures/app_failure.dart';

sealed class CreatePersonState {
  const CreatePersonState();
}

class InitialCreatePersonState extends CreatePersonState {
  const InitialCreatePersonState();
}

class LoadingCreatePersonState extends CreatePersonState {
  const LoadingCreatePersonState();
}

class SuccessCreatePersonState extends CreatePersonState {
  const SuccessCreatePersonState();
}

class ErrorCreatePersonState extends CreatePersonState {
  final AppFailure failure;

  const ErrorCreatePersonState(this.failure);
}

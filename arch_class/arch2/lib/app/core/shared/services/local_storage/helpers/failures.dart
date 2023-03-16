import 'package:arch2/app/core/shared/interfaces/app_failure.dart';

abstract class LocalStorageFailure extends AppFailure {
  LocalStorageFailure(super.message, {super.stackTrace});
}

class CreateLocalStorageFailure extends LocalStorageFailure {
  CreateLocalStorageFailure(super.message, {super.stackTrace});
}

import 'package:person_manager/core/failures/app_failure.dart';

final class ValidationFailure extends AppFailure {
  ValidationFailure(super.message, {super.stackTrace});
}

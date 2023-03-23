import 'package:arch2/app/core/shared/interfaces/app_failure.dart';
import 'package:arch2/app/modules/todo/domain/failures/failures.dart';

abstract class TodoFailure extends AppFailure {
  TodoFailure(super.message, {super.stackTrace});

  
}

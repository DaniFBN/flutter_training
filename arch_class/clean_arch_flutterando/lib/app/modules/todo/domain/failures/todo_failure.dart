import '../../../../core/shared/interfaces/app_failure.dart';

abstract class TodoFailure extends AppFailure {
  TodoFailure(super.message, {super.stackTrace});
}

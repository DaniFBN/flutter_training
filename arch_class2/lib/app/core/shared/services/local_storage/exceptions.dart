import 'package:arch_class2/app/core/shared/exceptions/app_exception.dart';

class LocalStorageException extends AppException {
  LocalStorageException(super.message, {required super.stackTrace});
}

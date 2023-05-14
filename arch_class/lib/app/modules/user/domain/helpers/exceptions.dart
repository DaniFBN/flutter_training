
import '../../../../core/shared/exceptions/app_exception.dart';


class UserException extends AppException {
  const UserException(super.message, {required super.stackTrace});
}

class ValidateException extends UserException {
  const ValidateException(super.message, {required super.stackTrace});
}

class MapperException extends UserException {
  const MapperException(super.message, {required super.stackTrace});
}

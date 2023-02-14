import 'package:arch_class/app_exception.dart';

class ValidateException extends AppException {
  const ValidateException(super.message, {required super.stackTrace});
}

class MapperException extends AppException {
  const MapperException(super.message, {required super.stackTrace});
}

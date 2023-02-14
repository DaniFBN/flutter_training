import 'package:result_dart/result_dart.dart';

import '../../../../core/shared/exceptions/app_exception.dart';
import '../entities/user_entity.dart';

abstract class IGetUsersRepository {
  AsyncResult<List<UserEntity>, AppException> getUsers();
}

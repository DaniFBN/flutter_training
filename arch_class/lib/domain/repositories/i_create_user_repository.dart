import 'package:arch_class/domain/entities/user_entity.dart';
import 'package:arch_class/domain/helpers/params.dart';

abstract class ICreateUserRepository {
  Future<UserEntity> createUser(CreateUserParam param);
}
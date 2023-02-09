import 'package:arch_class/domain/entities/user_entity.dart';
import 'package:arch_class/domain/helpers/params.dart';

abstract class IUserRepository { 
  Future<UserEntity> createUser(CreateUserParam param);
  Future<UserEntity> updateUser(CreateUserParam param);
  Future<UserEntity> deleteUser(CreateUserParam param);
}

abstract class IGetUserRepository { 
  Future<UserEntity> getUserByID(CreateUserParam param);
  Future<UserEntity> getAll(CreateUserParam param);
  Future<UserEntity> getUserByName(CreateUserParam param);
}
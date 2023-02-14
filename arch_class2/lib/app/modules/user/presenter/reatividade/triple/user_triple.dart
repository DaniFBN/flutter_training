import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/shared/exceptions/app_exception.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/helpers/params.dart';
import '../../../domain/usecases/create_user_usecase.dart';

class UserTriple extends NotifierStore<AppException, List<UserEntity>> {
  final ICreateUserUsecase _createUserUsecase;

  UserTriple({
    required ICreateUserUsecase createUserUsecase,
  })  : _createUserUsecase = createUserUsecase,
        super([]);

  void createUser(CreateUserParam param) async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createUserUsecase(param);
    result.fold(
      setError,
      (r) {
        update([...state, r]);
      },
    );

    setLoading(false);
  }
}

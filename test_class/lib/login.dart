import 'repositories/auth_repository.dart';

class Login {
  final IAuthRepository authRepository;

  const Login(this.authRepository);

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    if (!email.contains('@')) {
      return 'Email inválido';
    }
    if (password.length < 8) {
      return 'Senha inválida';
    }

    final result = await authRepository.login(email: email, password: password);

    return result;
  }

  Future<String?> loginParam({
    required String email,
    required String password,
  }) async {
    final param = LoginParam(email, password);
    print('IMPL ${param.hashCode}');

    final result = await authRepository.loginParam(param);

    return result;
  }

  Future<String?> loginParamNamed({
    required String email,
    required String password,
  }) async {
    final param = LoginParam(email, password);
    print('IMPL ${param.hashCode}');

    final result = await authRepository.loginParamNamed(param: param);

    return result;
  }
}

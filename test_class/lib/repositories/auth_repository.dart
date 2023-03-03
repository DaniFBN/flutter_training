abstract class IAuthRepository {
  Future<String?> login({required String email, required String password});
  Future<String?> loginParam(LoginParam param);
}

class LoginParam {
  final String email;
  final String password;

  LoginParam(this.email, this.password);
}

class AuthRepository implements IAuthRepository{
  const AuthRepository();

  @override
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    bool validCredentials = false;

    await Future.delayed(const Duration(seconds: 1));

    for (var login in _validLogins) {
      final email = login['email'];
      final password = login['password'];

      if (email == email && password == password) {
        validCredentials = true;
        break;
      }
    }

    if (validCredentials) return null;

    return 'Credencial inválida';
  }
  
  @override
  Future<String?> loginParam(LoginParam param) {
    throw UnimplementedError();
  }
}

final _validLogins = [
  {
    'email': 'whatever@test.com',
    'password': 12345678,
  },
  {
    'email': 'whatever1@test.com',
    'password': 123456789,
  },
  {
    'email': 'whatever2@test.com',
    'password': 123456781,
  },
  {
    'email': 'whatever3@test.com',
    'password': 123456782,
  },
  {
    'email': 'whatever4@test.com',
    'password': 123456783,
  }
];

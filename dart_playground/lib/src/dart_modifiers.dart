void dartModifiers() {
  const constVar1 = <String, String>{}; // Não muda desde a compilação
  const Map constVar2 = {}; // Não muda desde a compilação

  final finalVar1 = 3; // Não muda desde a execução
  final int finalVar2 = 3; // Não muda desde a execução

  var varVar = 3; // Mutável
  var varVar2; // Não faça isso, tipe

  // Static
  final staticVar = UserModel.getUsers();

  final int lateVar1;
  late final lateVar2 = 32; // Não tem sentido
  late int? lateVar3; // Não tem sentido
  lateVar3 = null;
}

int sum(int value1, int value2) {
  const result2 = 20 + 20; // 20 e 20 são constantes
  final result = value1 + value2; // Value1 e value2 são definidos em tempo de execução

  return result;
}

class UserModel {
  // Late
  late final String name;

  UserModel() {
    name = '';
  }

  static List<UserModel> getUsers() {
    final response = <UserModel>[];
    return response;
  }
}

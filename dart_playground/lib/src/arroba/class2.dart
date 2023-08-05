class Class2 {
  Future posicional(String name, int b) async {
    return true;
  }

  Future nomeado({required String name, int? b, double c = 3.3}) async {
    return true;
  }

  Future opcional([String? name, int? b, double c = 3.3]) async {
    return true;
  }
}

// Posicional = Não é nomeado ou opcional
// Nomeado = {}
// Opcional = []

void main() {
  Class2().posicional('', 3);
  Class2().nomeado(b: 3, name: '');
  Class2().nomeado(name: '');
  Class2().opcional('');
}

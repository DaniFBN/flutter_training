// ISP - Interface Segregation

abstract class CLT {}

abstract class FinanceiroClt {
  void pagarFGTS();
  void pagar13();
  void pagarBeneficios();
  double pagarSalario();
}

abstract class RhClt {
  void darFerias();
  void baterPonto();
}

class CoopertecCLT implements CLT {
  @override
  void darFerias() {}

  @override
  double pagarSalario() {
    final currentDay = DateTime.now().day;
    if (currentDay == 5 || currentDay == 20) {
      return 50000;
    }

    return 0;
  }
}

class FTeamCLT implements CLT {
  @override
  void darFerias() {}

  @override
  double pagarSalario() {
    final currentDay = DateTime.now().day;
    if (currentDay == 1) {
      return 500;
    }

    return 0;
  }
}

abstract class Empresa {}

abstract class MeEmpresa implements Empresa {
  Contador get contador;
}

class Coopertec implements MeEmpresa {
  @override
  Contador get contador => throw UnimplementedError();
}

abstract class Contador {
  void pagarTributos();
}

abstract class MeiEmpresa implements Empresa {}

void main() {
  Coopertec().contador.pagarTributos();
}

class AccountBank {
  final double _balance;

  AccountBank({required double balance}) : _balance = balance;
}

class AccountBank2 {
  late final double _balance;

  AccountBank2({double? balance}) {
    _balance = balance ?? 0.0;

    double newBalance = 0.0;
    if (balance != null) newBalance = balance;
    _balance = newBalance;

    if (balance != null) {
      _balance = balance;
    } else {
      _balance = 0.0;
    }
  }
}

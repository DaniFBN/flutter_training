class Class {
  final DateTime birth;
  final int _age;

  Class(this.birth) : _age = DateTime.now().year - birth.year {
    print(this);
  }

  Class.nomeado(this.birth) : _age = DateTime.now().year - birth.year;

  factory Class.nomeadoFactory() {
    return Class(DateTime.now());
  }
}

class Datasource {
  final String _service;

  Datasource({required String service}) : _service = service;
}

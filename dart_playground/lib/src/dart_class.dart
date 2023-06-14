// ignore_for_file: public_member_api_docs, sort_constructors_first

void dartClass() {
  final class1Var = Class1();

  final userModelPos1 = UserModel.posicional('Daniel', 23, 'SP');
  final userModelPos2 = UserModel.posicional('Daniel', 23, null);

  final userModelPosOpt1 = UserModel.posicionalComOpcional('Daniel', 23);
  final userModelPosNom1 =
      UserModel.posicionalComNomeado('Daniel', 23, city: 'SP');

  final userModelOpt1 = UserModel.opcional('Daniel', 23, 'SP');
  final userModelOpt2 = UserModel.opcional('Daniel', 23);
  final userModelOpt3 = UserModel.opcional();

  final userModelNom1 = UserModel.nomeado(city: 'SP', name: 'Daniel', age: 23);
  final userModelNom2 = UserModel.nomeado(name: 'Daniel', age: 23);

  final userModelFromMap1 = UserModel.fromMap({'name': 'Daniel', 'age': 23});
  final userModels = UserModel.fromListMap({'name': 'Daniel', 'age': 23});

  final getterSetter = GetterSetter(name: 'Daniel', age: 23);
  print(getterSetter.name);
  // A privação ocorre por arquivo, não classe
  print(getterSetter._name);
  print(getterSetter.age);

  getterSetter.name = 'Daniel Fernandes';
  getterSetter.age = 24;

  print(getterSetter.name);
  print(getterSetter.age);
}

final class Class1 extends Class2
    with Mixin1, Mixin2
    implements Class3, Class4 {}

class Class21 with Mixin1 {}

base class Class2 {}

abstract interface class Class3 {}

abstract interface class Class4 {}

mixin Mixin1 {}

base mixin Mixin2 on Class2 {}

abstract class AbstractClass {}

abstract interface class InterfaceClass {}

class UserModel {
  final String name;
  late final int yearBirth;
  final int age;
  final DateTime? date;
  final String? city;

  // Construtor com parâmetro posicional
  UserModel.posicional(this.name, this.age, this.city)
      : yearBirth = 2023 - age,
        date = null;

  // É possível juntar os tipos de parâmetro
  UserModel.posicionalComOpcional(this.name, this.age, [this.city])
      : yearBirth = 2023 - age,
        date = null;
  UserModel.posicionalComNomeado(this.name, this.age, {this.city})
      : yearBirth = 2023 - age,
        date = null;

  // Construtor com parâmetro opcional - Uso de '[]'
  UserModel.opcional([this.name = '', this.age = 0, this.city]) : date = null {
    // Ja foi construído
    yearBirth = 2023 - age;
  }

  // Construtor com parâmetro nomeado - Uso de '{}'
  UserModel.nomeado({
    required this.name,
    required this.age,
    this.city,
    this.date,
  }) : yearBirth = 99;

  // Factory
  factory UserModel.fromMap(Map<String, dynamic> map) {
    DateTime? date;
    if (map['date'] != null) {
      date = DateTime.fromMillisecondsSinceEpoch(map['date']);
    }

    return UserModel.nomeado(
      age: map['age'],
      name: map['name'],
      city: map['city'],
      date: date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'city': city,
    };
  }

  static List<UserModel> fromListMap(Map<String, dynamic> map) {
    return [
      UserModel.nomeado(
        age: map['age'],
        name: map['name'],
        city: map['city'],
      ),
    ];
  }

  void get({String unidadeDeMedida = 'kg'}) {}

  String getName() {
    return name;
  }

  String asasas(String whatever) {
    print(name);
    print(whatever);

    return '';
  }

  // JAVA
  // UserModel(String name, int age, String? city) {
  //   this.name = name;
  //   this.age = age;
  //   this.city = city;
  // }
}

class GetterSetter {
  String _name;
  int age;

  GetterSetter({required String name, required this.age}) : _name = name;

  String get name => _name;
  set name(String value) {
    if (value.isEmpty) return;
    _name = value;
  }

  void setName(String value) {
    if (value.isEmpty) return;
    _name = value;
  }
}

class SuperClass extends SuperClassExtends {
  final String name;

  const SuperClass.dartPre_2_16({
    required this.name,
    required String description,
    required String content,
  }) : super(description: description, content: content);

  const SuperClass.dartPos_2_17({
    required this.name,
    required super.description,
    required super.content,
  });

  void test() {
    super.whateverSuper(); // > Pai
    whateverSuper(); // > Pai e Sobrescrito
  }

  @override
  void whateverSuper() {
    super.whateverSuper();

    print('sobrescrito');
  }
}

class SuperClassExtends extends SuperClassExtendsExtends {
  final String description;

  const SuperClassExtends({
    // Open Parametro nomeado

    required this.description,
    required super.content,
  } // Close Parametro nomeado
      );

  void whateverSuper() {
    print('pai');
  }
}

class SuperClassExtendsExtends {
  final String content;

  const SuperClassExtendsExtends({required this.content});
}


// -----------------------------------------------------------------------------
// Erro de Mixin
// -----------------------------------------------------------------------------

// class Class2 extends Class2 with Mixin2 implements Class3, Class4 {} Erro
// mixin Mixin2 on Class3 {}

// class MyWidget extends StatefulWidget {
//   final MyWidget({super.key});

// -----------------------------------------------------------------------------
// Exemplo de Mixin no Flutter
// -----------------------------------------------------------------------------

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }
//
// class _MyWidgetState extends State<MyWidget> with LifeCycle<MyWidget>{
//   @override
//   Widget build(BuildContext context) {
//     return final Placeholder();
//   }
// }
//
// mixin LifeCycle<T extends StatefulWidget> on State<T> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }

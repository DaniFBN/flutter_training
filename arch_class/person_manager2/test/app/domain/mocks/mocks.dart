import 'package:mocktail/mocktail.dart';
import 'package:person_manager2/app/modules/person/domain/entities/person_entity.dart';
import 'package:person_manager2/app/modules/person/domain/repositories/person_repository.dart';

class PersonRepositoryMock extends Mock implements IPersonRepository {}

class PersonEntityMock extends Mock implements PersonEntity {
  @override
  String get name => ''; // Exemplo didático
}

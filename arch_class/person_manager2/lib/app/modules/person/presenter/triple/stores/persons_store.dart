import 'package:flutter_triple/flutter_triple.dart';
import 'package:person_manager2/app/modules/person/domain/usecases/get_persons_usecase.dart';

import '../../../domain/entities/person_entity.dart';

class PersonsStore extends Store<List<PersonEntity>> {
  PersonsStore(this._getPersonsUsecase) : super([]) {
    print(hashCode);
  }

  final IGetPersonsUsecase _getPersonsUsecase;

  Future<void> getPersons() async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 2));

    final result = await _getPersonsUsecase();

    result.fold(update, setError);
  }
}

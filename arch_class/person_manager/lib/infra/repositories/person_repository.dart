import 'package:person_manager/core/failures/app_failure.dart';
import 'package:person_manager/domain/params/create_person_param.dart';
import 'package:person_manager/domain/repositories/person_repository.dart';
import 'package:person_manager/domain/responses/create_person_response.dart';
import 'package:person_manager/infra/mappers/person_mapper.dart';

import '../datasources/person_datasource.dart';

class PersonRepository implements IPersonRepository {
  final IPersonDatasource _datasource;

  const PersonRepository(this._datasource);

  @override
  Future<CreatePersonResponse> create(CreatePersonParam param) async {
    try {
      final data = PersonMapper.createParamToMap(param);
      final result = await _datasource.create(data);

      return result;
    } on AppFailure {
      rethrow;
    }
  }
}

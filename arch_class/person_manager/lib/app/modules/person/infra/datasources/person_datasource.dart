import 'package:person_manager/app/modules/person/domain/responses/create_person_response.dart';

abstract interface class IPersonDatasource {
  Future<CreatePersonResponse> create(Map<String, dynamic> data);
  Future<List<Map<String, dynamic>>> getPersons();
}

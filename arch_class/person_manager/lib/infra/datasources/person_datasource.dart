import 'package:person_manager/domain/responses/create_person_response.dart';

abstract interface class IPersonDatasource {
  Future<CreatePersonResponse> create(Map<String, dynamic> data);
}

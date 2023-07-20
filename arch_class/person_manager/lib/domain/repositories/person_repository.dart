import '../params/create_person_param.dart';
import '../responses/create_person_response.dart';

abstract interface class IPersonRepository {
  Future<CreatePersonResponse> create(CreatePersonParam param);
}

import '../../domain/entities/person_entity.dart';
import '../../domain/params/create_person_param.dart';

abstract class IPersonDatasource {
  Future<PersonEntity> create(CreatePersonParam param);
  Future<Map<String, dynamic>> createMap(Map<String, dynamic> data);
}

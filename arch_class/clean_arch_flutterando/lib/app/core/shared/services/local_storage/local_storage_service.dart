import 'helpers/params.dart';
import 'helpers/responses.dart';

abstract class LocalStorageService {
  Future<CreateLocalStorageResponse> save(CreateLocalStorageParam param);
  Future<Map<String, dynamic>> get(String key);
  Future<CreateLocalStorageResponse> create(CreateLocalStorageParam param);
  Future<Map<String, dynamic>> update(UpdateLocalStorageParam param);
  Future<List<Map<String, dynamic>>> getFiltered(
    GetFilteredLocalStorageParam param,
  );
}

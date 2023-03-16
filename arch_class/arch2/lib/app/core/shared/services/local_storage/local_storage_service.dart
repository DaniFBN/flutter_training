import 'helpers/params.dart';
import 'helpers/responses.dart';

abstract class LocalStorageService {
  Future<void> load();
  Future<CreateLocalStorageResponse> create(CreateLocalStorageParam param);
  Future<Map<String, dynamic>> update(UpdateLocalStorageParam param);
  Future<List<Map<String, dynamic>>> getFiltered(
    GetFilteredLocalStorageParam param,
  );
}

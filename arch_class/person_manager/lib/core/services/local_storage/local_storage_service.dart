import 'helpers/params.dart';
import 'helpers/responses.dart';

abstract interface class ILocalStorageService {
  Future<List<Map<String, dynamic>>> read(String table);
  Future<WriteLocalStorageResponse> write(WriteLocalStorageParam param);
}

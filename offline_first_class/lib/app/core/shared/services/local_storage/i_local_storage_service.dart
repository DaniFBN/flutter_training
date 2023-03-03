import 'helpers/params.dart';

abstract class ILocalStorageService {
  Future<List<Map<String, dynamic>>> get(GetLocalStorageParam param);
  Future<bool> replace(ReplaceLocalStorageParam param);
  Future<String> spread(SpreadLocalStorageParam param);
  Future<bool> delete(DeleteLocalStorageParam param);
}

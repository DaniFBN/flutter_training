abstract class ILocalStorage {
  Future<Map<String, dynamic>> add(String key, Map<String, dynamic> data);
  Future<List<Map<String, dynamic>>> get(String key);
}
